<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cashbacks.aspx.cs" Inherits="WebApplication.Cashbacks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cashback Transactions</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Cashback Transactions</h1>
            <p>Below is the list of total cashback transactions per wallet ID:</p>

            <asp:GridView ID="gvCashbacks" runat="server" CssClass="gridview" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="walletID" HeaderText="Wallet ID" SortExpression="walletID" />
                    <asp:BoundField DataField="count of transactions" HeaderText="Number of Transactions" SortExpression="count_of_Transaction" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
