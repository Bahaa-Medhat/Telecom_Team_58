using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication
{
    public partial class CurrentMonthUsage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CustomerAccountTable"] != null)
                {
                    DataTable customerAccountTable = (DataTable)Session["CustomerAccountTable"];
                    LoadUsageData((string)customerAccountTable.Rows[0]["mobileNo"]);
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

        private void LoadUsageData(string mobileNo)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("SELECT * FROM dbo.Usage_Plan_CurrentMonth(@mobileNo)", connection);
                    command.Parameters.AddWithValue("@mobileNo", mobileNo);

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    if (dataTable.Rows.Count > 0)
                    {
                        gvUsage.DataSource = dataTable;
                        gvUsage.DataBind();
                        lblMessage.Text = "";
                    }
                    else
                    {
                        lblMessage.Text = "No usage data found for the current month.";
                        gvUsage.DataSource = null;
                        gvUsage.DataBind();
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
