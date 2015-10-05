﻿using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using IntranetPL;
using IntranetDL;

namespace IntranetBL
{
    public class BL_Employee
    {
        private DL_Employee objDL = new DL_Employee();

        public BL_Employee()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public PL_Employee GetLoggedInEmpDetails(Int64 EmpEID)
        {
            PL_Employee empdet = objDL.GetLoggedInEmpDetails(EmpEID);
            return empdet;
        }

        /*public int SaveErrorMessage(string errorMsg)
        {
            return objDL.SaveErrorMessage(errorMsg);
        }*/

        public int SendFeedbackMail(Int64 CreatedBy, string CreatedByName, string CreatedByEmail, string Message)
        {
            return objDL.SendFeedbackMail(CreatedBy, CreatedByName, CreatedByEmail, Message);
        }

        public int SavePageHitsCount(string vzID, string toolCode, string pageName, string hostAddress, string serverIP)
        {
            return objDL.SavePageHitsCount(vzID, toolCode, pageName, hostAddress, serverIP);
        }
    }
}
