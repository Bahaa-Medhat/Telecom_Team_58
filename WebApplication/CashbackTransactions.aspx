<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashbackTransactions.aspx.cs" Inherits="WebApplication.CashbackTransactions" %>

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
            <p>View all cashback transactions:</p>

            <asp:GridView ID="gvCashbacks" runat="server" CssClass="gridview" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="cashbackID" HeaderText="Cashback ID" />
                    <asp:BoundField DataField="benefitID" HeaderText="Benefit ID" />
                    <asp:BoundField DataField="walletID" HeaderText="Wallet ID" />
                    <asp:BoundField DataField="amount" HeaderText="Amount" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="credit_date" HeaderText="Credit Date" DataFormatString="{0:yyyy-MM-dd}" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" />
        </div>
    </form>
</body>
</html>
