<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="padding-top: 10px">
            <label for="name">
                Your Full Name:
            </label>
            <br>
            <asp:TextBox ID="txtName" runat="server" Style="width: 380px" class="text" Enabled="false"></asp:TextBox>
            <label for="email">
                Email Address:</label>
            <asp:TextBox ID="txtEmail" runat="server" Style="width: 380px" class="text" Enabled="false"></asp:TextBox>
            <label for="message">
                Message:</label>
            <br>
            <asp:TextBox runat="server" ID="txtMessage" Style="margin-bottom: 10px; width: 380px;
                height: 140px" TextMode="MultiLine"></asp:TextBox>
            <div class="btnWrapper">
                <div class="fl">
                    <a href="#" title="Cancel" class="cancelSubmit button modalpopup cboxElement"><span>
                        Cancel</span></a></div>
                <div class="fr">
                    <a runat="server" href="#" title="Submit" onserverclick="btnSubmit_OnClick" class="cancelSubmit button modalpopup cboxElement">
                        <span>Submit</span></a>
                </div>
            </div>
            <div style="width: 380px">
                <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
            </div>
            <script language="javascript">
                $(document).ready(function () {
                    $(".cancelSubmit").bind("click", function () {
                        $.fn.modalpopup.close(); // To close the Popup
                    });
                });
            </script>
        </div>
    </div>
    </form>
</body>
</html>
