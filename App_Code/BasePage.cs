using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Xml;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Reflection;
using System.Security.Permissions;
using System.Net;
using IntranetBL;
using IntranetPL;

public partial class BasePage : System.Web.UI.Page
{
    #region Member Variables

    protected string SortOrder;
    public static bool FLAG = true;

    #endregion

    public static string CheckSSO()
    {
        #region Check SSO login
        try
        {
            string logedEmpEid = "";
            //logedEmpEid = HttpContext.Current.Request.ServerVariables["HTTP_EID"] + "";
            //logedEmpEid = "8228529279";
            return logedEmpEid;
        }
        catch { throw; }
        #endregion
    }
    //Set logged user session
    public static void SetUserSession(Int64 EmpEid)
    {
        #region Set User Session
        if (UserSession.EmpEID == null || UserSession.EmpID == null)
        {
            BL_Employee objBL = new BL_Employee();

            PL_Employee MySession = objBL.GetLoggedInEmpDetails(EmpEid);
            if (MySession != null)
            {
                List<string> MyRoleID = new List<string>();
                List<string> MyRoleName = new List<string>();
                UserSession.EmpEID = Convert.ToString(MySession.EmpEid);
                UserSession.EmpID = Convert.ToString(MySession.EmpId);
                UserSession.VZID = MySession.VZID;
                UserSession.Gender = MySession.Gender;
                UserSession.EmpName = MySession.EmpName;
                UserSession.EmpFirstName = MySession.EmpFirstName;
                UserSession.Email = MySession.Email;
            }
        }
        #endregion
    }

    //Alert message
    public static string popUpMessage(string msg)
    {
        string popupMsg = "<script language='javascript'>" +
            "window.alert('" + msg + "');</script>";
        return popupMsg;
    }

    // Function to Test for Positive Number both Integer & Real 
    public static bool IsPositiveNumber(String strNumber)
    {
        Regex objNotPositivePattern = new Regex("[^0-9.]");
        Regex objPositivePattern = new Regex("^[.][0-9]+$|[0-9]*[.]*[0-9]+$");
        Regex objTwoDotPattern = new Regex("[0-9]*[.][0-9]*[.][0-9]*");
        return !objNotPositivePattern.IsMatch(strNumber) &&
            objPositivePattern.IsMatch(strNumber) &&
            !objTwoDotPattern.IsMatch(strNumber);
    }
}
