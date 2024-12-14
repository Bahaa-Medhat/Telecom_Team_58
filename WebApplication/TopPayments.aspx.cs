using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication
{
    public partial class TopPayments : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CustomerAccountTable"] != null)
                {
                    DataTable customerAccountTable = (DataTable)Session["CustomerAccountTable"];
                    GetTopPayments((string)customerAccountTable.Rows[0]["mobileNo"]);
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

        private void GetTopPayments(string mobileNo)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("Top_Successful_Payments", connection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    command.Parameters.AddWithValue("@mobile_num", mobileNo);

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    if (dataTable.Rows.Count > 0)
                    {
                        gvTopPayments.DataSource = dataTable;
                        gvTopPayments.DataBind();
                        lblMessage.Text = "";
                    }
                    else
                    {
                        lblMessage.Text = "No successful payments found for the specified account.";
                        gvTopPayments.DataSource = null;
                        gvTopPayments.DataBind();
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
