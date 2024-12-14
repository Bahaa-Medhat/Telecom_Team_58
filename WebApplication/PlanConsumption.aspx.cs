using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication
{
    public partial class PlanConsumption : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerDashboard.aspx");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Main.aspx");
        }

        protected void btnViewConsumption_Click(object sender, EventArgs e)
        {
            string planName = txtPlanName.Text.Trim();
            DateTime startDate, endDate;

            if (string.IsNullOrEmpty(planName) ||
                !DateTime.TryParse(txtStartDate.Text, out startDate) ||
                !DateTime.TryParse(txtEndDate.Text, out endDate))
            {
                lblMessage.Text = "Please enter valid plan name and date range.";
                return;
            }

            LoadConsumptionData(planName, startDate, endDate);
        }

        private void LoadConsumptionData(string planName, DateTime startDate, DateTime endDate)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("SELECT * FROM dbo.Consumption(@planName, @startDate, @endDate)", connection);
                    command.Parameters.AddWithValue("@planName", planName);
                    command.Parameters.AddWithValue("@startDate", startDate);
                    command.Parameters.AddWithValue("@endDate", endDate);

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    if (dataTable.Rows.Count > 0)
                    {
                        gvConsumption.DataSource = dataTable;
                        gvConsumption.DataBind();
                        lblMessage.Text = "";
                    }
                    else
                    {
                        lblMessage.Text = "No consumption data found for the specified criteria.";
                        gvConsumption.DataSource = null;
                        gvConsumption.DataBind();
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
