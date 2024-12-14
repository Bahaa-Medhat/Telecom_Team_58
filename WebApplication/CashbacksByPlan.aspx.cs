using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication
{
    public partial class CashbacksByPlan : System.Web.UI.Page
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            int walletID = int.Parse(txtWalletID.Text);
            int planID = int.Parse(txtPlanID.Text);

            GetCashbackAmount(walletID, planID);
        }

        private void GetCashbackAmount(int walletID, int planID)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("SELECT dbo.Wallet_Cashback_Amount(@walletID, @planID)", connection);
                    command.Parameters.AddWithValue("@walletID", walletID);
                    command.Parameters.AddWithValue("@planID", planID);

                    object result = command.ExecuteScalar();

                    if (result != null && result != DBNull.Value)
                    {
                        int cashbackAmount = Convert.ToInt32(result);
                        lblCashback.Text = $"Cashback Amount: {cashbackAmount:C}";
                    }
                    else
                    {
                        lblCashback.Text = "Cashback Amount: No cashback found for the given Wallet ID and Plan ID.";
                    }
                }
                catch (Exception ex)
                {
                    lblCashback.Text = $"Error: {ex.Message}";
                }
            }
        }
    }
}
