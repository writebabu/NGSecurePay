<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HP.master" CodeFile="Financialservices.aspx.cs" Inherits="Financialservices" %>


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
			        <div id="divCenterTabsContent" runat="server"></div>            
			    </section>
			</section>
		</div>
		<!--Main Column-->
		<!--Sidebar Right START-->
		<div id="divCard" runat="server">Virtual Card - Credit Card Details</div>
        <hr />
        <div id="divCardList" runat="server" >
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" style="width:100%;" ForeColor="#333333" GridLines="None"
                PageSize="500" Font-Size="Medium" EmptyDataText="No Credit Cards added." ShowHeaderWhenEmpty="true">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="Card Number" SortExpression="PhysicalCard" DataField ="PhysicalCard"/>
                    <asp:BoundField HeaderText="Name on Card" SortExpression="NameonCard" DataField ="NameonCard" />
                    <asp:BoundField HeaderText="Account Type" SortExpression="AccountType" DataField ="AccountType" />
                    <asp:BoundField HeaderText="Bank Name" SortExpression="BankCode" DataField ="BankCode" />
                    <asp:BoundField HeaderText="Available Limit" SortExpression="AvailableCrLimit" DataField ="AvailableCrLimit" />
                    <asp:BoundField HeaderText="Due Amount" SortExpression="DueAmount" DataField ="DueAmount" />
                    <asp:BoundField HeaderText="Due Date" SortExpression="DueDate" DataField ="DueDate" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#CC0000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#CC0000" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                <PagerStyle BackColor="#CC0000" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" Font-Size="Small" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
        <hr /><br />
		<div class="clear"></div>
        <div id="divDebit" runat="server">Virtual Card - Debit Card Details</div>
        <hr />
        <div id="divDebitList" runat="server" >
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" style="width:100%;" ForeColor="#333333" GridLines="None"
                PageSize="500" Font-Size="Medium" EmptyDataText="No Debit Cards added." ShowHeaderWhenEmpty="true">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="Card Number" SortExpression="PhysicalCard" DataField ="PhysicalCard"/>
                    <asp:BoundField HeaderText="Name on Card" SortExpression="NameonCard" DataField ="NameonCard" />
                    <asp:BoundField HeaderText="Account Type" SortExpression="AccountType" DataField ="AccountType" />
                    <asp:BoundField HeaderText="Bank Name" SortExpression="BankCode" DataField ="BankCode" />
                    <asp:BoundField HeaderText="Available Balance" SortExpression="AvailableCrLimit" DataField ="AvailableCrLimit" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#CC0000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#CC0000" Font-Bold="True" ForeColor="White" Font-Size="Small" />
                <PagerStyle BackColor="#CC0000" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" Font-Size="Small" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
   </section>
</asp:Content>