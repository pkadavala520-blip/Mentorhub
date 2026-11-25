using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;

namespace MentorHub.Mentor
{
    public class ProfileSyncHandler : IHttpHandler, IRequiresSessionState
    {
        SqlConnection con;
        SqlCommand cmd;

        string conStr = ConfigurationManager.ConnectionStrings["MentorHubConnection"].ConnectionString;

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";
            context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            context.Response.Cache.SetNoStore();

            // CHECK LOGIN
            if (context.Session["MentorID"] == null &&
                context.Session["MentorEmail"] == null)
            {
                context.Response.StatusCode = 401;

                Write(context, new { success = false });

                return;
            }

            int mentorId = 0;
            string mentorEmail = "";

            if (context.Session["MentorID"] != null)
            {
                mentorId = Convert.ToInt32(context.Session["MentorID"]);
            }
            else
            {
                mentorEmail = context.Session["MentorEmail"].ToString();
            }

            string name = "Mentor";
            string photo = "";

            try
            {
                // GET CONNECTION
                getcon();

                string query;

                // GET MENTOR DETAILS
                if (mentorId > 0)
                {
                    query = "SELECT FullName, ProfilePhoto FROM Mentor " +
                            "WHERE MentorID = " + mentorId;
                }
                else
                {
                    mentorEmail = mentorEmail.Replace("'", "''");

                    query = "SELECT FullName, ProfilePhoto FROM Mentor " +
                            "WHERE Email = '" + mentorEmail + "'";
                }

                cmd = new SqlCommand(query, con);

                SqlDataReader dr = cmd.ExecuteReader();

                // LOAD NAME AND PHOTO
                if (dr.Read())
                {
                    if (dr["FullName"] != DBNull.Value &&
                        dr["FullName"].ToString().Trim() != "")
                    {
                        name = dr["FullName"].ToString().Trim();
                    }

                    if (dr["ProfilePhoto"] != DBNull.Value)
                    {
                        photo = dr["ProfilePhoto"].ToString().Trim();
                    }
                }

                dr.Close();
                con.Close();

                // PHOTO PATH
                if (photo.StartsWith("~/"))
                {
                    photo = VirtualPathUtility.ToAbsolute(photo);
                }
                else if (photo.StartsWith("../ProfilePhotos/",
                    StringComparison.OrdinalIgnoreCase))
                {
                    photo = VirtualPathUtility.ToAbsolute(
                        "~/" + photo.Substring(3));
                }
                else if (photo.StartsWith("ProfilePhotos/",
                    StringComparison.OrdinalIgnoreCase))
                {
                    photo = VirtualPathUtility.ToAbsolute(
                        "~/" + photo);
                }

                // SEND JSON RESPONSE
                Write(context, new
                {
                    success = true,
                    name = name,
                    photo = photo,
                    initials = GetInitials(name)
                });
            }
            catch
            {
                if (con != null && con.State == System.Data.ConnectionState.Open)
                {
                    con.Close();
                }

                context.Response.StatusCode = 500;

                Write(context, new { success = false });
            }
        }

        // GET CONNECTION
        void getcon()
        {
            con = new SqlConnection(conStr);
            con.Open();
        }

        // GET INITIALS
        string GetInitials(string name)
        {
            string[] parts = (name ?? "Mentor").Split(
                new[] { ' ' },
                StringSplitOptions.RemoveEmptyEntries
            );

            if (parts.Length == 0)
            {
                return "M";
            }

            if (parts.Length == 1)
            {
                return parts[0].Substring(0, 1).ToUpper();
            }

            return (
                parts[0].Substring(0, 1) +
                parts[parts.Length - 1].Substring(0, 1)
            ).ToUpper();
        }

        // SEND JSON
        void Write(HttpContext context, object value)
        {
            JavaScriptSerializer js = new JavaScriptSerializer();

            context.Response.Write(js.Serialize(value));
        }

        public bool IsReusable
        {
            get
            {
                return true;
            }
        }
    }
}