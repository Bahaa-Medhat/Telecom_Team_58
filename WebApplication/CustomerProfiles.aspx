<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerProfiles.aspx.cs" Inherits="WebApplication.CustomerProfiles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Profiles</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Customer Profiles</h1>
            <p>Below is the list of customer profiles and their active accounts:</p>
            <asp:GridView ID="gvCustomerProfiles" runat="server" CssClass="gridview" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="nationalID" HeaderText="National ID" SortExpression="nationalID" />
                    <asp:TemplateField HeaderText="Name" SortExpression="first_name">
                        <ItemTemplate>
                            <%# Eval("first_name") + " " + Eval("last_name") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                    <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                    <asp:BoundField DataField="mobileNo" HeaderText="Mobile Number" SortExpression="mobileNo" />
                    <asp:BoundField DataField="account_type" HeaderText="Account Type" SortExpression="account_type" />
                    <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
