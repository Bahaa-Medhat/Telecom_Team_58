<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wallets.aspx.cs" Inherits="WebApplication.Wallets" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Wallets</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Customer Wallet Details</h1>
            <p>Below is the list of all wallets and their associated customer names:</p>

            <asp:GridView ID="gvWallets" runat="server" CssClass="gridview" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="walletID" HeaderText="Wallet ID" SortExpression="walletID" />
                    <asp:BoundField DataField="current_balance" HeaderText="Balance" SortExpression="current_balance" />
                    <asp:BoundField DataField="currency" HeaderText="Currency" SortExpression="currency" />
                    <asp:BoundField DataField="last_modified_date" HeaderText="Last Modified Date" SortExpression="last_modified_date" />
                    <asp:BoundField DataField="first_name" HeaderText="First Name" SortExpression="first_name" />
                    <asp:BoundField DataField="last_name" HeaderText="Last Name" SortExpression="last_name" />
                    <asp:BoundField DataField="mobileNo" HeaderText="Mobile Number" SortExpression="mobileNo" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
