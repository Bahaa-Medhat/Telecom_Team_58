using System;

namespace WebApplication
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void NavigateToCustomerProfiles(object sender, EventArgs e)
        {
            Response.Redirect("CustomerProfiles.aspx");
        }

        protected void NavigateToStores(object sender, EventArgs e)
        {
            Response.Redirect("PhysicalStores.aspx");
        }

        protected void NavigateToResolvedTickets(object sender, EventArgs e)
        {
            Response.Redirect("ResolvedTickets.aspx");
        }

        protected void NavigateToAccounts(object sender, EventArgs e)
        {
            Response.Redirect("CustomerAccounts.aspx");
        }

        protected void NavigateToSubscribedPlans(object sender, EventArgs e)
        {
            Response.Redirect("SubscribedPlans.aspx");
        }

        protected void NavigateToUsageByAccount(object sender, EventArgs e)
        {
            Response.Redirect("UsageByAccount.aspx");
        }

        protected void NavigateToRemoveBenefits(object sender, EventArgs e)
        {
            Response.Redirect("RemoveBenefits.aspx");
        }

        protected void NavigateToSmsOffers(object sender, EventArgs e)
        {
            Response.Redirect("SmsOffers.aspx");
        }

        protected void NavigateToWallets(object sender, EventArgs e)
        {
            Response.Redirect("Wallets.aspx");
        }

        protected void NavigateToEshops(object sender, EventArgs e)
        {
            Response.Redirect("Eshops.aspx");
        }

        protected void NavigateToTransactions(object sender, EventArgs e)
        {
            Response.Redirect("Transactions.aspx");
        }

        protected void NavigateToCashbacks(object sender, EventArgs e)
        {
            Response.Redirect("Cashbacks.aspx");
        }

        protected void NavigateToAcceptedPayments(object sender, EventArgs e)
        {
            Response.Redirect("AcceptedPayments.aspx");
        }

        protected void NavigateToCachbacksByPlan(object sender, EventArgs e)
        {
            Response.Redirect("CashbacksByPlan.aspx");
        }

        protected void NavigateToAverageAmount(object sender, EventArgs e)
        {
            Response.Redirect("AverageAmount.aspx");
        }

        protected void NavigateToLinked(object sender, EventArgs e)
        {
            Response.Redirect("Linked.aspx");
        }

        protected void NavigateToUpdatePoints(object sender, EventArgs e)
        {
            Response.Redirect("UpdatePoints.aspx");
        }

        protected void Logout(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }
    }
}
