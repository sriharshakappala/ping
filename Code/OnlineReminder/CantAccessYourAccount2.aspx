<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CantAccessYourAccount2.aspx.cs" Inherits="CantAccessYourAccount2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Success</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 698px;
        }
        .style2
        {
            height: 172px;
        }
    </style>
</head>
<body background="newbg.jpg">
    <form id="form1" runat="server">
    <div>
        <table class="style1">
            <tr>
                <td valign="middle" align="center" width="100%" class="style2">
                    <asp:Label ID="Label1" runat="server" 
                        Text="Your account details are sent to " 
                        Font-Names="Calibri" Font-Size="XX-Large" ForeColor="Gray"></asp:Label><br />
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Names="Calibri" 
                        Font-Size="Large" Font-Underline="False" onclick="LinkButton1_Click">Click here to resend</asp:LinkButton>
                    <br />
                    <br />
                    <br />
                    <br />  
                    <asp:HyperLink
                            ID="HyperLink1" runat="server" Font-Names="Calibri" 
                        Font-Overline="False" Font-Size="Large" Font-Underline="False" 
                        NavigateUrl="~/Login.aspx">Click here to sign in</asp:HyperLink>
                    </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
