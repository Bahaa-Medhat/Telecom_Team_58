using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication
{
    public partial class RedeemVoucher : Page
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

        protected void btnRedeem_Click(object sender, EventArgs e)
        {
            DataTable customerAccountTable = (DataTable)Session["CustomerAccountTable"];
            String mobileNo = (string)customerAccountTable.Rows[0]["mobileNo"];
            string voucherIdText = txtVoucherId.Text.Trim();

            if (string.IsNullOrEmpty(mobileNo) || string.IsNullOrEmpty(voucherIdText))
            {
                lblMessage.Text = "All fields are required.";
                lblMessage.CssClass = "error-message";
                return;
            }

            if (!int.TryParse(voucherIdText, out int voucherId))
            {
                lblMessage.Text = "Please enter a valid numeric Voucher ID.";
                lblMessage.CssClass = "error-message";
                return;
            }

            RedeemVoucherPoints(mobileNo, voucherId);
        }

        private void RedeemVoucherPoints(string mobileNo, int voucherId)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("Redeem_Voucher_points", connection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    command.Parameters.AddWithValue("@mobile_num", mobileNo);
                    command.Parameters.AddWithValue("@voucher_id", voucherId);

                    command.ExecuteNonQuery();

                    lblMessage.Text = "Voucher redeemed successfully!";
                    lblMessage.CssClass = "success-message";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = $"Error: {ex.Message}";
                    lblMessage.CssClass = "error-message";
                }
            }
        }
    }
}
