<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AverageAmount.aspx.cs" Inherits="WebApplication.AverageAmount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Average Transaction Amount</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Average Sent Transaction Amount</h1>
            <p>Enter the Wallet ID and the Start/End Date range to view the average transaction amount:</p>

            <label for="txtWalletID">Wallet ID:</label>
            <asp:TextBox ID="txtWalletID" runat="server" CssClass="input-box" />
            <br />
            <label for="txtStartDate">Start Date:</label>
            <asp:TextBox ID="txtStartDate" runat="server" CssClass="input-box" TextMode="Date" />
            <br />
            <label for="txtEndDate">End Date:</label>
            <asp:TextBox ID="txtEndDate" runat="server" CssClass="input-box" TextMode="Date" />
            <br />
            <asp:Button ID="btnCalculate" runat="server" Text="Calculate Average" OnClick="btnCalculate_Click" CssClass="btnSearch" />
            <br /><br />

            <asp:Label ID="lblAverageAmount" runat="server" CssClass="output-label" Text="Average Amount: " />
        </div>
    </form>
</body>
</html>
