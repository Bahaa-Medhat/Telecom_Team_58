<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashbackAmount.aspx.cs" Inherits="WebApplication.CashbackAmount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cashback Amount</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Cashback Amount</h1>
            <p>Enter the details below to get the cashback amount:</p>

            <label for="txtPaymentId">Payment ID:</label>
            <asp:TextBox ID="txtPaymentId" runat="server" CssClass="input-box" placeholder="Enter Payment ID"></asp:TextBox>
            <br />

            <label for="txtBenefitId">Benefit ID:</label>
            <asp:TextBox ID="txtBenefitId" runat="server" CssClass="input-box" placeholder="Enter Benefit ID"></asp:TextBox>
            <br />

            <asp:Button ID="btnGetCashback" runat="server" Text="Get Cashback Amount" CssClass="btnSubmit" OnClick="btnGetCashback_Click" />
            <br /><br />

            <asp:Label ID="lblCashbackAmount" runat="server" CssClass="output-label" />
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" />
        </div>
    </form>
</body>
</html>
