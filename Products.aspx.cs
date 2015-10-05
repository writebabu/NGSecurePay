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

public partial class Products : System.Web.UI.Page
{
    private string strUserName = "";
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
            if (Session["UserName"] != null)
                strUserName = Session["UserName"] + "";

            //strUserName = "Verizon";
            LoadExistingCards(strUserName);
            GetSelectedRecord();
            SetSelectedRecord();
            if (!Page.IsPostBack)
            {
                Label lblPageHeading = (Label)Master.FindControl("lblPageHeading");
                lblPageHeading.Text = "SecurePay";

                Label lblBreadCrumb = (Label)Master.FindControl("lblBreadCrumb");
                lblBreadCrumb.Text = "Home / Products";

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

    private void LoadExistingCards(string strUserName)
    {
        BL_VirtualCard objVC = new BL_VirtualCard();
        DataTable dt = objVC.GetCardDetails(strUserName);
        if (dt != null)
        {
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }
        else
        {

        }
    }

    private void GetSelectedRecord()
    {

        for (int i = 0; i < GridView1.Rows.Count; i++)
        {

            RadioButton rb = (RadioButton)GridView1.Rows[i].Cells[0].FindControl("RadioButton1");

            if (rb != null)
            {

                if (rb.Checked)
                {

                    HiddenField hf = (HiddenField)GridView1.Rows[i].Cells[0].FindControl("HiddenField1");

                    if (hf != null)
                    {

                        ViewState["SelectedContact"] = hf.Value;

                    }



                    break;

                }

            }

        }

    }

    private void clearRecord()
    {

        for (int i = 0; i < GridView1.Rows.Count; i++)
        {

            RadioButton rb = (RadioButton)GridView1.Rows[i].Cells[0].FindControl("RadioButton1");

            if (rb != null)
            {

                if (rb.Checked)
                {

                    HiddenField hf = (HiddenField)GridView1.Rows[i].Cells[0].FindControl("HiddenField1");

                    if (hf != null)
                    {

                        ViewState["SelectedContact"] = "";

                    }



                    break;

                }

            }

        }

    }

    private void SetSelectedRecord()
    {

        for (int i = 0; i < GridView1.Rows.Count; i++)
        {

            RadioButton rb = (RadioButton)GridView1.Rows[i].Cells[0].FindControl("RadioButton1");

            if (rb != null)
            {

                HiddenField hf = (HiddenField)GridView1.Rows[i].Cells[0].FindControl("HiddenField1");

                if (hf != null && ViewState["SelectedContact"] != null)
                {

                    if (hf.Value.Equals(ViewState["SelectedContact"].ToString()))
                    {

                        rb.Checked = true;

                        break;

                    }

                }

            }

        }

    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strMessage = "";
        BL_VirtualCard objVirtual = new BL_VirtualCard();
        string strResult = "";

        if (rdoPayOptions.SelectedItem.Value == "1")
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                RadioButton rb = (RadioButton)row.Cells[0].FindControl("RadioButton1");
                if (rb != null)
                {

                    if (rb.Checked)
                    {
                        int intProductID = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Values["ProductID"].ToString());
                        strResult = objVirtual.AddPurchase(intProductID, 1, Convert.ToInt32(Convert.ToDouble(row.Cells[3].Text.ToString())), strUserName);
                        break;
                    }

                }

            }
        }
        else if (rdoPayOptions.SelectedItem.Value == "2")
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                RadioButton rb = (RadioButton)row.Cells[0].FindControl("RadioButton1");
                if (rb != null)
                {

                    if (rb.Checked)
                    {
                        int intProductID = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Values["ProductID"].ToString());
                        strResult = objVirtual.AddPurchaseSharing(intProductID, 1, Convert.ToInt32(Convert.ToDouble(row.Cells[3].Text.ToString())), strUserName,2 );
                        break;
                    }

                }

            }
        }
        divMessage.Visible = true;
        divMessage.InnerText= strResult;
        LoadExistingCards(strUserName);
    }
}