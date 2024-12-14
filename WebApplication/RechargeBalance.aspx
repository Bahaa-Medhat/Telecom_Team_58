<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RechargeBalance.aspx.cs" Inherits="WebApplication.RechargeBalance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Recharge Balance</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Recharge Balance</h1>
            <p>Enter the details below to recharge your balance:</p>

            <label for="txtAmount">Amount:</label>
            <asp:TextBox ID="txtAmount" runat="server" CssClass="input-box" placeholder="Enter Amount"></asp:TextBox>
            <br />

            <label for="ddlPaymentMethod">Payment Method:</label>
            <asp:DropDownList ID="ddlPaymentMethod" runat="server" CssClass="input-box">
                <asp:ListItem Text="Cash" Value="cash" />
                <asp:ListItem Text="Credit" Value="credit" />
            </asp:DropDownList>
            <br /><br />

            <asp:Button ID="btnRecharge" runat="server" Text="Recharge Balance" CssClass="btnSubmit" OnClick="btnRecharge_Click" />
            <br /><br />

            <asp:Label ID="lblMessage" runat="server" CssClass="output-label" />
        </div>
    </form>
</body>
</html>
