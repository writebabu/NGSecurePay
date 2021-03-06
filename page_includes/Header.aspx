﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Header.aspx.cs" Inherits="page_includes_Header" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script language="javascript" type="text/javascript">
        $('.peoplesearch input').live('focus click', function () {
            obj = $(this);
            $(this).prevAll('label').hide();
            obj.addClass('focused');
        });
        $('.peoplesearch label').live('click', function () {
            $(this).nextAll('input.text').focus();
            $(this).hide(); //- hide label
        });
        $('.peoplesearch .text').live('blur', function () {
            input = $(this);
            if (input.val() == '') {
                $(this).prevAll('label').show(); //- show label
            }
            input.removeClass('focused');
        });


        $(".cnt_box a:first").addClass("select_txt");
        $(".searchWrapper").hide();
        $(".searchWrapper:first").show();
        $(".cnt_box a").bind("click", function () {
            $('.search input').val('');
            $('.search label').show();
            $('.searchWrapper #searchOverlayTop').hide();
            var searchTitle = $(this).attr("title");
            $(".select_txt").removeClass("select_txt");
            $(this).addClass("select_txt");
            $(".searchWrapper").hide();
            $("#" + searchTitle + "_searchBox").show();
            return false;
        });
        /*__________________________________________________________________

        SEARCH RESULTS CODE
        __________________________________________________________________*/

        var lngh;
        $('#Intranet_searchBox .search input').keyup(function () {
            if ($(this).val().length > 1) {
                $('#Intranet_searchBox #searchOverlayTop').slideDown(100);
            } else {
                $('#Intranet_searchBox #searchOverlayTop').slideUp(50);
            }
            $('body').bind("click", clearResults);
        });

        function clearResults(event) {
            if (!$(event.target).closest('.searchWrapper #searchOverlayTop').length && !$(event.target).closest('.searchWrapper .search').length) {
                $('.searchWrapper #searchOverlayTop').slideUp(10);
                $('body').unbind();
            }
        }

	
	
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <section class="branding">
<div class="globalNavContainer pr">
  <article class="logo"><img alt="Verizon" title="Verizon" src="../images/global/logos/logo_verizon_sec.gif" /></article>
  <a alt="Organization Chart" href="http://orgchart.verizon.com/ldapOrgChart/orgChartMain.jsp" class="orgChart orgSearch">Org Chart</a>
   <h3 class="aySearch">Search</h3>
 <div class="cnt_box">
  	<a href="javscript:;" title="Intranet" class="content_img">Intranet</a><a href="javscript:;" title="People" class="people_img">People</a>
  </div>
  <div class="searchWrapper" id="Intranet_searchBox">
    <div class="search">
	    <label class="val_txt">Search Intranet</label>
      <input id="SearchEverything" type="text"  class="text" name="sn">
      </div>
      <div class="top_btn fl">
      <a href="javascript:;" class="button" alt="Search" title="Search"> <span class="icon"></span></a>
      </div>    
    <!-- SEARCH RESULTS -->
		<div class="searchOverlay" id="searchOverlayTop">
			<div class="results">
				<div class="res_list">
					<div class="r"><strong>pay</strong> : Base Pay</div>
					<div class="r"><strong>pay</strong> areas : Geographic Pay Areas</div>
					<div class="r"><strong>pay</strong> increases : Pay Increases</div>
					<div class="r"><strong>pay</strong>ment : Loans</div>
					<div class="r"><strong>pay</strong>roll : Payroll Services</div>
					<div class="r"><strong>pay</strong>roll control group : Payroll Control Group and Production Support</div>
					<div class="r"><strong>pay</strong>roll objectives : Payroll Objectives</div>
					<div class="r"><strong>pay</strong>roll operations : Payroll Operations</div>
					<div class="r"><strong>pay</strong>roll systems : Payroll Systems</div>
				</div>
			</div>
		</div>
	</div>
    <div class="searchWrapper" id="People_searchBox">
		<div class="peoplesearch search">
    	<span class="psr1">
			<label class="val_txt">Last Name</label>
			<input type="text" class="text" name="lname" id="lname" value="Last Name">
      </span>
      <span class="psr2">
			<label class="val_txt2">First Name</label>
			<input type="text" class="text" name="fname" id="fname" value="First Name">
      </span>
			<a href="javascript:;" class="button" alt="Search" title="Search"> <span class="icon"></span></a>
		</div>
      
	</div>
  
  <div class="global_dotted_border"></div>
 
  <!--Main Menu-->
  <ul class="globalnav">
    <!--Home-->
    <li class="active"><a href="index.html"><span>Home</span></a></li>
    <!--Who We Are-->
    <li> <a href="javascript:;" class="drop navlink">Who We Are</a><span class="selected_link">&nbsp;</span>
      <div class="dropdown dropdown_2columns">
        <div class="col_1 firstcolumn">
          <ul class="link_list">
             <li index="0" groupindex="0" id="yui-gen2" class="yuimenuitem first-of-type"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://www22.verizon.com/about/" target="_blank">About Verizon</a></li>
                          <li index="1" groupindex="0" id="yui-gen3" class="yuimenuitem"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://orgchart.verizon.com/ldapOrgChart/orgChartMain.jsp" target="_blank">Organization Chart</a></li>
			              <li index="2" groupindex="0" id="yui-gen4" class="yuimenuitem"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/HomePages/VDSIPolicies/" target="_blank">VDSI Policies</a></li>
						  <div class="divider"></div>
			              <li index="2" groupindex="0" id="yui-gen4" class="yuimenuitem"><a href="http://hr.verizon.com/div_comp/conduct.pdf">Code of Conduct</a></li>
			              <li index="2" groupindex="0" id="yui-gen4" class="yuimenuitem"><a href="https://myvzweb.verizon.com/intranet/appmanager/verizon/myportal?_nfpb=true&_pageLabel=intranetvz_portal_whoweare_page&contentid=SO_000768&portletTitle=Our%20Commitment%20&%20Values"> Commitment &amp; Values</a></li>
			              <li index="2" groupindex="0" id="yui-gen4" class="yuimenuitem"><a href="http://responsibility.verizon.com/">Corporate Responsibility</a></li>
			              <li index="2" groupindex="0" id="yui-gen4" class="yuimenuitem"><a href="https://myvzweb.verizon.com/intranet/appmanager/verizon/myportal?_nfpb=true&_pageLabel=intranetvz_portal_dynamic_contents_page&contentid=INTRANET_093949&portletTitle=Credo">Credo</a></li>
			              <li index="2" groupindex="0" id="yui-gen4" class="yuimenuitem"><a href="https://myvzweb.verizon.com/intranet/appmanager/verizon/myportal?_nfpb=true&_pageLabel=intranetvz_portal_whoweare_page&contentid=SF_001103&portletTitle=Diversity%20Strategy">Diversity Strategy</a></li>
						  <li index="2" groupindex="0" id="yui-gen4" class="yuimenuitem"><a href="http://myvzweb.verizon.com/intranet/appmanager/verizon/myportal?_nfpb=true&_pageLabel=intranetvz_portal_ec_page&contentid=DF_ETHICS_COMPLIANCE&portletTitle=Compliance">Ethics &amp; Compliance</a></li>
			              <li index="2" groupindex="0" id="yui-gen4" class="yuimenuitem"><a href="http://myvzweb.verizon.com/intranet/appmanager/verizon/myportal?_nfpb=true&_pageLabel=intranetvz_goGreen&contentid= &portletTitle=Green%20%26%20Sustainability">Green &amp; Sustainability</a></li>
						  <li index="2" groupindex="0" id="yui-gen4" class="yuimenuitem"><a href="http://myvzweb.verizon.com/intranet/site/vzweb/messaging">Leadership &amp; Messaging</a></li>
			              <li index="2" groupindex="0" id="yui-gen4" class="yuimenuitem"><a href="http://myvzweb.verizon.com/intranet/appmanager/verizon/myportal?_nfpb=true&_pageLabel=intranetvz_portal_whoweare_page&contentid=SO_000917&portletTitle=Verizon%20Awards">Verizon Awards</a></li>
			              <li index="2" groupindex="0" id="yui-gen4" class="yuimenuitem"><a href="http://www.verizonfoundation.org/">Verizon Foundation</a></li>
			             
          </ul>
        </div>
      </div>
    </li>
    <!--About You-->
	<li><a href="javascript:;" class="drop navlink">About You</a><span class="selected_link">&nbsp;</span>
