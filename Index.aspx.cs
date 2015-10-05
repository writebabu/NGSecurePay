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

public partial class Index : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Redirect("https://vzweb2.verizon.com/");
        try
        {
            /*string strEmpEid = CheckSSO();
            if (!string.IsNullOrEmpty(strEmpEid))
            {
                Int64 EmpEid = Convert.ToInt64(strEmpEid);
                SetUserSession(EmpEid);
            }*/

            if (!Page.IsPostBack)
            {
                Label lblPageHeading = (Label)Master.FindControl("lblPageHeading");
                lblPageHeading.Text = "SecurePay";

                Label lblBreadCrumb = (Label)Master.FindControl("lblBreadCrumb");
                lblBreadCrumb.Text = "Home /";

               // LoadContents();
            }
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

    private void LoadContents()
    {
        string contentFromDB = string.Empty;
        DL_Content objDL = new DL_Content();

        //Get Slider Content
        contentFromDB = objDL.GetContentByName("HP_INT_INDEX_SLIDER");
        if (contentFromDB != string.Empty)
        {
            divSliderContent.InnerHtml = contentFromDB;
            contentFromDB = string.Empty;
        }

        //Center Tabs List
        contentFromDB = objDL.GetContentByName("HP_INT_INDEX_CENTER_TABSLIST");
        if (contentFromDB != string.Empty)
        {
            divCenterTabsList.InnerHtml = contentFromDB;
            contentFromDB = string.Empty;
        }

        //Center Tabs content
        contentFromDB = objDL.GetContentByName("HP_INT_INDEX_CENTER_TABSCONTENT");
        if (contentFromDB != string.Empty)
        {
            divCenterTabsContent.InnerHtml = contentFromDB;
            contentFromDB = string.Empty;
        }

        //right Tabs List
        contentFromDB = objDL.GetContentByName("HP_INT_INDEX_RIGHT_TABSLIST");
        if (contentFromDB != string.Empty)
        {
            divRightTabsList.InnerHtml = contentFromDB;
            contentFromDB = string.Empty;
        }

        //right Tabs content
        contentFromDB = objDL.GetContentByName("HP_INT_INDEX_RIGHT_TABSCONTENT");
        if (contentFromDB != string.Empty)
        {
            divRightTabsContent.InnerHtml = contentFromDB;
            contentFromDB = string.Empty;
        }

    }

}