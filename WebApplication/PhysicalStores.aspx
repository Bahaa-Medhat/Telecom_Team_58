<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhysicalStores.aspx.cs" Inherits="WebApplication.PhysicalStores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Physical Stores and Vouchers</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Physical Stores and Their Vouchers</h1>
            <p>Below is the list of physical stores and the vouchers they have:</p>
            <asp:GridView ID="gvPhysicalStores" runat="server" CssClass="gridview" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="shopID" HeaderText="Store ID" SortExpression="shopID" />
                    <asp:BoundField DataField="address" HeaderText="Store Address" SortExpression="store_address" />
                    <asp:BoundField DataField="working_hours" HeaderText="Working Hours" SortExpression="working_hours" />
                    <asp:BoundField DataField="voucherID" HeaderText="Voucher ID" SortExpression="voucherID" />
                    <asp:BoundField DataField="value" HeaderText="Voucher Value" SortExpression="voucher_value" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
