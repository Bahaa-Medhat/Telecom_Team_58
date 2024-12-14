using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication
{
    public partial class SmsOffers : System.Web.UI.Page
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

            LoadSmsOffers(mobileNo);
        }

        private void LoadSmsOffers(string mobileNo)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("SELECT * FROM Account_SMS_Offers(@mobileNo)", connection);
                    command.Parameters.AddWithValue("@mobileNo", mobileNo);

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    if (dataTable.Rows.Count > 0)
                    {
                        gvSmsOffers.DataSource = dataTable;
                        gvSmsOffers.DataBind();
                    }
                    else
                    {
                        Response.Write("<script>alert('No SMS offers found for this mobile number.');</script>");
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
