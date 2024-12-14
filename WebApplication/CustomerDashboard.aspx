<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerDashboard.aspx.cs" Inherits="WebApplication.CustomerDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Dashboard</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <h1>Customer Dashboard</h1>
            <p>Select a functionality:</p>
            <div class="grid-container">
                <asp:Button ID="btnServicePlans" runat="server" Text="View Service Plans" CssClass="grid-item" OnClick="NavigateToServicePlans" />
                <asp:Button ID="btnConsumption" runat="server" Text="View Plan Consumption" CssClass="grid-item" OnClick="NavigateToPlanConsumption" />
                <asp:Button ID="btnUnsubscribedPlans" runat="server" Text="View Unsubscribed Plans" CssClass="grid-item" OnClick="NavigateToUnsubscribedPlans" />
                <asp:Button ID="btnCurrentMonthUsage" runat="server" Text="View Current Month Usage" CssClass="grid-item" OnClick="NavigateToCurrentMonthUsage" />
                <asp:Button ID="btnCashbackTransactions" runat="server" Text="View Cashback Transactions" CssClass="grid-item" OnClick="NavigateToCashbackTransactions" />
                <asp:Button ID="btnActiveBenefits" runat="server" Text="View Active Benefits" CssClass="grid-item" OnClick="NavigateToActiveBenefits" />
                <asp:Button ID="btnUnresolvedTickets" runat="server" Text="View Unresolved Tickets" CssClass="grid-item" OnClick="NavigateToUnresolvedTickets" />
                <asp:Button ID="btnHighestVoucher" runat="server" Text="View Highest Value Voucher" CssClass="grid-item" OnClick="NavigateToHighestVoucher" />
                <asp:Button ID="btnRemainingPayment" runat="server" Text="View Remaining Payment Amount" CssClass="grid-item" OnClick="NavigateToRemainingPayment" />
                <asp:Button ID="btnExtraPayment" runat="server" Text="View Extra Payment Amount" CssClass="grid-item" OnClick="NavigateToExtraPayment" />
                <asp:Button ID="btnTopPayments" runat="server" Text="View Top 10 Payments" CssClass="grid-item" OnClick="NavigateToTopPayments" />
                <asp:Button ID="btnAllShops" runat="server" Text="View All Shops" CssClass="grid-item" OnClick="NavigateToAllShops" />
                <asp:Button ID="btnPastPlans" runat="server" Text="View Plans Subscribed in Past 5 Months" CssClass="grid-item" OnClick="NavigateToPastPlans" />
                <asp:Button ID="btnRenewSubscription" runat="server" Text="Renew Subscription" CssClass="grid-item" OnClick="NavigateToRenewSubscription" />
                <asp:Button ID="btnCashbackAmount" runat="server" Text="Get Cashback Amount" CssClass="grid-item" OnClick="NavigateToCashbackAmount" />
                <asp:Button ID="btnRechargeBalance" runat="server" Text="Recharge Balance" CssClass="grid-item" OnClick="NavigateToRechargeBalance" />
            </div>
            <br />
                <asp:Button ID="btnRedeemVoucher" runat="server" Text="Redeem Voucher" CssClass="grid-item" OnClick="NavigateToRedeemVoucher" />
                <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="grid-item logout-button" OnClick="NavigateToLogin" />
        </div>
    </form>
</body>
</html>
