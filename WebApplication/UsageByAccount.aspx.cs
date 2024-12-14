using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication
{
    public partial class UsageByAccount : System.Web.UI.Page
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
            DateTime date = DateTime.Parse(txtDate.Text);

            LoadUsageData(mobileNo, date);
        }

        private void LoadUsageData(string mobileNo, DateTime date)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("SELECT * FROM Account_Usage_Plan(@mobileNo, @date)", connection);
                    command.Parameters.AddWithValue("@mobileNo", mobileNo);
                    command.Parameters.AddWithValue("@date", date);

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    if (dataTable.Rows.Count > 0)
                    {
                        gvUsageByAccount.DataSource = dataTable;  // Bind the data to the GridView
                        gvUsageByAccount.DataBind();
                    }
                    else
                    {
                        Response.Write("<script>alert('No usage data found for the given mobile number and date.');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                }
            }
        }
    }
}
