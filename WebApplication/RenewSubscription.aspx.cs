using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication
{
    public partial class RenewSubscription : Page
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

        protected void btnRenew_Click(object sender, EventArgs e)
        {

            DataTable customerAccountTable = (DataTable)Session["CustomerAccountTable"];
            String mobileNo = (string)customerAccountTable.Rows[0]["mobileNo"];
            string planId = txtPlanId.Text.Trim();
            string amountText = txtAmount.Text.Trim();
            string paymentMethod = ddlPaymentMethod.SelectedValue;

            if (string.IsNullOrEmpty(mobileNo) || string.IsNullOrEmpty(planId) || string.IsNullOrEmpty(amountText) || string.IsNullOrEmpty(paymentMethod))
            {
                lblMessage.Text = "All fields are required.";
                lblMessage.CssClass = "error-message";
                return;
            }

            if (!decimal.TryParse(amountText, out decimal amount) || amount <= 0)
            {
                lblMessage.Text = "Please enter a valid positive amount.";
                lblMessage.CssClass = "error-message";
                return;
            }

            RenewPlanSubscription(mobileNo, amount, paymentMethod, planId);
        }

        private void RenewPlanSubscription(string mobileNo, decimal amount, string paymentMethod, string planId)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("Initiate_plan_payment", connection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    command.Parameters.AddWithValue("@mobile_num", mobileNo);
                    command.Parameters.AddWithValue("@amount", amount);
                    command.Parameters.AddWithValue("@payment_method", paymentMethod);
                    command.Parameters.AddWithValue("@plan_id", planId);

                    command.ExecuteNonQuery();

                    lblMessage.Text = "Subscription renewed successfully!";
                    lblMessage.CssClass = "success-message";
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
