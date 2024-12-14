<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrentMonthUsage.aspx.cs" Inherits="WebApplication.CurrentMonthUsage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Current Month Usage</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Current Month Usage</h1>
            <p>View the usage of your active plans during the current month:</p>

            <asp:GridView ID="gvUsage" runat="server" CssClass="gridview" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="data_consumption" HeaderText="Data Consumption (MB)" />
                    <asp:BoundField DataField="minutes_used" HeaderText="Minutes Used" />
                    <asp:BoundField DataField="SMS_sent" HeaderText="SMS Sent" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" />
        </div>
    </form>
</body>
</html>
