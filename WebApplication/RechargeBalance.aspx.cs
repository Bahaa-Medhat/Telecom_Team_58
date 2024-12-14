using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication
{
    public partial class RechargeBalance : Page
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

        protected void btnRecharge_Click(object sender, EventArgs e)
        {
            DataTable customerAccountTable = (DataTable)Session["CustomerAccountTable"];
            String mobileNo = (string)customerAccountTable.Rows[0]["mobileNo"];
            string amountText = txtAmount.Text.Trim();
            string paymentMethod = ddlPaymentMethod.SelectedValue;

            if (string.IsNullOrEmpty(mobileNo) || string.IsNullOrEmpty(amountText) || string.IsNullOrEmpty(paymentMethod))
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

            RechargeAccountBalance(mobileNo, amount, paymentMethod);
        }

        private void RechargeAccountBalance(string mobileNo, decimal amount, string paymentMethod)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("Initiate_balance_payment", connection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    command.Parameters.AddWithValue("@mobile_num", mobileNo);
                    command.Parameters.AddWithValue("@amount", amount);
                    command.Parameters.AddWithValue("@payment_method", paymentMethod);

                    command.ExecuteNonQuery();

                    lblMessage.Text = "Balance recharged successfully!";
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
