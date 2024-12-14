<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubscribedPlans.aspx.cs" Inherits="WebApplication.SubscribedPlans" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Subscribed Plans</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>List of Customers Subscribed to a Plan on a Specific Date</h1>
            <p>Enter the Plan ID and Date to view all customer accounts subscribed to that plan:</p>

            <label for="txtPlanID">Plan ID:</label>
            <asp:TextBox ID="txtPlanID" runat="server" CssClass="input-box" />
            <br />
            <label for="txtDate">Date:</label>
            <asp:TextBox ID="txtDate" runat="server" CssClass="input-box" TextMode="Date" />
            <br />
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn-search" />
            <br /><br />

            <asp:GridView ID="gvSubscribedPlans" runat="server" CssClass="gridview" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="mobileNo" HeaderText="Mobile Number" SortExpression="mobileNo" />
                    <asp:BoundField DataField="planID" HeaderText="Plan ID" SortExpression="planID" />
                    <asp:BoundField DataField="name" HeaderText="Plan Name" SortExpression="name" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
