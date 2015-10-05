<%@ Page Title="" Language="C#" MasterPageFile="~/HP.master" AutoEventWireup="true"
    CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="Popup_1/Js/function.js"></script>
    <link rel="stylesheet" type="text/css" href="Popup_1/Css/styles.css" /> 


    <div class="selectlocation l_popup">
            <div class="close_l_popup">
            </div>
        </div>   

        <script type="text/javascript">
           
           
        </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">	
    <div class="divider">
    </div>
    <div id="divSliderContent" runat="server">
    </div>
    <section class="text_container">
		<div class="grid_8 eq_hgt">
			<section class="tabset_top">			
                <div id="divCenterTabsList" runat="server"></div>	
			    <section class="tab_content_main">
			        <div id="divCenterTabsContent" runat="server">
                        Virtual Card is a feature enabled for all customers who can attach all their Credit / Debit cards for making the payment in  secure way and without providing the details for each & every transaction.

                        By providing this feature to the customers, Verizon ensures to strengthen the security and not sharing the customer card details to any Third party.
			        </div>            
			    </section>
			</section>
		</div>
		<!--Main Column-->
		<!--Sidebar Right START-->
		<div class="grid_4 sidebar eq_hgt">
			<section class="tabset2">
			    <div id="divRightTabsList" runat="server"></div>
			    <section class="tab_content_main">
                    <div runat="server" id="divRightTabsContent" style="font-size:10;">
                        <img src="images/content/virtual-cc-numbers.jpg" alt="Virtual Card"/>
                    </div>            
			    </section>			
			</section>
            <!--Sidebar Right END-->
			<!--<div class="clear"></div>-->
		</div>
   </section>
</asp:Content>
