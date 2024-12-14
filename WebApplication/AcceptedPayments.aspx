<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AcceptedPayments.aspx.cs" Inherits="WebApplication.AcceptedPayments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Accepted Payments</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Accepted Payments and Earned Points</h1>
            <p>Enter the Mobile Number to view the number of accepted payments and total earned points in the last year:</p>

            <label for="txtMobileNo">Mobile Number:</label>
            <asp:TextBox ID="txtMobileNo" runat="server" CssClass="input-box" />
            <br />
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn-search" />
            <br /><br />

            <asp:Label ID="lblTransactions" runat="server" CssClass="output-label" Text="Total Transactions: " />
            <br />
            <asp:Label ID="lblPoints" runat="server" CssClass="output-label" Text="Total Points Earned: " />
        </div>
    </form>
</body>
</html>
