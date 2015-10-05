using System;
using System.Collections.Generic;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for DL_Content
/// </summary>
/// 

namespace IntranetDL
{
    public class DL_Content
    {

        public DL_Content()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public string GetContentByName(string contentName)
        {
            string content = string.Empty;
            DataSet dsContent = null;
            SqlParameter[] objParam;
            objParam = new SqlParameter[1];
            objParam[0] = HR_HP.SqlHelper.MakeInParam("@pi_ContentName", SqlDbType.VarChar, 1000, contentName);
            dsContent = new DataSet();
            dsContent = HR_HP.SqlHelper.ExecuteDataset(ConfigurationManager.ConnectionStrings["IntranetDBConnection"].ConnectionString, CommandType.StoredProcedure,
                                                    "USP_CMS_Get_PublishedContentByName", objParam);
            if (dsContent.Tables[0].Rows.Count > 0)
                content = Convert.ToString(dsContent.Tables[0].Rows[0]["Contents"]);

            dsContent = null;
            objParam = null;

            return content;
        }

        public DataSet GetDetailsByOrgID(int OrgID)
        {

            DataSet dsContent = null;
            SqlParameter[] objParam;
            objParam = new SqlParameter[1];
            objParam[0] = HR_HP.SqlHelper.MakeInParam("@OrgID", SqlDbType.Int, 4, OrgID);
            dsContent = new DataSet();
            dsContent = HR_HP.SqlHelper.ExecuteDataset(ConfigurationManager.ConnectionStrings["IntranetDBConnection"].ConnectionString, CommandType.StoredProcedure,
                                                    "USP_CMS_GetDetailsByOrgID", objParam);

            objParam = null;
            return dsContent;
        }

        public DataSet GetSDHByOrgID(int OrgID)
        {

            DataSet dsContent = null;
            SqlParameter[] objParam;
            objParam = new SqlParameter[1];
            objParam[0] = HR_HP.SqlHelper.MakeInParam("@OrgID", SqlDbType.Int, 4, OrgID);
            dsContent = new DataSet();
            dsContent = HR_HP.SqlHelper.ExecuteDataset(ConfigurationManager.ConnectionStrings["IntranetDBConnection"].ConnectionString, CommandType.StoredProcedure,
                                                    "USP_CMS_GetSDHByOrgID", objParam);

            objParam = null;
            return dsContent;
        }

        public DataSet GetDetailsBySDHID(int sdhID)
        {

            DataSet dsContent = null;
            SqlParameter[] objParam;
            objParam = new SqlParameter[1];
            objParam[0] = HR_HP.SqlHelper.MakeInParam("@SDHID", SqlDbType.Int, 4, sdhID);
            dsContent = new DataSet();
            dsContent = HR_HP.SqlHelper.ExecuteDataset(ConfigurationManager.ConnectionStrings["IntranetDBConnection"].ConnectionString, CommandType.StoredProcedure,
                                                    "USP_CMS_GetDetailsBySDHID", objParam);

            objParam = null;
            return dsContent;
        }
    }
}