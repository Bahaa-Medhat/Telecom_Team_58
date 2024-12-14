<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanConsumption.aspx.cs" Inherits="WebApplication.PlanConsumption" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Plan Consumption</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navigation">
            <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btnBack" OnClick="btnBack_Click" />
            <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btnHome" OnClick="btnHome_Click" />
        </div>

        <div class="container">
            <h1>Plan Consumption</h1>
            <p>Enter the plan name and date range to view total consumption:</p>

            <label for="txtPlanName">Plan Name:</label>
            <asp:TextBox ID="txtPlanName" runat="server" CssClass="input-box" placeholder="Enter Plan Name"></asp:TextBox>
            <br />
            <label for="txtStartDate">Start Date:</label>
            <asp:TextBox ID="txtStartDate" runat="server" CssClass="input-box" TextMode="Date" placeholder="Select Start Date"></asp:TextBox>
            <br />
            <label for="txtEndDate">End Date:</label>
            <asp:TextBox ID="txtEndDate" runat="server" CssClass="input-box" TextMode="Date" placeholder="Select End Date"></asp:TextBox>
            <br />
            <asp:Button ID="btnViewConsumption" runat="server" Text="View Consumption" CssClass="btnSearch" OnClick="btnViewConsumption_Click" />
            <br /><br />
            <asp:GridView ID="gvConsumption" runat="server" CssClass="gridview" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="data_consumption" HeaderText="Data Consumption (MB)" />
                    <asp:BoundField DataField="minutes_used" HeaderText="Minutes Used" />
                    <asp:BoundField DataField="SMS_sent" HeaderText="SMS Sent" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" />
        </div>
    </form>
</body>
</html>
