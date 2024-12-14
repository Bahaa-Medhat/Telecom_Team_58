using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication
{
    public partial class AcceptedPayments : System.Web.UI.Page
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
            string mobileNo = txtMobileNo.Text;

            GetAcceptedPaymentsAndPoints(mobileNo);
        }

        private void GetAcceptedPaymentsAndPoints(string mobileNo)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("Account_Payment_Points", connection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    command.Parameters.AddWithValue("@mobile_num", mobileNo);

                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            int totalTransactions = reader["count"] != DBNull.Value
                                ? Convert.ToInt32(reader["count"])
                                : 0;

                            decimal totalPoints = reader["sum"] != DBNull.Value
                                ? Convert.ToDecimal(reader["sum"])
                                : 0m;

                            lblTransactions.Text = $"Total Transactions: {totalTransactions}";
                            lblPoints.Text = $"Total Points Earned: {totalPoints}";
                        }
                    }
                    else
                    {
                        lblTransactions.Text = "No transactions found for this account.";
                        lblPoints.Text = string.Empty;
                    }

                    reader.Close();
                }
                catch (Exception ex)
                {
                    lblTransactions.Text = $"Error: {ex.Message}";
                    lblPoints.Text = string.Empty;
                }
            }
        }



    }
}
