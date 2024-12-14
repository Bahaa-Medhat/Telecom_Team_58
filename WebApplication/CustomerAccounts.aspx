<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerAccounts.aspx.cs" Inherits="WebApplication.CustomerAccounts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Accounts and Subscribed Service Plans</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Customer Accounts and Subscribed Service Plans</h1>
            <p>Below is the list of customer accounts along with their subscribed service plans:</p>
        </div>
            <asp:GridView ID="gvCustomerAccounts" runat="server" CssClass="gridview" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="mobileNo" HeaderText="Mobile Number" SortExpression="mobileNo" />
                    <asp:BoundField DataField="pass" HeaderText="Password" SortExpression="pass" />
                    <asp:BoundField DataField="balance" HeaderText="Balance" SortExpression="balance" />
                    <asp:BoundField DataField="account_type" HeaderText="Account Type" SortExpression="account_type" />
                    <asp:BoundField DataField="start_date" HeaderText="Start Date" SortExpression="start_date" />
                    <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                    <asp:BoundField DataField="points" HeaderText="Points" SortExpression="points" />
                    <asp:BoundField DataField="nationalID" HeaderText="National ID" SortExpression="nationalID" />
                    <asp:BoundField DataField="planID" HeaderText="Plan ID" SortExpression="planID" />
                    <asp:BoundField DataField="name" HeaderText="Plan Name" SortExpression="name" />
                    <asp:BoundField DataField="price" HeaderText="Plan Price" SortExpression="price" />
                    <asp:BoundField DataField="SMS_offered" HeaderText="SMS Offered" SortExpression="SMS_offered" />
                    <asp:BoundField DataField="minutes_offered" HeaderText="Minutes Offered" SortExpression="minutes_offered" />
                    <asp:BoundField DataField="data_offered" HeaderText="Data Offered (MB)" SortExpression="data_offered" />
                    <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                </Columns>
            </asp:GridView>
    </form>
</body>
</html>
