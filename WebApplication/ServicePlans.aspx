<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServicePlans.aspx.cs" Inherits="WebApplication.ServicePlans" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Service Plans</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Available Service Plans</h1>
            <p>Below is the list of all available service plans:</p>
            <asp:GridView ID="gvServicePlans" runat="server" CssClass="gridview" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="planID" HeaderText="Plan ID" />
                    <asp:BoundField DataField="name" HeaderText="Name" />
                    <asp:BoundField DataField="price" HeaderText="Price" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="SMS_offered" HeaderText="SMS Offered" />
                    <asp:BoundField DataField="minutes_offered" HeaderText="Minutes Offered" />
                    <asp:BoundField DataField="data_offered" HeaderText="Data Offered (MB)" />
                    <asp:BoundField DataField="description" HeaderText="Description" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
