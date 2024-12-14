using System;
using System.Data;
using System.Web.UI;

namespace WebApplication
{
    public partial class CustomerDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomerAccountTable"] != null)
            {
                DataTable customerAccountTable = (DataTable)Session["CustomerAccountTable"];
            }
            else
            {
                Response.Write("Session Data Not Set.");
            }
        }

        protected void NavigateToServicePlans(object sender, EventArgs e)
        {
            Response.Redirect("ServicePlans.aspx");
        }

        protected void NavigateToPlanConsumption(object sender, EventArgs e)
        {
            Response.Redirect("PlanConsumption.aspx");
        }

        protected void NavigateToUnsubscribedPlans(object sender, EventArgs e)
        {
            Response.Redirect("UnsubscribedPlan.aspx");
        }

        protected void NavigateToCurrentMonthUsage(object sender, EventArgs e)
        {
            Response.Redirect("CurrentMonthUsage.aspx");
        }

        protected void NavigateToCashbackTransactions(object sender, EventArgs e)
        {
            Response.Redirect("CashbackTransactions.aspx");
        }

        protected void NavigateToActiveBenefits(object sender, EventArgs e)
        {
            Response.Redirect("ActiveBenefits.aspx");
        }

        protected void NavigateToUnresolvedTickets(object sender, EventArgs e)
        {
            Response.Redirect("UnresolvedTickets.aspx");
        }

        protected void NavigateToHighestVoucher(object sender, EventArgs e)
        {
            Response.Redirect("HighestValueVoucher.aspx");
        }

        protected void NavigateToRemainingPayment(object sender, EventArgs e)
        {
            Response.Redirect("RemainingPayment.aspx");
        }

        protected void NavigateToExtraPayment(object sender, EventArgs e)
        {
            Response.Redirect("ExtraPayment.aspx");
        }

        protected void NavigateToTopPayments(object sender, EventArgs e)
        {
            Response.Redirect("TopPayments.aspx");
        }

        protected void NavigateToAllShops(object sender, EventArgs e)
        {
            Response.Redirect("AllShops.aspx");
        }

        protected void NavigateToPastPlans(object sender, EventArgs e)
        {
            Response.Redirect("PastPlans.aspx");
        }

        protected void NavigateToRenewSubscription(object sender, EventArgs e)
        {
            Response.Redirect("RenewSubscription.aspx");
        }

        protected void NavigateToCashbackAmount(object sender, EventArgs e)
        {
            Response.Redirect("CashbackAmount.aspx");
        }

        protected void NavigateToRechargeBalance(object sender, EventArgs e)
        {
            Response.Redirect("RechargeBalance.aspx");
        }

        protected void NavigateToRedeemVoucher(object sender, EventArgs e)
        {
            Response.Redirect("RedeemVoucher.aspx");
        }

        protected void NavigateToLogin(object sender, EventArgs e)
        {
            Response.Redirect("CustomerLogin.aspx");
        }
    }
}
