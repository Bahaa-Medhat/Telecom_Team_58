<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RedeemVoucher.aspx.cs" Inherits="WebApplication.RedeemVoucher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Redeem Voucher</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Redeem Voucher</h1>
            <p>Enter the details below to redeem your voucher:</p>

            <label for="txtVoucherId">Voucher ID:</label>
            <asp:TextBox ID="txtVoucherId" runat="server" CssClass="input-box" placeholder="Enter Voucher ID"></asp:TextBox>
            <br />

            <asp:Button ID="btnRedeem" runat="server" Text="Redeem Voucher" CssClass="btnSubmit" OnClick="btnRedeem_Click" />
            <br /><br />

            <asp:Label ID="lblMessage" runat="server" CssClass="output-label" />
        </div>
    </form>
</body>
</html>
