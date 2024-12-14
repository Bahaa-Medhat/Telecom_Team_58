<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="WebApplication.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Main Page</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="center-container">
            <h1>Welcome</h1>
            <p>Select your role to log in:</p>

            <div class="button-container">
                <asp:Button ID="btnAdminLogin" runat="server" Text="Admin Login" CssClass="btnSubmit" OnClick="btnAdminLogin_Click" />
                <asp:Button ID="btnCustomerLogin" runat="server" Text="Customer Login" CssClass="btnSubmit" OnClick="btnCustomerLogin_Click" />
            </div>
        </div>
    </form>
</body>
</html>
