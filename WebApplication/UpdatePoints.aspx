<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePoints.aspx.cs" Inherits="WebApplication.UpdatePoints" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Points</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Update Earned Points</h1>
            <p>Enter the Mobile Number to update the earned points:</p>

            <label for="txtMobileNo">Mobile Number:</label>
            <asp:TextBox ID="txtMobileNo" runat="server" CssClass="input-box" />
            <br />
            <asp:Button ID="btnUpdate" runat="server" Text="Update Points" OnClick="btnUpdate_Click" CssClass="btnSearch" />
            <br /><br />

            <asp:Label ID="lblMessage" runat="server" CssClass="output-label" Text="Result: " />
        </div>
    </form>
</body>
</html>
