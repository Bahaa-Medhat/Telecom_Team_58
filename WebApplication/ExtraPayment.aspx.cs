using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication
{
    public partial class ExtraPayment : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerDashboard.aspx");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Main.aspx");
        }

        protected void btnViewPayment_Click(object sender, EventArgs e)
        {
            DataTable customerAccountTable = (DataTable)Session["CustomerAccountTable"];
            String mobileNo = (string)customerAccountTable.Rows[0]["mobileNo"];
            string planName = txtPlanName.Text.Trim();

            if (string.IsNullOrEmpty(planName))
            {
                lblMessage.Text = "Please enter a valid plan name.";
                lblExtraPayment.Text = "";
                return;
            }

            GetExtraPayment(mobileNo, planName);
        }

        private void GetExtraPayment(string mobileNo, string planName)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("SELECT dbo.Extra_plan_amount(@mobile_num, @plan_name)", connection);

                    command.Parameters.AddWithValue("@mobile_num", mobileNo);
                    command.Parameters.AddWithValue("@plan_name", planName);

                    object result = command.ExecuteScalar();

                    if (result != null && int.TryParse(result.ToString(), out int extraAmount))
                    {
                        lblExtraPayment.Text = $"Extra Payment Amount: {extraAmount}";
                        lblMessage.Text = "";
                    }
                    else
                    {
                        lblExtraPayment.Text = "No extra payment found for the specified account and plan.";
                        lblMessage.Text = "";
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = $"Error: {ex.Message}";
                    lblExtraPayment.Text = "";
                }
            }
        }
    }
}
