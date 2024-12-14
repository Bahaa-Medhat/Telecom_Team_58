using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication
{
    public partial class UpdatePoints : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashboard.aspx");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Main.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string mobileNo = txtMobileNo.Text;

            if (!string.IsNullOrEmpty(mobileNo))
            {
                UpdatePointsForAccount(mobileNo);
            }
            else
            {
                lblMessage.Text = "Please enter a valid mobile number.";
                lblMessage.CssClass = "error-message";
            }
        }

        private void UpdatePointsForAccount(string mobileNo)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("Total_Points_Account", connection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    command.Parameters.AddWithValue("@mobile_num", mobileNo);

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        lblMessage.Text = "Points updated successfully!";
                        lblMessage.CssClass = "success-message";
                    }
                    else
                    {
                        lblMessage.Text = "No account found for this mobile number.";
                        lblMessage.CssClass = "error-message";
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = $"Error: {ex.Message}";
                    lblMessage.CssClass = "error-message";
                }
            }
        }
    }
}
