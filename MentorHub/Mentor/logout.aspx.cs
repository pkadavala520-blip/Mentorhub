using System;

namespace MentorHub.Mentor
{
    public partial class Logout : MentorPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Home/SignIn_up.aspx");
        }
    }
}