using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for UserSession
/// </summary>
public static class UserSession
{
    #region Properties
    //Set VZID
    private static string _vzID = "VZID";
    //Set session for employee UID
    private static string _empEID = "EmpEID";
    //set employee ID
    private static string _empID = "EmpID";
    //set Gender
    private static string _gender = "Gender";
    //Set FirstName
    private static string _empFirstName = "EmpFirstName";
    //Set EmpName
    private static string _empName = "EmpName";
    //Set Email
    private static string _email = "Email";

    #region Get/Set Employee EID
    public static string EmpEID
    {
        get
        {
            if (HttpContext.Current.Session[UserSession._empEID] == null)
                return null;
            else
                return HttpContext.Current.Session[UserSession._empEID].ToString();
        }
        set
        {
            HttpContext.Current.Session[UserSession._empEID] = value;
        }
    }
    #endregion

    #region Get/Set VZID
    public static string VZID
    {
        get
        {
            if (HttpContext.Current.Session[UserSession._vzID] == null)
                return null;
            else
                return HttpContext.Current.Session[UserSession._vzID].ToString();
        }
        set
        {
            HttpContext.Current.Session[UserSession._vzID] = value;
        }
    }
    #endregion

    #region Get/Set Employee ID
    public static string EmpID
    {
        get
        {
            if (HttpContext.Current.Session[UserSession._empID] == null)
                return null;
            else
                return HttpContext.Current.Session[UserSession._empID].ToString();
        }
        set
        {
            HttpContext.Current.Session[UserSession._empID] = value;
        }
    }
    #endregion

    #region Get/Set Gender
    public static string Gender
    {
        get
        {
            if (HttpContext.Current.Session[UserSession._gender] == null)
                return null;
            else
                return HttpContext.Current.Session[UserSession._gender].ToString();
        }
        set
        {
            HttpContext.Current.Session[UserSession._gender] = value;
        }
    }
    #endregion

    #region Get/Set EmpFirstName
    public static string EmpFirstName
    {
        get
        {
            if (HttpContext.Current.Session[UserSession._empFirstName] == null)
                return null;
            else
                return HttpContext.Current.Session[UserSession._empFirstName].ToString();
        }
        set
        {
            HttpContext.Current.Session[UserSession._empFirstName] = value;
        }
    }
    #endregion

    #region Get/Set EmpName
    public static string EmpName
    {
        get
        {
            if (HttpContext.Current.Session[UserSession._empName] == null)
                return null;
            else
                return HttpContext.Current.Session[UserSession._empName].ToString();
        }
        set
        {
            HttpContext.Current.Session[UserSession._empName] = value;
        }
    }
    #endregion

    #region Get/Set Email
    public static string Email
    {
        get
        {
            if (HttpContext.Current.Session[UserSession._email] == null)
                return null;
            else
                return HttpContext.Current.Session[UserSession._email].ToString();
        }
        set
        {
            HttpContext.Current.Session[UserSession._email] = value;
        }
    }
    #endregion

    #endregion
}

