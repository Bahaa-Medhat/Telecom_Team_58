<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerLogin.aspx.cs" Inherits="WebApplication.CustomerLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Login</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
        </div>

        <h1>Customer Login</h1>
        <div class="login-panel">
            <label for="txtMobileNo">Mobile Number:</label>
            <asp:TextBox ID="txtMobileNo" runat="server" CssClass="input-box" placeholder="Enter Mobile Number"></asp:TextBox>
            <br />
            <label for="txtPassword">Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="input-box" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />
            <br /><br />
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" />
        </div>
    </form>
</body>
</html>
