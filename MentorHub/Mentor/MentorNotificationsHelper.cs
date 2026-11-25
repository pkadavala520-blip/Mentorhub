
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace MentorHub.Mentor
{
    public class MentorNotificationsHelper
    {
        public static void LoadNotifications(
            int mentorId,
            Repeater rptTopNotifications,
            Label lblNotifDot,
            Panel pnlTopEmpty)
        {
            string cs = ConfigurationManager
                .ConnectionStrings["MentorHubConnection"]
                .ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // GET UNREAD NOTIFICATION COUNT
                string countQuery =
                    "SELECT COUNT(*) FROM dbo.MentorNotifications " +
                    "WHERE MentorID = " + mentorId +
                    " AND IsRead = 0";

                int unreadCount = Convert.ToInt32(
                    new SqlCommand(countQuery, con).ExecuteScalar()
                );

                lblNotifDot.Visible = unreadCount > 0;

                // GET LATEST FIVE NOTIFICATIONS
                string query =
                    "SELECT TOP 5 NotificationID, Title, Message, " +
                    "NotificationType, IsRead, CreatedAt " +
                    "FROM dbo.MentorNotifications " +
                    "WHERE MentorID = " + mentorId +
                    " ORDER BY CreatedAt DESC";

                using (SqlDataAdapter da = new SqlDataAdapter(query, con))
                {
                    DataTable dt = new DataTable();

                    da.Fill(dt);

                    rptTopNotifications.DataSource = dt;
                    rptTopNotifications.DataBind();

                    pnlTopEmpty.Visible = dt.Rows.Count == 0;
                }
            }
        }
    }
}
