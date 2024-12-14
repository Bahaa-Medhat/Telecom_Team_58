<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashbacksByPlan.aspx.cs" Inherits="WebApplication.CashbacksByPlan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cashbacks by Plan</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Cashbacks by Plan</h1>
            <p>Enter the Wallet ID and Plan ID to view the cashback amount:</p>

            <label for="txtWalletID">Wallet ID:</label>
            <asp:TextBox ID="txtWalletID" runat="server" CssClass="input-box" />
            <br />
            <label for="txtPlanID">Plan ID:</label>
            <asp:TextBox ID="txtPlanID" runat="server" CssClass="input-box" />
            <br />
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn-search" />
            <br /><br />

            <asp:Label ID="lblCashback" runat="server" CssClass="output-label" Text="Cashback Amount: " />
        </div>
    </form>
</body>
</html>
