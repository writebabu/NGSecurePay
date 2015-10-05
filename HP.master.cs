using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IntranetBL;
using System.Configuration;
using System.IO;
using System.Net;

public partial class HP : System.Web.UI.MasterPage
{
    string strEmpEid = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //strEmpEid = BasePage.CheckSSO();
            lblName1.Text = Session["UserName"].ToString();
            /*if (!string.IsNullOrEmpty(strEmpEid))
            {
                Int64 EmpEid = Convert.ToInt64(strEmpEid);
                BasePage.SetUserSession(EmpEid);

                if (UserSession.VZID == null || UserSession.VZID == string.Empty)
                {
                    lblName1.Text = string.Empty;
                    /*lblName2.Text = string.Empty;
                    lblName3.Text = string.Empty;
                }
                else
                {
                    lblName1.Text = Session["UserName"].ToString();
                    lblName2.Text = UserSession.EmpName;
                    lblName3.Text = UserSession.EmpName;
                }
            }*/

            UserTrack();
        }
        catch (Exception ex)
        {
        }
    }

    private void UserTrack()
    {
        BL_Employee objBL = new BL_Employee();

        string hostAddress = string.Empty, serverIP = string.Empty;

        hostAddress = GetHostAddress();
        serverIP = GetServerIPAddress();


        objBL.SavePageHitsCount(UserSession.VZID, Convert.ToString(ConfigurationManager.AppSettings["ToolCode"]), Path.GetFileName(Request.Url.PathAndQuery), hostAddress, serverIP);
    }

    private string GetHostAddress()
    {
        string ipList = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (!string.IsNullOrEmpty(ipList))
        {
            return ipList.Split(',')[0];
        }
        return Request.ServerVariables["REMOTE_ADDR"];
    }

    public string GetServerIPAddress()
    {
	return System.Web.HttpContext.Current.Server.MachineName;
    }

    protected void lnkSignout_Click(object sender, EventArgs e)
    {
        //Session.Abandon();
    }
}
