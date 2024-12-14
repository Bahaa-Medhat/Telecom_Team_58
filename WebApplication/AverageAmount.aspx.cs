using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication
{
    public partial class AverageAmount : System.Web.UI.Page
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

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            int walletID = int.Parse(txtWalletID.Text);
            DateTime startDate = DateTime.Parse(txtStartDate.Text);
            DateTime endDate = DateTime.Parse(txtEndDate.Text);

            GetAverageTransactionAmount(walletID, startDate, endDate);
        }

        private void GetAverageTransactionAmount(int walletID, DateTime startDate, DateTime endDate)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("SELECT dbo.Wallet_Transfer_Amount(@walletID, @startDate, @endDate)", connection);
                    command.Parameters.AddWithValue("@walletID", walletID);
                    command.Parameters.AddWithValue("@startDate", startDate);
                    command.Parameters.AddWithValue("@endDate", endDate);

                    object result = command.ExecuteScalar();

                    if (result != null && result != DBNull.Value)
                    {
                        decimal averageAmount = Convert.ToDecimal(result);
                        lblAverageAmount.Text = $"Average Transaction Amount: {averageAmount:C}";
                    }
                    else
                    {
                        lblAverageAmount.Text = "No transactions found for the given criteria.";
                    }
                }
                catch (Exception ex)
                {
                    lblAverageAmount.Text = $"Error: {ex.Message}";
                }
            }
        }
    }
}
