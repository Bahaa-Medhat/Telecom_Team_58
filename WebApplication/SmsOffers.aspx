<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SmsOffers.aspx.cs" Inherits="WebApplication.SmsOffers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SMS Offers</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>List of SMS Offers</h1>
            <p>Enter the Mobile Number to view all SMS offers for the account:</p>

            <label for="txtMobileNo">Mobile Number:</label>
            <asp:TextBox ID="txtMobileNo" runat="server" CssClass="input-box" />
            <br />
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn-search" />
            <br /><br />

            <asp:GridView ID="gvSmsOffers" runat="server" CssClass="gridview" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="offerID" HeaderText="Offer ID" SortExpression="offerID" />
                    <asp:BoundField DataField="benefitID" HeaderText="Benefit ID" SortExpression="benefitID" />
                    <asp:BoundField DataField="internet_offered" HeaderText="Internet Offered (MB)" SortExpression="internet_offered" />
                    <asp:BoundField DataField="SMS_offered" HeaderText="SMS Offered" SortExpression="SMS_offered" />
                    <asp:BoundField DataField="minutes_offered" HeaderText="Minutes Offered" SortExpression="minutes_offered" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
