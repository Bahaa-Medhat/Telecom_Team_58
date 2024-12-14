using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication
{
    public partial class RemoveBenefits : System.Web.UI.Page
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

        protected void btnRemoveBenefits_Click(object sender, EventArgs e)
        {
            string mobileNo = txtMobileNo.Text;
            int planID = int.Parse(txtPlanID.Text);

            RemoveBenefitsFromAccount(mobileNo, planID);
        }

        private void RemoveBenefitsFromAccount(string mobileNo, int planID)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("Benefits_Account", connection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    command.Parameters.AddWithValue("@mobile_num", mobileNo);
                    command.Parameters.AddWithValue("@plan_id", planID);

                    int result = command.ExecuteNonQuery();

                    if (result > 0)
                    {
                        lblMessage.Text = "Benefits have been successfully removed.";
                        lblMessage.CssClass = "success-message";
                    }
                    else
                    {
                        lblMessage.Text = "No benefits found for this account and plan.";
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