<div class="dropdown dropdown_fullwidth AbtYou">
	<div class="col_1">
		<ul class="link_list">
			<li><a href="javascript:void(0)"> About You </a></li>
			<li><a href="javascript:void(0)"> Your Info</a></li>
			<li><a href="javascript:void(0)">Work Tools</a></li>			
			<li><a href="javascript:void(0)">My NetWork</a></li>
		</ul>
	</div>
	<div class="col_5">
		<div class="h332 brdr links_content">
			<div class="h100">
				<article class="col_list w170">
				<h1>Money</h1>
				<ul class="list">
					<li><a href="#">Compensation</a></li>
					<li><a href="#">New Imbursement Policy</a></li>
					<li><a href="#">Night Shift Policy</a></li>
					<li><a href="#">Leave Policy</a></li>
					<li><a href="#">Holidays-2013</a></li>
					<li><a href="#">Gradual Return to Work</a></li>
					<li><a href="#">GRW FAQ</a></li>
					<li><a href="#">Verizon Incentive Plan</a></li>
					<li><a href="#">Technical Growth Plan</a></li>
				</ul>
				</article>
				<article class="col_list w180">
				<h1>Career & Learning</h1>
				<ul class="list">
					<li><a href="#">Equal Employment Opportunities</a></li>
					<li><a href="#">Talent Referral</a></li>
					<li><a href="#">Internal Job Posting</a></li>
					<li><a href="#">Performance management plan</a></li>
					<li><a href="#">VDSI Niche Skills Training Program policy</a></li>
					<li><a href="#">Relocation and Transfer</a></li>
					<li><a href="#">Career Essentials</a></li>
					<li><a href="#">Career Pathing Guide</a></li>
					<li><a href="#">IT Career Track-Tech knowledge and Skills</a></li>
					<li><a href="#">Leadership Capabilities Detail</a></li>
					<li><a href="#">Education Assistance Program</a></li>
				</ul>
				</article>
				<article class="col_list w180">
				<h1>Training And Career</h1>
				<ul class="list list_full">
					<li><a href="#">Manager Resources</a></li>
					<li><a href="#">Mentoring</a></li>
					<li><a href="#">Tuition Assistance</a></li>
				</ul>
				<h1>Life and Time off</h1>
				<ul class="list list_full p10">
					<li><a href="#">Probation</a></li>
					<li><a href="#">Working Hours and Days</a></li>
					<li><a href="#">Work Attire</a></li>
					<li><a href="#">Compensatory - Off</a></li>
				</ul>
					<h1>Environmental Health & Safety</h1>
				<ul class="list list_full p10">
					<li><a href="#">Employee Assistance Program</a></li>
					<li><a href="#">E&HS Hand Book</a></li>
					<li><a href="#">E&HS Hotline Number</a></li>
				</ul>
				</article>
				<article class="col_list w170">
				<h1>Health And Benefits</h1>
				<ul class="list list_full p10">
					<li><a href="#">Provident Fund</a></li>
					<li><a href="#">FAQ's on PF</a></li>
					<li><a href="#">Gratiuity</a></li>
					<li><a href="#">Group Personal Accident Insurance</a></li>
					<li><a href="#">FAQ's on GTLI</a></li>
					<li><a href="#">Seperation of Employment</a></li>
					<li><a href="#">VDSI Health Policy</a></li>
				</ul>
				
				<h1>VZ Culture</h1>
				<ul class="list list_full p10">
					<li><a href="#">Sexual Harrasment Policy</a></li>
					<li><a href="#">Code of Conduct Policy</a></li>
					<li><a href="#">Drug and Alcohol Policy</a></li>
					<li><a href="#">Camera Mobile phone Policy</a></li>					
				</ul>
				</article>
			</div>
			<div>
				

			</div>
			<div class="viewall">
				<a href="javascript:void(0)">View All</a>
			</div>
		</div>
	</div>
