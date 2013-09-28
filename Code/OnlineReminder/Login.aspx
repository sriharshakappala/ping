<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Login.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ping</title>
    <style type="text/css">
        .style1
        {
            font-size: x-large;
            height: 55px;
        }
        .style2
        {
        }
        .style3
        {
            width: 269px;
        }
        .style4
        {
            height: 29px;
        }
        h1
        {                    
          font-family:"alberto";
          font-size:70px;
       }
        .style5
        {
            width: 100%;
            height: 431px;
        }
    </style>
</head>
  <body background="Home.jpg">        
    <form id="form1" runat="server">
        <h1> &nbsp; &nbsp; ping <sub><asp:Label ID="Label7" runat="server" Font-Names="Calibri" 
                Font-Size="Medium" Text=" Never let anything go out of your way...&nbsp;" 
                Font-Bold="False"></asp:Label></sub>
        </h1>
        <table class="style5">
            <tr>
                <td align="center" valign="top">
        <font face="Calibri">
            <asp:Panel ID="Panel5" runat="server">
            
        <table>
            <tr>
                <td> &nbsp;</td>
                <td> &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td> <img src="Mailnew.png" width="40" height="40"> </td>
                <td>
                     Get alerts on your mail. 
                </td>
            </tr>
            <tr>
                 <td> <img height="50" src="Mobile.png" width="50"> </img> </td>
                 <td>Get alerts on your mobile too.</td>
            </tr>
            <tr>
                 <td> <img src="Lock.png" width="40" height="40"> </td>
                 <td> Highly secured. Highly tested. </td>
            </tr>
            <tr>
                 <td> <img src="Search.png" width="50" height="50"> </td>
                 <td> "Advance Search" enabled. </td>
            </tr> 
            <tr>
                 <td> <img src="Attachment.png" width="50" height="50"> </td>
                 <td> Attach your files and send. </td>
            </tr>
             <tr>
                 <td> <img src="Cart.png" width="40" height="40"> </td>
                 <td> It's free. Never pay us a single buck. </td>
            </tr>            
       </table>
       </asp:Panel>
       </font>
                </td>
                <td align="center">
        <asp:Panel ID="Panel1" runat="server">
            <table style="width: 28%;">
                <tr>
                    <td class="style3">
                        <asp:Panel ID="Panel2" runat="server" 
                            DefaultButton="Button1" Width="291px">
                            <table style="width: 101%; font-family: Calibri; text-align: center;" 
                                cellspacing="10">
                                <tr>
                                    <td align="center" class="style1" colspan="2">
                                        Sign in to
                                        <asp:Label ID="Label6" runat="server" Font-Names="alberto" Text="ping"></asp:Label>
                                        !</td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        User Name</td>
                                    <td align="left" valign="middle">
                                        &nbsp;
                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        Password</td>
                                    <td align="left" valign="middle">
                                        &nbsp;
                                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style7">
                                        &nbsp;</td>
                                    <td align="left" valign="middle">
                                        &nbsp;
                                        <asp:Button ID="Button1" runat="server" Font-Names="Calibri" Text="Sign in" 
                                            onclick="Button1_Click" Width="55px" style="height: 25px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                       </td>
                                    <td align="left" valign="middle" class="style6">
                                        <asp:Label ID="Label8" runat="server" Font-Names="Calibri" Font-Size="Small" 
                                            ForeColor="#CC3300"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="style2" colspan="2" valign="middle">
                                        <asp:HyperLink ID="HyperLink4" runat="server" Font-Underline="False" 
                                            NavigateUrl="~/CantAccessYourAccount.aspx" ForeColor="Black">Can&#39;t access your account.</asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="style2" colspan="2" valign="middle">
                                        <asp:HyperLink ID="HyperLink5" runat="server" Font-Underline="False" 
                                            ForeColor="Black" NavigateUrl="~/ForgetPassword1.aspx">Forget password.</asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:Panel ID="Panel4" runat="server" Width="295px">
                            <table style="width: 100%; height: 137px;" cellspacing="10">
                                <tr>
                                    <td align="left" valign="middle" class="style4">
                                        <asp:Label ID="Label1" runat="server" Font-Names="Calibri" Text="New to "></asp:Label>
                                        <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Italic="False" 
                                            Font-Names="alberto" Font-Size="X-Large" Text="Ping"></asp:Label>
                                        <asp:Label ID="Label3" runat="server" Font-Names="Calibri" Font-Size="Large" 
                                            Text="? "></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="style4" valign="middle">
                                        <asp:Label ID="Label4" runat="server" Font-Names="Calibri" 
                                            Text="It's free and easy."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="middle">
                                        <asp:Button ID="Button2" runat="server" Font-Names="Calibri" 
                                            Font-Size="X-Large" Height="50px" Text="Create an account" Width="196px" 
                                            PostBackUrl="~/SignUpStep1.aspx" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </asp:Panel>
                </td>
            </tr>
            <tr><td colspan="2" align="center">&nbsp;</td></tr>
            <tr><td colspan="2" align="center">&nbsp;</td></tr>
            <tr><td colspan="2" align="center">
        <font color="#666666" size="-1" style="text-align: left">© 2011 -&nbsp;         <asp:HyperLink ID="HyperLink3" runat="server"><font color="#666666" size="-1">Terms 
        &amp; Conditions</font></asp:HyperLink>
        -
        <asp:HyperLink ID="HyperLink2" runat="server" Font-Names="Calibri"><font 
            color="#666666" size="-1">Help</font></asp:HyperLink>
        </font>
                </td></tr>
            <tr><td colspan="2" align="center">&nbsp;</td></tr>
            </table>
    </form>
</body>
</html>
