using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication
{
    public partial class CustomerLogin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Main.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string mobileNo = txtMobileNo.Text.Trim();
            string password = txtPassword.Text;

            if (string.IsNullOrEmpty(mobileNo) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Please enter both mobile number and password.";
                return;
            }

            if (ValidateLogin(mobileNo, password))
            {
                StoreCustomerAccount(mobileNo);
                Response.Redirect("CustomerDashboard.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid mobile number or password.";
            }
        }

        private bool ValidateLogin(string mobileNo, string password)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("SELECT dbo.AccountLoginValidation(@mobileNo, @password)", connection);
                    command.Parameters.AddWithValue("@mobileNo", mobileNo);
                    command.Parameters.AddWithValue("@password", password);

                    object result = command.ExecuteScalar();
                    return result != null && Convert.ToBoolean(result);
                }
                catch (Exception ex)
                {
                    lblMessage.Text = $"Error: {ex.Message}";
                    return false;
                }
            }
        }

        private void StoreCustomerAccount(string mobileNo)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    string query = "SELECT * FROM allCustomerAccounts WHERE mobileNo = @mobileNo";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@mobileNo", mobileNo);

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable customerAccountTable = new DataTable();
                    adapter.Fill(customerAccountTable);

                    if (customerAccountTable.Rows.Count > 0)
                    {
                        Session["CustomerAccountTable"] = customerAccountTable;
                    }
                    else
                    {
                        throw new Exception("No customer account data found for the given mobile number.");
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = $"Error while fetching account data: {ex.Message}";
                    lblMessage.CssClass = "error-message";
                }
            }
        }

    }
}
