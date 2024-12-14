﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication
{
    public partial class Wallets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadWallets();
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashboard.aspx");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Main.aspx");
        }

        private void LoadWallets()
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Telecom_Company;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    string query = "SELECT * FROM CustomerWallet";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        if (dataTable.Rows.Count > 0)
                        {
                            gvWallets.DataSource = dataTable;
                            gvWallets.DataBind();
                        }
                        else
                        {
                            Response.Write("<script>alert('No wallets found.');</script>");
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