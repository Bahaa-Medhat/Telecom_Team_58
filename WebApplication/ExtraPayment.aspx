<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExtraPayment.aspx.cs" Inherits="WebApplication.ExtraPayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Extra Payment</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Extra Payment</h1>
            <p>Enter your mobile number and plan name to view the extra payment amount:</p>

            <label for="txtPlanName">Plan Name:</label>
            <asp:TextBox ID="txtPlanName" runat="server" CssClass="input-box" placeholder="Enter Plan Name"></asp:TextBox>
            <br />
            <asp:Button ID="btnViewPayment" runat="server" Text="View Extra Payment" CssClass="btnSearch" OnClick="btnViewPayment_Click" />
            <br /><br />
            <asp:Label ID="lblExtraPayment" runat="server" CssClass="output-label" Text="" />
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" />
        </div>
    </form>
</body>
</html>
