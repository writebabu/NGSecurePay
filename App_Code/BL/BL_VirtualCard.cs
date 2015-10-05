using System;
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
    public class BL_VirtualCard
    {
        private DL_VirtualCard objDL = new DL_VirtualCard();

        public BL_VirtualCard()
        {
            //
            // TODO: Add constructor logic here
            //
        }


        public int DeleteWalletCard(string strCardNumber)
        {
            return objDL.DeleteWalletCard(strCardNumber);
        }
        public int CreateVirtualCard(string strUserName)
        {
            return objDL.CreateVirtualCard(strUserName);
        }

        public string CheckVirtualCard(string strUserName)
        {
            return objDL.CheckVirtualCard(strUserName);
        }

        public int AddNewCard(string strCardNumber, int intBankCode, int intCardType, int intAccountType, int intPriority, int intPerc, int intAutoPay, string strUsername, string strNameOnCard)
        {
            return objDL.AddNewCard(strCardNumber, intBankCode, intCardType, intAccountType, intPriority, intPerc, intAutoPay, strUsername, strNameOnCard);
        }

        public DataTable GetCards(string strUserName)
        {
            return objDL.GetCards(strUserName);
        }

        public DataTable GetCardDetails(string strUserName)
        {
            return objDL.GetCardDetails(strUserName);
        }

        public DataTable GetCreditCardDetails(string strUserName)
        {
            return objDL.GetCreditCardDetails(strUserName);
        }

        public DataTable GetDebitCardDetails(string strUserName)
        {
            return objDL.GetDebitCardDetails(strUserName);
        }

        public string AddPurchase(int intProductId, int intUnit, int intAmount, string strUsername)
        {
            return objDL.AddPurchase(intProductId, intUnit, intAmount, strUsername);
        }

        public string AddPurchaseSharing(int intProductId, int intUnit, int intAmount, string strUsername, int intPayOptions)
        {
            return objDL.AddPurchaseSharing(intProductId, intUnit, intAmount, strUsername, intPayOptions);
        }
    }

        
}