</div>
</li>
    <li> <a href="javascript:;" class="drop navlink">Work Tools</a><span class="selected_link">&nbsp;</span>
      <div class="dropdown dropdown_fullwidth">
	
            <div class="col_5 workTools">
        	<div class="links_content nbrdr">
	           <article class="col3">		 
			 
              <article  class="col_list w160">
			   <h1 class="RegH1 BlackHeader">Find it Fast</h1>
               <h1>GRE Tools</h1>
                <ul class="list">
                 
								
                                 
								  <li index="0" groupindex="0" id="yui-gen96" class="yuimenuitem first-of-type"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/FATools/FAForms/CreateQuickTicket.aspx?id=sta">GRE Request</a></li>
                                 <li index="2" groupindex="0" id="yui-gen27" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/FATools/faforms/CreateQuickTicket.aspx?id=bus">Business Card</a></li>                                 
                                 <li index="3" groupindex="0" id="yui-gen28" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/FATools/CabBooking/">Cab Booking </a></li>
                                 <li index="4" groupindex="0" id="yui-gen29" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/fatools/crb/">Conference Room Booking  </a></li>
                                 <li index="5" groupindex="0" id="yui-gen30" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/FATools/faforms/EnrollFitness.aspx">Gym Membership    </a></li>
                                 <li index="6" groupindex="0" id="yui-gen31" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/fatools/opac/">Library Request</a></li>
                                 <li index="7" groupindex="0" id="yui-gen32" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/Materialmove/">Material Movement</a></li>
                                 <li index="8" groupindex="0" id="yui-gen33" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/FATools/faforms/MobilePhoneRequestForm.aspx">Mobile Phone   </a></li>
                                 <li index="9" groupindex="0" id="yui-gen34" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/FATools/faforms/VehicleParkingAllotmentform.aspx">Parking Slot   </a></li>
                                 <li index="10" groupindex="0" id="yui-gen35" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/FATools/faforms/CreateQuickTicket.aspx?id=rep">Repairs and Maintenance  </a></li>
                                 <li index="11" groupindex="0" id="yui-gen36" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/FATools/faforms/CreateQuickTicket.aspx?id=sta">Stationery</a></li>
                                 <li index="12" groupindex="0" id="yui-gen37" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/FATools/TravelDesk/">Travel Request  </a></li>
                                 <li index="13" groupindex="0" id="yui-gen38" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/FATools/WeekEndService/">Weekend Food Service</a></li>
				 <li index="14" groupindex="0" id="yui-gen39" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/FATools/CarPooling/">Car Pooling</a></li>
				  
                </ul>
              </article>
              
              <article class="col_list w170">
			   <h1 class="RegH1">&nbsp;</h1>
			  <h1>Finance Tools</h1>
                <ul class="list list_full p10">
                
                                   
                                  <li index="2" groupindex="0" id="yui-gen57" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="https://psfin-vdsindia.verizon.com/bzlpdora/signon.html">Peoplesoft 9.0</a></li>
                </ul>
                 <h1>Security Tools</h1>
                <ul class="list list_full">
				
								  <li index="2" groupindex="0" id="yui-gen98" class="yuimenuitem"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/Exception/Forms/NewRequest.aspx">Security Exception Request</a></li>	
                                  <li index="2" groupindex="0" id="yui-gen44" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/SecurityTools/AccessProvision/">Access Provisioning Tool</a></li>
                                  <li index="3" groupindex="0" id="yui-gen45" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/EmployeeProfile/EP/">Employee Profile</a></li>
                                  <li index="4" groupindex="0" id="yui-gen46" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/SecurityTools/IncidentReport/">Incident Report</a></li>                                 
								  
                </ul>
						
             
			  
			   <h1>SPO Tools</h1>
                <ul class="list list_full p10">
                                                  
                                 
                                  <li index="2" groupindex="0" id="yui-gen52" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/eSourcing/">eSourcing Tool</a></li>
                </ul>
                
				<h1>Buss Ops Tools</h1>
				
                <ul class="list list_full p10">
                                                                    <li index="3" groupindex="0" id="yui-gen78" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/Exception/Forms/NewRequest.aspx">Exception Tool</a></li>
                                    <li index="4" groupindex="0" id="yui-gen79" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/Homepages/Repositories/GSPMO/">GSPMO Repository</a></li>
				    <li index="5" groupindex="0" id="yui-gen80" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/Homepages/Repositories/VZB/">VzB PMO Repository</a></li>
                                    <li index="6" groupindex="0" id="yui-gen81" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/EmployeeProfile/mcptool/">MCP Tool</a></li>
									
                
                                  	
                                  <li index="2" groupindex="0" id="yui-gen62" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://vdsindia.verizon.com:8080/" target="_blank">QMS-Project Management Tool</a></li>
                
                </ul>
              </article>
			  <article class="col_list w200">
			  <h1 class="RegH1">&nbsp;</h1>
			  <h1>IT Infra Tools</h1>
                <ul class="list list_full p10">
                 
										 <li index="1" groupindex="0" id="yui-gen97" class="yuimenuitem"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://helpdesk.verizon.com:7001/SelfHelp/" target="_blank">Quick Ticket - System &amp; Network</a></li>
                                        <li index="2" groupindex="0" id="yui-gen70" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://ldsindia.verizon.com/" target="_blank">LAN &amp; Desktop Services</a></li>
                                        <li index="3" groupindex="0" id="yui-gen71" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://pso.verizon.com/apps/EnsSystem/" target="_blank">VOIP Configuration</a></li>
                                        <li index="4" groupindex="0" id="yui-gen72" class="yuimenuitem"><a class="yuimenuitemlabel2 yuimenuitemlabel" href="http://pso.verizon.com/" target="_blank">Production Support &amp; Optimization</a></li>
										
                </ul>
				
				<h1>Employee Engagement</h1>
                <ul class="list list_full p10">
                 <li index="0" groupindex="0" id="yui-gen84" class="yuimenuitem first-of-type"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/homepages/hr/hrpages/Hr_Home.aspx?strContent=HP_HR_Diversity">Diversity Council</a></li>                                  
                                  <li index="1" groupindex="0" id="yui-gen85" class="yuimenuitem"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/homepages/hr/hrpages/Spice_Home.aspx">SPICE</a></li>                                  
                                  <li index="2" groupindex="0" id="yui-gen86" class="yuimenuitem"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/homepages/hr/hrpages/HR_VZBeats_Home.aspx">VZ Beats</a></li>                                  
                                  <li index="3" groupindex="0" id="yui-gen87" class="yuimenuitem"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/homepages/hr/hrpages/WAVE/Home.aspx">WAVE</a></li>
								  <li index="3" groupindex="0" id="yui-gen87" class="yuimenuitem"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/homepages/hr/hrpages/WAVE/Home.aspx">Center of Excellence</a></li> 
                </ul>
				<h1>Corporate Communications</h1>
                <ul class="list list_full p10">
                 <li index="0" groupindex="0" id="yui-gen90" class="yuimenuitem first-of-type"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/homepages/CMS/News.aspx?pagename=News_NewsArchive">News Archive</a></li>   
                                <li index="1" groupindex="0" id="yui-gen91" class="yuimenuitem"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/homepages/Photogallery/">Photo Gallery </a></li>   
                                <li index="2" groupindex="0" id="yui-gen92" class="yuimenuitem"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/homepages/CMS/News.aspx?pagename=News_VOVArchive">VoV Archive</a></li>
                </ul>
              </article>
               </article>
			  <article class="col_list w160">
					<h1 class="RegH1 BlackHeader">Corporate Groups</h1>
                 <ul class="list">
            <li index="0" groupindex="0" id="yui-gen8" class="yuimenuitem  first-of-type"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/homepages/hr/hrpages/">Human Resources</a></li>
            <li index="0" groupindex="0" id="yui-gen25" class="yuimenuitem  first-of-type"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/homepages/facility/">Global Real Estate</a></li>
              <li index="0" groupindex="0" id="yui-gen55" class=" yuimenuitem first-of-type"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/Homepages/WebCMS/CMSWeb.aspx?strContent=HP_FIN_Home">Finance </a></li>
             <li index="0" groupindex="0" id="yui-gen42" class=" yuimenuitem first-of-type"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/homepages/security/securitypages/">Security </a></li> 
            <li index="0" groupindex="0" id="yui-gen50" class="yuimenuitem  first-of-type"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/homepages/SPO/">Supply Chain</a></li>   
			<li index="0" groupindex="0" id="yui-gen65" class=" yuimenuitem first-of-type"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/homepages/cms/CMSWeb.aspx?pagename=HP_LEG_Home">Legal </a></li>
			<li index="0" groupindex="0" id="yui-gen75" class="yuimenuitem  first-of-type"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/homepages/GOPMO/">Business Operation</a></li>
			
								<li index="0" groupindex="0" id="yui-gen60" class=" yuimenuitem first-of-type"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://vdsindia.verizon.com/authenticated/homepages/QMS/">Quality Management System</a></li>
								<li index="0" groupindex="0" id="yui-gen68" class=" yuimenuitem first-of-type"><a class="yuimenuitemlabel_home yuimenuitemlabel" href=
