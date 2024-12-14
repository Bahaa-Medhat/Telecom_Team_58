<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RemoveBenefits.aspx.cs" Inherits="WebApplication.RemoveBenefits" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Remove Benefits</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Remove Benefits for a Plan</h1>
            <p>Enter the Mobile Number and Plan ID to remove all associated benefits:</p>

            <label for="txtMobileNo">Mobile Number:</label>
            <asp:TextBox ID="txtMobileNo" runat="server" CssClass="input-box" />
            <br />
            <label for="txtPlanID">Plan ID:</label>
            <asp:TextBox ID="txtPlanID" runat="server" CssClass="input-box" />
            <br />
            <asp:Button ID="btnRemoveBenefits" runat="server" Text="Remove Benefits" OnClick="btnRemoveBenefits_Click" CssClass="btn-remove" />
            <br /><br />

            <asp:Label ID="lblMessage" runat="server" CssClass="message" />
        </div>
    </form>
</body>
</html>
