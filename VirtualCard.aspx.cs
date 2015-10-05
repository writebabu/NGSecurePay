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
using IntranetBL;
using Intranet.Utilities;

public partial class VirtualCard : BasePage
{
    private string strUserName =  "";
    protected void Page_Load(object sender, EventArgs e)
    {
        btnSubmit.Attributes.Add("onclick", "return Validate();");
        txtPriority.Attributes.Add("onkeypress", "return allowInteger();");
        try
        {
            if(Session["UserName"] != null)
                strUserName = Session["UserName"] + "";

            //strUserName = "Verizon";

                Label lblPageHeading = (Label)Master.FindControl("lblPageHeading");
                lblPageHeading.Text = "SecurePay";

                Label lblBreadCrumb = (Label)Master.FindControl("lblBreadCrumb");
                lblBreadCrumb.Text = "Home / VirtualCard";

                BL_VirtualCard objVirtCard = new BL_VirtualCard();
                string strResult = objVirtCard.CheckVirtualCard(strUserName);
                divAddCard.Visible = false;
                divConfirmation.Visible = true;

            if (strResult == "1")
                {
                    rdoList.SelectedIndex = 1;
                    LoadExistingCards(strUserName);
                divAdd.Visible = true;
                }
                else
                {
                    rdoList.SelectedIndex = 0;
                    divAgree.Visible = true;
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
        DataTable dt = objVC.GetCards(strUserName);
        if (dt != null)
        { 
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //Set logged user session
        //SetUserSession(Convert.ToInt64(TextBox1.Text));
        if (UserSession.EmpEID != null)
        {
            Response.Redirect("Index.aspx");
        }
    }
    protected void btnAgree_Click(object sender, EventArgs e)
    {
        string strMessage = "";
        BL_VirtualCard objVirtual = new BL_VirtualCard();
        if (rdoList.SelectedValue == "New Virtual card")
        {
            int intCreate = objVirtual.CreateVirtualCard(strUserName.Trim());
            if (intCreate > 0)
                strMessage = "Virtual Card Added successfully. Please proceed to add your card details.";
            else
                strMessage = "Card not created. Please try some time later...";

            divMessage.Visible = true;
            divMessage.InnerText = strMessage.ToString();

            divAdd.Visible = true;
            divAgree.Visible = false;
        }
        else
        {
            //option to modify virtual card
        }
    }
    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        divAddCard.Visible = true;
        divMessage.InnerText = "";
        divMessage.Visible = false;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strMessage = "";
        BL_VirtualCard objVirtual = new BL_VirtualCard();
        int intResult = objVirtual.AddNewCard(txtCardNumber.Text, Convert.ToInt32(rdoBankList.SelectedValue), Convert.ToInt32(rdoCardType.SelectedValue), Convert.ToInt32(rdoAccountType.SelectedValue), Convert.ToInt32(txtPriority.Text), Convert.ToInt32(txtPercentage.Text), Convert.ToInt32(rdoAutoPay.SelectedIndex) , strUserName, txtNameonCard.Text);

        if (intResult > 0)
            strMessage = "Card Added successfully. Please wait for 1 hour to verify & validate your card details.";
        else
            strMessage = "Card not created. Please recheck the value and try again";

        divMessage.Visible = true;
        divMessage.InnerText = strMessage.ToString();
        divAddCard.Visible = false;
        clearData();
        LoadExistingCards(strUserName);
    }

    private void clearData()
    {
        txtCardNumber.Text = "";
        txtNameonCard.Text = "";
        txtPriority.Text = "";
        txtPercentage.Text = "";
}

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delRecord")
        {
            
            string strMessage = "";
            //int intIndex = Convert.ToInt32(e.CommandArgument);
            /*strMessage = GridView1.SelectedIndex.ToString();
            strMessage = GridView1.SelectedRow.Cells[0].Text.ToString();
            strMessage = GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text.ToString();*/
            //GridView1.SelectedRow
            /*BL_VirtualCard objVirtual = new BL_VirtualCard();
            int intResult = objVirtual.DeleteWalletCard(strMessage);

            if (intResult > 0)
                strMessage = "Card Deleted successfully.";
            else
                strMessage = "Card not deleted. Please try again";

            divMessage.Visible = true;
            divMessage.InnerText = strMessage.ToString();
            divAddCard.Visible = true;
            clearData();
            LoadExistingCards(strUserName);*/
        }
    }

    protected void rdoAccountType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rdoAccountType.SelectedValue == "3")
            divConfirmation.Visible = true;
        else
            divConfirmation.Visible = false;
    }
}