"http://vipsindia.verizon.com/">IT Infrastructure</a></li>
          </ul>
              </article>
			
              <div>
              
              </div>
			  
             
        	</div>
        </div>
      </div>
    </li>
    <!--Work Tools-->
   <!--<li> <a href="javascript:;" class="drop navlink">Quick Tickets</a><span class="selected_link">&nbsp;</span>
      <div class="dropdown dropdown_2columns">
        <div class="col_1 firstcolumn">
          <ul class="link_list">
           
            
             
			  
          </ul>
        </div>
      </div>
    </li>-->
    
    <!--My NetWork-->
   
	 <!--My NetWork-->
    <li> <a href="javascript:;" class="drop navlink">My NetWork</a><span class="selected_link">&nbsp;</span>
      <div class="dropdown dropdown_2columns">
        <div class="col_1 firstcolumn">
          <ul class="link_list">
            <li><a href="javascript:;">My NetWorks</a></li>
            <li><a href="javascript:;">View My Groups</a></li>
            <li><a href="javascript:;">Ideas</a></li>
            <li><a href="javascript:;">vTweet</a></li>
            <li><a href="javascript:;">Q&amp;As</a></li>
            <li><a href="javascript:;">VZ Wiki</a></li>
            <li><a href="javascript:;">My NetWork Support</a></li>
          </ul>
        </div>
      </div>
      <!-- End 2 columns container -->
    </li>
     <li> <a href="javascript:;" class="drop navlink">Contact Us</a><span class="selected_link">&nbsp;</span>
      <div class="dropdown dropdown_2columns">
        <div class="col_1 firstcolumn">
          <ul class="link_list">
            <li index="0" groupindex="0" id="yui-gen102" class="yuimenuitem first-of-type"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://vdsindia.verizon.com/vdsicontact.aspx">VDSI Contact</a></li>
                          <li index="1" groupindex="0" id="yui-gen103" class="yuimenuitem"><a class="yuimenuitemlabel_home yuimenuitemlabel" href="http://vdsindia.verizon.com/vdsiintranetcontact.aspx">VDSI Intranet Contact</a></li>
          </ul>
        </div>
      </div>
      <!-- End 2 columns container -->
    </li>
  </ul>
  <!-- END MENU -->
  </nav>
  </div>
</section>
        <nav class="sec_nav">
    <article class="header_links"> 
        <!--<section class="stock"> <span><strong>VZ</strong>&nbsp;42.71</span><span class="name stock_up">+0.31</span><span class="plus_ico">&nbsp;</span> </section>-->
    </article>
</nav>
    </div>
    </form>
</body>
</html>
