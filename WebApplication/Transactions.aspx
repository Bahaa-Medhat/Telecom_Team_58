<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transactions.aspx.cs" Inherits="WebApplication.Transactions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment Transactions</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Payment Transactions and Accounts</h1>
            <p>Below is the list of all payment transactions along with their associated accounts:</p>

            <asp:GridView ID="gvTransactions" runat="server" CssClass="gridview" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="paymentID" HeaderText="Payment ID" SortExpression="paymentID" />
                    <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" />
                    <asp:BoundField DataField="date_of_payment" HeaderText="Date of Payment" SortExpression="date_of_payment" />
                    <asp:BoundField DataField="payment_method" HeaderText="Payment Method" SortExpression="payment_method" />
                    <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                    <asp:BoundField DataField="mobileNo" HeaderText="Mobile Number" SortExpression="mobileNo" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
