<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Linked.aspx.cs" Inherits="WebApplication.Linked" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Check Wallet Link</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Check if Mobile Number is Linked to a Wallet</h1>
            <p>Enter the Mobile Number to check if it's linked to a wallet:</p>

            <label for="txtMobileNo">Mobile Number:</label>
            <asp:TextBox ID="txtMobileNo" runat="server" CssClass="input-box" />
            <br />
            <asp:Button ID="btnCheck" runat="server" Text="Check" OnClick="btnCheck_Click" CssClass="btnSearch" />
            <br /><br />

            <asp:Label ID="lblResult" runat="server" CssClass="output-label" Text="Result: " />
        </div>
    </form>
</body>
</html>
