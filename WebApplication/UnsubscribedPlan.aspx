<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnsubscribedPlan.aspx.cs" Inherits="WebApplication.UnsubscribedPlans" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Unsubscribed Plans</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Unsubscribed Plans</h1>
            <p>View the plans you are not subscribed to:</p>

            <asp:GridView ID="gvUnsubscribedPlans" runat="server" CssClass="gridview" AutoGenerateColumns="False">
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
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" />
        </div>
    </form>
</body>
</html>
