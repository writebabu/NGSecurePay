using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Text;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.SessionState;
using System.Web.Security;
using System.Configuration;
using System.Xml;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Reflection;
using System.ComponentModel;
using IntranetBL;


namespace Intranet.Utilities
{
    //All general purpose Utility Methods
    public class Util
    {
        public Util()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        private static string GetLogFolderPath()
        {
            string strLogFolderPath = "";
            strLogFolderPath = Convert.ToString(ConfigurationManager.AppSettings["logFolderPath"]);
            return strLogFolderPath;
        }

        private static string GetFileName()
        {
            try
            {
                string strFileName = "IntranetHomePage_Log_" + DateTime.Now.Month.ToString() + "_" + DateTime.Now.Day.ToString() + "_" + DateTime.Now.Year.ToString() + ".txt";
                return strFileName;
            }
            catch (Exception ex)
            {
                return "";
            }
        }

        public static void WriteToLog(string strClassMethod, string strMessage, string strEmpId)
        {
            try
            {
                StreamWriter w;
                string strApplicationName = HttpContext.Current.Request.ApplicationPath;
                string strFileName = GetFileName();
                string strFilePath = GetLogFolderPath() + strFileName;
                //DeleteFiles(GetLogFolderPath());
                if (!File.Exists(strFilePath))
                {
                    w = File.CreateText(strFilePath);
                    w.Close();
                }
                w = File.AppendText(strFilePath);
                w.Write("\r\n----------------------");
                w.Write("Log Entry : ");
                w.Write("{0}", DateTime.Now.ToString());
                w.Write("----------------------");
                w.WriteLine("\r\nApplicationName  : {0}", strApplicationName);
                w.WriteLine("Class.Method  : {0}", strClassMethod);
                w.WriteLine("Error  : {0}", strMessage);
                w.WriteLine("EmpId  : {0}", strEmpId);
                w.WriteLine("----------------------------------------------------------------------------");
                // Update the underlying file.
                string txtErrorMessage = "Error  : {0}" + strMessage + "<br>" + "EmpId  : {0}" + strEmpId;
                w.Flush();
                w.Close();



                try
                {
                    #region Table Content Preparation

                    StringBuilder sb = new StringBuilder();
                    sb.Append("<table style='border:0px solid #000000;border-collapse:collapse;font-family:Arial;font-size:x-small;'>");

                    sb.Append("<tr>");
                    sb.Append("<td align='left'><b>Employee ID</b>");
                    sb.Append("</td>");
                    sb.Append("<td width='10px'></td>");
                    sb.AppendFormat("<td align='left'>{0}", strEmpId);
                    sb.Append("</td>");
                    sb.Append("</tr>");

                    sb.Append("<tr>");
                    sb.Append("<td align='left'><b>Date</b>");
                    sb.Append("</td>");
                    sb.Append("<td width='10px'></td>");
                    sb.AppendFormat("<td align='left'>{0}", DateTime.Now.ToShortDateString());
                    sb.Append("</td>");
                    sb.Append("</tr>");

                    sb.Append("<tr>");
                    sb.Append("<td align='left'><b>Time</b>");
                    sb.Append("</td>");
                    sb.Append("<td width='10px'></td>");
                    sb.AppendFormat("<td align='left'>{0}", DateTime.Now.ToLongTimeString());
                    sb.Append("</td>");
                    sb.Append("</tr>");

                    sb.Append("<tr>");
                    sb.Append("<td align='left'><b>Page Location </b>");
                    sb.Append("</td>");
                    sb.Append("<td width='10px'></td>");
                    sb.AppendFormat("<td align='left'>{0}", strClassMethod);
                    sb.Append("</td>");
                    sb.Append("</tr>");

                    sb.Append("<tr>");
                    sb.Append("<td align='left'><b>Source</b>");
                    sb.Append("</td>");
                    sb.Append("<td width='10px'></td>");
                    sb.AppendFormat("<td align='left'>{0}", strMessage);
                    sb.Append("</td>");
                    sb.Append("</tr>");

                    sb.Append("</table>");

                    #endregion
                    BL_Employee objBL = new BL_Employee();
                    //objBL.SaveErrorMessage(sb.ToString());
                }
                catch
                {

                }
            }
            catch (Exception ex)
            {

            }
        }

        private static void DeleteFiles(string strDirPath)
        {
            int intDays = 0;
            /*XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(mstrConfigXmlPath);
            intDays = Convert.ToInt32(xmlDoc.GetElementsByTagName("logDays").Item(0).InnerText);*/
            intDays = Convert.ToInt32(ConfigurationManager.AppSettings["logDays"]);
            try
            {
                DirectoryInfo dir = new DirectoryInfo(strDirPath);
                foreach (FileInfo f in dir.GetFiles("*.txt"))
                {
                    DateTime dtCreationTime = f.CreationTime;
                    if (dtCreationTime < DateTime.Now.AddDays(-intDays))
                        f.Delete();
                }
            }
            catch (Exception ex)
            {

            }
        }


    }

    //To Read Configuration Files values 
    public static class MyConfig
    {
        public static string GetConnectionString()
        {
            return Convert.ToString(ConfigurationManager.AppSettings["ConnectionString"]);
        }

        public static string GetServiceURL()
        {
            return Convert.ToString(ConfigurationManager.AppSettings["ServiceUrl"]);
        }

        public static string GetImageURL()
        {
            return Convert.ToString(ConfigurationManager.AppSettings["ImageUrl"]);
        }

        public static string GetToolCode()
        {
            return Convert.ToString(ConfigurationManager.AppSettings["ToolCode"]);
        }

        public static string GetErrorPageURL()
        {
            return Convert.ToString(ConfigurationManager.AppSettings["ErrorRedirect"]);
        }

        public static string GetErrorLogFilePath()
        {
            return Convert.ToString(ConfigurationManager.AppSettings["LogFolderPath"]);
        }

        public static string GetUploadFolderPath()
        {
            return Convert.ToString(ConfigurationManager.AppSettings["UploadFolderPath"]);
        }

        public static string SessionExpireRedirect()
        {
            return Convert.ToString(ConfigurationManager.AppSettings["SessionExpireRedirect"]);
        }

    }

    public class EnuUtils
    {
        #region Find Enum String Name
        public static string stringValueOf(Enum value)
        {
            FieldInfo fi = value.GetType().GetField(value.ToString());
            if (fi != null)
            {
                DescriptionAttribute[] attribute = (DescriptionAttribute[])fi.GetCustomAttributes(typeof(DescriptionAttribute), false);
                if (attribute.Length > 0)
                    return attribute[0].Description;
                else
                    return value.ToString();
            }
            else
            {
                return value.ToString();
            }
        }
        #endregion

        #region Find Enum Value
        public static object enumValueOf(string value, Type enumType)
        {
            string[] names = Enum.GetNames(enumType);
            foreach (string name in names)
            {
                if (stringValueOf((Enum)Enum.Parse(enumType, name)).Equals(value))
                {
                    return Enum.Parse(enumType, name);
                }
            }
            throw new ArgumentException("Error");
        }
        #endregion
    }
}
