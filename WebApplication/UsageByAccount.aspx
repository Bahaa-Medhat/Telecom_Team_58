<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsageByAccount.aspx.cs" Inherits="WebApplication.UsageByAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Account Usage by Plan</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Account Usage for Each Plan</h1>
            <p>Enter the Mobile Number and Date to view the total usage for each subscribed plan:</p>

            <label for="txtMobileNo">Mobile Number:</label>
            <asp:TextBox ID="txtMobileNo" runat="server" CssClass="input-box" />
            <br />
            <label for="txtDate">Date:</label>
            <asp:TextBox ID="txtDate" runat="server" CssClass="input-box" TextMode="Date" />
            <br />
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn-search" />
            <br /><br />

            <asp:GridView ID="gvUsageByAccount" runat="server" CssClass="gridview" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="planID" HeaderText="Plan ID" SortExpression="planID" />
                    <asp:BoundField DataField="total data" HeaderText="Total Data (MB)" SortExpression="total_data" />
                    <asp:BoundField DataField="total mins" HeaderText="Total Minutes" SortExpression="total_mins" />
                    <asp:BoundField DataField="total SMS" HeaderText="Total SMS" SortExpression="total_SMS" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
