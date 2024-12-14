using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string adminId = "admin123"; // Hard-coded Admin ID
            string password = "password"; // Hard-coded Password

            if (txtAdminId.Text == adminId && txtPassword.Text == password)
            {
                lblMessage.Text = "Login successful!";
                lblMessage.CssClass = "success-message"; // Optional CSS for success message
                Response.Redirect("AdminDashboard.aspx"); // Navigate to Admin Dashboard
            }
            else
            {
                lblMessage.Text = "Invalid Admin ID or Password.";
            }
        }
    }
}