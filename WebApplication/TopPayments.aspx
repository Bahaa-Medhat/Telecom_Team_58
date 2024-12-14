<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopPayments.aspx.cs" Inherits="WebApplication.TopPayments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Top 10 Payments</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Top 10 Payments</h1>
            <p>Enter your mobile number to view the top 10 successful payments with the highest value:</p>

            <asp:GridView ID="gvTopPayments" runat="server" CssClass="gridview" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="paymentID" HeaderText="Payment ID" />
                    <asp:BoundField DataField="amount" HeaderText="Amount" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="date_of_payment" HeaderText="Date of Payment" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="payment_method" HeaderText="Payment Method" />
                    <asp:BoundField DataField="status" HeaderText="Status" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" />
        </div>
    </form>
</body>
</html>
