<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="WebApplication.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <h1>Admin Dashboard</h1>
            <p>Select an option below to perform the required action:</p>
            <div class="grid-container">
                <asp:Button ID="btnViewCustomerProfiles" runat="server" Text="View Customer Profiles" OnClick="NavigateToCustomerProfiles" CssClass="grid-item" />
                <asp:Button ID="btnViewStores" runat="server" Text="View Physical Stores" OnClick="NavigateToStores" CssClass="grid-item" />
                <asp:Button ID="btnViewResolvedTickets" runat="server" Text="View Resolved Tickets" OnClick="NavigateToResolvedTickets" CssClass="grid-item" />
                <asp:Button ID="btnViewAccounts" runat="server" Text="View Customer Accounts" OnClick="NavigateToAccounts" CssClass="grid-item" />
                <asp:Button ID="btnSubscribedPlans" runat="server" Text="List Accounts by Plan" OnClick="NavigateToSubscribedPlans" CssClass="grid-item" />
                <asp:Button ID="btnUsageByAccount" runat="server" Text="Total Usage by Account" OnClick="NavigateToUsageByAccount" CssClass="grid-item" />
                <asp:Button ID="btnRemoveBenefits" runat="server" Text="Remove Account Benefits" OnClick="NavigateToRemoveBenefits" CssClass="grid-item" />
                <asp:Button ID="btnSmsOffers" runat="server" Text="List SMS Offers" OnClick="NavigateToSmsOffers" CssClass="grid-item" />
                <asp:Button ID="btnViewWallets" runat="server" Text="View Wallets" OnClick="NavigateToWallets" CssClass="grid-item" />
                <asp:Button ID="btnEshopsRedeemedVouchers" runat="server" Text="View E-shops with Vouchers" OnClick="NavigateToEshops" CssClass="grid-item" />
                <asp:Button ID="btnViewTransactions" runat="server" Text="View Payment Transactions" OnClick="NavigateToTransactions" CssClass="grid-item" />
                <asp:Button ID="btnViewTotalCashbacks" runat="server" Text="View Cashback" OnClick="NavigateToCashbacks" CssClass="grid-item" />
                <asp:Button ID="btnViewAcceptedPayments" runat="server" Text="View No. of Accepted Payments" OnClick="NavigateToAcceptedPayments" CssClass="grid-item" />
                <asp:Button ID="btnViewCashbacks" runat="server" Text="View Cashbacks by Plan" OnClick="NavigateToCachbacksByPlan" CssClass="grid-item" />
                <asp:Button ID="btnViewAverageAmount" runat="server" Text="View Avg. Transaction Amounts" OnClick="NavigateToAverageAmount" CssClass="grid-item" />
                <asp:Button ID="btnViewLinked" runat="server" Text="View Linked Wallet" OnClick="NavigateToLinked" CssClass="grid-item" />
            </div> <br />

            <asp:Button ID="btnUpdatePoints" runat="server" Text="Update Total Points" OnClick="NavigateToUpdatePoints" CssClass="grid-item" />
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="Logout" CssClass="grid-item logout-button" />
        </div>
    </form>
</body>
</html>
