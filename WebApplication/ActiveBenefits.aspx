<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActiveBenefits.aspx.cs" Inherits="WebApplication.ActiveBenefits" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Active Benefits</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Active Benefits</h1>
            <p>Below is the list of all active benefits:</p>

            <asp:GridView ID="gvActiveBenefits" runat="server" CssClass="gridview" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="benefitID" HeaderText="Benefit ID" />
                    <asp:BoundField DataField="description" HeaderText="Description" />
                    <asp:BoundField DataField="validity_date" HeaderText="Validity Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="status" HeaderText="Status" />
                    <asp:BoundField DataField="mobileNo" HeaderText="Mobile Number" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" />
        </div>
    </form>
</body>
</html>
