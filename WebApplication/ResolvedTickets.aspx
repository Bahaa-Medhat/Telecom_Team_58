<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResolvedTickets.aspx.cs" Inherits="WebApplication.ResolvedTickets" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Resolved Tickets</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Resolved Technical Support Tickets</h1>
            <p>Below is the list of all resolved tickets:</p>
            <asp:GridView ID="gvResolvedTickets" runat="server" CssClass="gridview" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="ticketID" HeaderText="Ticket ID" SortExpression="ticketID" />
                    <asp:BoundField DataField="mobileNo" HeaderText="Mobile Number" SortExpression="mobileNo" />
                    <asp:BoundField DataField="issue_description" HeaderText="Issue Description" SortExpression="issue_description" />
                    <asp:BoundField DataField="priority_level" HeaderText="Priority Level" SortExpression="priority_level" />
                    <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
