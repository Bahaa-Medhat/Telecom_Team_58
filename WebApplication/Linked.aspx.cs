using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication
{
    public partial class Linked : System.Web.UI.Page
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

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            string mobileNo = txtMobileNo.Text;

            CheckIfLinked(mobileNo);
        }

        private void CheckIfLinked(string mobileNo)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("SELECT dbo.Wallet_MobileNo(@mobileNo)", connection);
                    command.Parameters.AddWithValue("@mobileNo", mobileNo);

                    object result = command.ExecuteScalar();

                    if (result != null && result != DBNull.Value)
                    {
                        int walletID = Convert.ToInt32(result);

                        if (walletID > 0)
                        {
                            lblResult.Text = $"The mobile number is linked to a wallet (Wallet ID: {walletID}).";
                        }
                        else
                        {
                            lblResult.Text = "The mobile number is not linked to any wallet.";
                        }
                    }
                    else
                    {
                        lblResult.Text = "The mobile number is not linked to any wallet.";
                    }
                }
                catch (Exception ex)
                {
                    lblResult.Text = $"Error: {ex.Message}";
                }
            }
        }
    }
}
