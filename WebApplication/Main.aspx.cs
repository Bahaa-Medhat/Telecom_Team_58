using System;
using System.Web.UI;

namespace WebApplication
{
    public partial class Main : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        protected void btnCustomerLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerLogin.aspx");
        }
    }
}
