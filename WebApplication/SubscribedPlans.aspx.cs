using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication
{
    public partial class SubscribedPlans : System.Web.UI.Page
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
            int planID = int.Parse(txtPlanID.Text);
            DateTime date = DateTime.Parse(txtDate.Text);

            LoadSubscribedPlans(planID, date);
        }

        private void LoadSubscribedPlans(int planID, DateTime date)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("SELECT * FROM Account_Plan_date(@date, @planID)", connection);
                    command.Parameters.AddWithValue("@planID", planID);
                    command.Parameters.AddWithValue("@date", date);

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    if (dataTable.Rows.Count > 0)
                    {
                        gvSubscribedPlans.DataSource = dataTable;
                        gvSubscribedPlans.DataBind();
                    }
                    else
                    {
                        Response.Write("<script>alert('No customers found for the selected plan and date.');</script>");
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
