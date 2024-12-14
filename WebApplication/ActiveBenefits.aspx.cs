using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication
{
    public partial class ActiveBenefits : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadActiveBenefits();
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

        private void LoadActiveBenefits()
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    string query = "SELECT * FROM allBenefits WHERE status = 'active'";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        if (dataTable.Rows.Count > 0)
                        {
                            gvActiveBenefits.DataSource = dataTable;
                            gvActiveBenefits.DataBind();
                            lblMessage.Text = "";
                        }
                        else
                        {
                            lblMessage.Text = "No active benefits found.";
                            gvActiveBenefits.DataSource = null;
                            gvActiveBenefits.DataBind();
                        }
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
