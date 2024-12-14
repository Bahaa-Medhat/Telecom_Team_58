using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication
{
    public partial class CashbackTransactions : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CustomerAccountTable"] != null)
                {
                    DataTable customerAccountTable = (DataTable)Session["CustomerAccountTable"];
                    int nationalID = Convert.ToInt32(customerAccountTable.Rows[0]["nationalID"]);
                    LoadCashbackTransactions(nationalID);
                }
                else
                {
                    lblMessage.Text = "Your session has expired. Redirecting to login page...";
                    lblMessage.CssClass = "error-message";
                    Response.Redirect("CustomerLogin.aspx");
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerDashboard.aspx");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Main.aspx");
        }

        private void LoadCashbackTransactions(int nationalID)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("SELECT * FROM dbo.Cashback_Wallet_Customer(@NID)", connection);
                    command.Parameters.AddWithValue("@NID", nationalID);

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    if (dataTable.Rows.Count > 0)
                    {
                        gvCashbacks.DataSource = dataTable;
                        gvCashbacks.DataBind();
                        lblMessage.Text = "";
                    }
                    else
                    {
                        lblMessage.Text = "No cashback transactions found for the specified National ID.";
                        gvCashbacks.DataSource = null;
                        gvCashbacks.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = $"Error: {ex.Message}";
                }
            }
        }
    }
}
