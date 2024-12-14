<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Eshops.aspx.cs" Inherits="WebApplication.Eshops" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>E-Shops and Redeemed Vouchers</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>E-Shops and Their Redeemed Vouchers</h1>
            <p>Below is the list of all E-shops along with their redeemed vouchers:</p>

            <asp:GridView ID="gvEshops" runat="server" CssClass="gridview" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="shopID" HeaderText="Shop ID" SortExpression="shopID" />
                    <asp:BoundField DataField="URL" HeaderText="Shop URL" SortExpression="URL" />
                    <asp:BoundField DataField="rating" HeaderText="Shop Rating" SortExpression="rating" />
                    <asp:BoundField DataField="voucherID" HeaderText="Voucher ID" SortExpression="voucherID" />
                    <asp:BoundField DataField="value" HeaderText="Voucher Value" SortExpression="value" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
