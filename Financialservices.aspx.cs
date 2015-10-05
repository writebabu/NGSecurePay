using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using IntranetDL;
using Intranet.Utilities;
using IntranetBL;

public partial class Financialservices : System.Web.UI.Page
{
    private string strUserName = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            /*string strEmpEid = CheckSSO();
            if (!string.IsNullOrEmpty(strEmpEid))
            {
                Int64 EmpEid = Convert.ToInt64(strEmpEid);
                SetUserSession(EmpEid);
            }*/
            if (Session["UserName"] != null)
                strUserName = Session["UserName"] + "";

            if (!Page.IsPostBack)
            {
                Label lblPageHeading = (Label)Master.FindControl("lblPageHeading");
                lblPageHeading.Text = "SecurePay";

                Label lblBreadCrumb = (Label)Master.FindControl("lblBreadCrumb");
                lblBreadCrumb.Text = "Home / FinancialServices";

                // LoadContents();
            }
            LoadExistingCards(strUserName);
        }
        catch (Exception ex)
        {
            if (!ex.Message.ToString().Trim().Equals("Thread was being aborted."))
            {
                Util.WriteToLog("Index_Page_Load", ex.Message.ToString(), UserSession.EmpID);
                Response.Redirect(FindLink.ToNotAuthorised("Error"), true);
            }
        }
    }

    private void LoadExistingCards(string strUserName)
    {
        BL_VirtualCard objVC = new BL_VirtualCard();
        DataTable dt = objVC.GetCreditCardDetails(strUserName);
        if (dt != null)
        {
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }
        else
        {

        }

        DataTable dtDebit = objVC.GetDebitCardDetails(strUserName);
        if (dt != null)
        {
            GridView1.DataSource = dtDebit;
            GridView1.DataBind();
        }
        else
        {

        }
    }
}