<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="WebApplication.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="navigation">
       <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
    </div>
    <h1>Admin Login</h1>
    <asp:Panel ID="LoginPanel" runat="server" CssClass="login-panel">
        <table>
            <tr>
                <td><asp:Label ID="lblAdminId" runat="server" Text="Admin ID:" /></td>
                <td><asp:TextBox ID="txtAdminId" runat="server" CssClass="input-box" /></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblPassword" runat="server" Text="Password:" /></td>
                <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input-box" /></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Label ID="lblMessage" runat="server" CssClass="error-message" />
</form>
</body>
</html>
