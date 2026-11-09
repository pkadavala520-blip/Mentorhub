using System;
using System.Web.UI;

namespace MentorHub.Mentor
{
    /// <summary>Common place for Mentor authentication/session checks.</summary>
    public class MentorBasePage : Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            // Example when login is connected:
            // if (Session["MentorId"] == null) Response.Redirect("../Home/login.aspx");
        }
    }
}
