using System;

namespace MentorHub.Mentor
{
    public partial class Mentor_Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Existing MentorHub UI/data behavior is preserved by mentor-app.js.
                // Add database binding here when connecting this page to SQL Server.
            }
        }
    }
}
