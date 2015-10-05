<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Questionsframe.aspx.vb"
    Inherits="Questionsframe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Refresh" content="30" />
    <link rel="stylesheet" href="includes/css/reset.css" />
    <link rel="stylesheet" href="includes/css/text.css" />
    <link rel="stylesheet" href="includes/css/960.css" />
    <link rel="stylesheet" href="includes/css/jquery.modalpopup.css" />
    <link rel="stylesheet" href="includes/css/buttons.css" />
    <!--Custom Verizon CSS not part of 960gs-->
    <link rel="stylesheet" href="includes/css/vzomegalight.css" />
    <link rel="stylesheet" href="includes/css/global.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="margin-left: 10px; width: 900px;">
            <tr>
                <td style="width: 140px" valign="bottom">
                    <h1>
                        Questions Asked
                    </h1>
                    <h3>
                        (This section will refresh every 30 seconds automatically)</h3>
                </td>
            </tr>            
            <tr>
                <td>
                    <asp:SqlDataSource ID="DB" runat="server" ConnectionString="Data Source=INOLYP1CVVDV01;Initial Catalog=ITIM;User ID=ShownShare;Password=Sh0w&sh@re"
                        SelectCommand="select row_number() over(order by askedon asc) as QuestionNo,* from [dbo].[tblShownShare] where approved = 'Yes' order by askedon desc">
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" DataSourceID="DB" ForeColor="#333333" GridLines="None"
                        PageSize="500" Width="890px" Font-Size="Medium">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="QuestionNo" HeaderText="QuestionNo" SortExpression="QuestionNo"
                                ItemStyle-Width="90px" />
                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                            <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question" />
                            <asp:BoundField DataField="askedon" HeaderText="Asked at" SortExpression="askedon"
                                DataFormatString="{0:dd-MMM-yyyy hh:mm tt}" ItemStyle-Width="140px" />
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
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
