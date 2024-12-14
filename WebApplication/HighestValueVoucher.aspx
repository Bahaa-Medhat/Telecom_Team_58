<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HighestValueVoucher.aspx.cs" Inherits="WebApplication.HighestValueVoucher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Highest Value Voucher</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Highest Value Voucher</h1>
            <p>View the voucher ID of the highest value:</p>

            <asp:GridView ID="gvHighestVoucher" runat="server" CssClass="gridview" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="voucherID" HeaderText="Voucher ID" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" />
        </div>
    </form>
</body>
</html>
