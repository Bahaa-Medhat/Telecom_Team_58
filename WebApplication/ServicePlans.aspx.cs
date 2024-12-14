using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication
{
    public partial class ServicePlans : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadServicePlans();
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

        private void LoadServicePlans()
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    string query = "SELECT * FROM allServicePlans";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        if (dataTable.Rows.Count > 0)
                        {
                            gvServicePlans.DataSource = dataTable;
                            gvServicePlans.DataBind();
                        }
                        else
                        {
                            Response.Write("<script>alert('No service plans found.');</script>");
                        }
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
