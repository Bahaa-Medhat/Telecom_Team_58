using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication
{
    public partial class CashbackAmount : Page
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

        protected void btnGetCashback_Click(object sender, EventArgs e)
        {
            DataTable customerAccountTable = (DataTable)Session["CustomerAccountTable"];
            String mobileNo = (string)customerAccountTable.Rows[0]["mobileNo"];
            string paymentIdText = txtPaymentId.Text.Trim();
            string benefitIdText = txtBenefitId.Text.Trim();

            if (string.IsNullOrEmpty(mobileNo) || string.IsNullOrEmpty(paymentIdText) || string.IsNullOrEmpty(benefitIdText))
            {
                lblMessage.Text = "All fields are required.";
                lblCashbackAmount.Text = "";
                return;
            }

            if (!int.TryParse(paymentIdText, out int paymentId) || !int.TryParse(benefitIdText, out int benefitId))
            {
                lblMessage.Text = "Please enter valid numeric values for Payment ID and Benefit ID.";
                lblCashbackAmount.Text = "";
                return;
            }

            GetCashbackAmount(mobileNo, paymentId, benefitId);
        }

        private void GetCashbackAmount(string mobileNo, int paymentId, int benefitId)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("Payment_wallet_cashback", connection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    command.Parameters.AddWithValue("@mobile_num", mobileNo);
                    command.Parameters.AddWithValue("@payment_id", paymentId);
                    command.Parameters.AddWithValue("@benefit_id", benefitId);

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        lblCashbackAmount.Text = "Process succeeded: Cashback recorded.";
                        lblMessage.Text = "";
                    }
                    else
                    {
                        lblCashbackAmount.Text = "No cashback transactions found for the given details.";
                        lblMessage.Text = "";
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = $"Error: {ex.Message}";
                    lblCashbackAmount.Text = "";
                }
            }
        }
    }
}
