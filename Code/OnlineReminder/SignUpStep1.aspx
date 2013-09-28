<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUpStep1.aspx.cs" Inherits="SignUp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <style type="text/css">
        .style14
        {
            width: 467px;
            height: 22px;
        }
        .style22
        {
            height: 22px;
        }
        .style32
        {
            width: 139px;
            height: 29px;
        }
        .style33
        {
            width: 101%;
            height: 656px;
        }
        .style34
        {
            height: 22px;
        }
        .style35
        {
            height: 39px;
        }
        .style36
        {
            width: 139px;
            height: 26px;
        }
        #Text1
        {
            margin-bottom: 0px;
        }
        .style38
        {
            height: 39px;
            width: 326px;
        }
        .style39
        {
            width: 326px;
            height: 29px;
        }
        .style40
        {
            width: 326px;
            height: 26px;
        }
        .style41
        {
            width: 353px;
            height: 12px;
        }
        .style42
        {
            height: 12px;
        }
        h1
        {                    
          font-family:"alberto";
          font-size:70px;
          color:cornsilk;
       }
        .style55
        {
            width: 326px;
            height: 22px;
        }
        .style56
        {
            width: 353px;
            height: 29px;
        }
        .style57
        {
            width: 353px;
            height: 22px;
        }
        .style58
        {
            width: 353px;
            height: 26px;
        }
       </style>
    <script language=javascript>
        function ClearLabel()
        {
            var obj = document.getElementById("<%= Label11.ClientID %>");
            obj.innerHTML = "";
        }
    </script>
    </head>
<body background="SignUp2.png">
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panel1" runat="server" 
            style="position:absolute; top: 7px; left: 801px; width: 539px;">
            <table style="font-family: Calibri; font-size: large;" class="style33">
                <tr>
                    <td class="style34" style="text-align: left" align="center" colspan="2" 
                        valign="middle">
                        &nbsp;</td>
                    <td class="style55">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style35" colspan="2" style="text-align: center">
                        <asp:Label ID="Label9" runat="server" Font-Names="Calibri" Font-Size="XX-Large" 
                            Text="Sign Up"></asp:Label>
                    </td>
                    <td class="style38" style="text-align: left">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style34" colspan="2" style="text-align: center">
                        </td>
                    <td class="style55" style="text-align: left">
                        </td>
                </tr>
                <tr>
                    <td class="style56" style="text-align: left">
                        <asp:Label ID="Label1" runat="server" Font-Names="Calibri" Font-Size="Large" 
                            Text="Name"></asp:Label>
                        </td>
                    <td class="style32">
                        <asp:TextBox ID="TextBox1" runat="server" Width="235px" ></asp:TextBox>
                    </td>
                    <td class="style39">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style57" style="text-align: left">
                        </td>
                    <td class="style14" colspan="2">
                        </td>
                </tr>
                <tr>
                    <td class="style57">
                        <asp:Label ID="Label2" runat="server" Font-Names="Calibri" Font-Size="Large" 
                            Text="Desired Login Name"></asp:Label>
                    </td>
                    <td class="style22">
                        <asp:TextBox ID="TextBox2" runat="server" Width="235px" ></asp:TextBox>
                    </td>
                    <td class="style55">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBox2" ErrorMessage="Login Name is must." 
                            Font-Names="Calibri" Font-Size="Small" ValidationGroup="signup"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style57">
                    </td>
                    <td class="style22" colspan="2" valign="top">
                        <asp:Button ID="Button2" runat="server" Font-Names="Calibri" 
                            onclick="Button2_Click" Text="Check Availability" UseSubmitBehavior="False" 
                            Width="109px" />
                        <asp:Label ID="Label10" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style57">
                        <asp:Label ID="Label3" runat="server" Font-Names="Calibri" Font-Size="Large" 
                            Text="Choose Password"></asp:Label>
                    </td>
                    <td class="style22" valign="middle">
                        <asp:TextBox ID="TextBox3" runat="server" Width="235px" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="style55" valign="middle">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="TextBox3" ErrorMessage="Password is must." 
                            ValidationGroup="signup" Font-Size="Small"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style57">
                        &nbsp;</td>
                    <td class="style22" valign="middle">
                        &nbsp;</td>
                    <td class="style55" valign="middle">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left" class="style57" valign="top">
                        <asp:Label ID="Label4" runat="server" Font-Names="Calibri" Font-Size="Large" 
                            Text="Re-Enter Password"></asp:Label>
                    </td>
                    <td class="style14" valign="top" colspan="2">
                        <asp:TextBox ID="TextBox4" runat="server" Width="235px" TextMode="Password"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style57" valign="top">
                        &nbsp;</td>
                    <td class="style14" valign="top" colspan="2">
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToCompare="TextBox3" ControlToValidate="TextBox4" 
                            ErrorMessage="Passwords typed do not match, please re enter your passwords." 
                            Font-Names="Calibri" ValidationGroup="signup" Font-Size="Small"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style57" valign="top" align="left">
                        <asp:Label ID="Label5" runat="server" Font-Names="Calibri" Font-Size="Large" 
                            Text="Recovery E-mail"></asp:Label>
                    </td>
                    <td class="style22" valign="top">
                        <asp:TextBox ID="TextBox5" runat="server" Width="235px" onblur="ClearLabel();"></asp:TextBox>
                        <br />
                    </td>
                    <td class="style55" valign="top">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="TextBox5" ErrorMessage="E-mail is must." 
                            ValidationGroup="signup" Font-Size="Small"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style57" valign="top">
                        &nbsp;</td>
                    <td class="style14" colspan="2" valign="top">
                        <asp:Label ID="Label11" runat="server" Font-Names="Calibri" Font-Size="Small" 
                            ForeColor="Red"></asp:Label>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="TextBox5" 
                            ErrorMessage="Invalid E-Mail id, please enter a valid E-Mail id." 
                            Font-Names="Calibri" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ValidationGroup="signup" Font-Size="Small"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style57" valign="top">
                        <asp:Label ID="Label6" runat="server" Font-Names="Calibri" Font-Size="Large" 
                            Text="Mobile Number"></asp:Label>
                    </td>
                    <td class="style22" valign="top">
                        <asp:TextBox ID="TextBox6" runat="server" Width="235px"></asp:TextBox>
                        <br />
                    </td>
                    <td class="style55" valign="top">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="TextBox6" ErrorMessage="Mobile number is must." 
                            ValidationGroup="signup" Font-Size="Small"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style57" valign="top">
                        &nbsp;</td>
                    <td class="style14" colspan="2" valign="top">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="TextBox6" 
                            ErrorMessage="Invalid mobile number, enter a valid mobile number." 
                            Font-Names="Calibri" ValidationExpression="\d{10}" 
                            ValidationGroup="signup" Font-Size="Small"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style57">
                        <asp:Label ID="Label7" runat="server" Font-Names="Calibri" Font-Size="Large" 
                            Text="Security Question"></asp:Label>
                    </td>
                    <td class="style14" colspan="2">
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="21px" Width="235px">
                            <asp:ListItem>-Select one-</asp:ListItem>
                            <asp:ListItem>What was your childhood nickname?
                            </asp:ListItem>
                            <asp:ListItem>What is the name of your favorite childhood friend?
                            </asp:ListItem>
                            <asp:ListItem>Where were you when you had your first kiss?</asp:ListItem>
                            <asp:ListItem>What was the name of your elementary / primary school?</asp:ListItem>
                            <asp:ListItem>What is the name of the company of your first job?</asp:ListItem>
                            <asp:ListItem>What was your dream job as a child?
                            </asp:ListItem>
                            <asp:ListItem>What is your pet&#39;s name?</asp:ListItem>
                            <asp:ListItem>What is your mother&#39;s maiden name?</asp:ListItem>
                            <asp:ListItem>In what city were you born?</asp:ListItem>
                            <asp:ListItem>What is your address, phone number?</asp:ListItem>
                            <asp:ListItem>What is your favorite animal?</asp:ListItem>
                            <asp:ListItem Value="-- Type your question here --">-- Type your question here 
                            --</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style57">
                        &nbsp;</td>
                    <td class="style14" colspan="2">
                        <span class="Apple-style-span" 
                            style="border-collapse: separate; color: rgb(0, 0, 0); font-family: 'Times New Roman'; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; font-size: medium;">
                        <span class="Apple-style-span" 
                            style="color: rgb(111, 111, 111); font-family: arial, sans-serif; font-size: 13px;">
                        If you forget your password we will ask for the answer to
                        <br />
                        your security question.</span></span></td>
                </tr>
                <tr>
                    <td class="style57">
                        <asp:Label ID="Label8" runat="server" Font-Names="Calibri" Font-Size="Large" 
                            Text="Answer"></asp:Label>
                    </td>
                    <td class="style14" colspan="2">
                        <asp:TextBox ID="TextBox7" runat="server" Width="235px"></asp:TextBox>
                    </td>
                </tr>
                <tr align="center">
                    <td class="style41">
                        </td>
                    <td align="left" class="style42" colspan="2">
                    </td>
                </tr>
                <tr>
                    <td class="style58">
                        &nbsp;</td>
                    <td align="center" class="style36" valign="middle">
                        <asp:Button ID="Button1" runat="server" Text="Submit" UseSubmitBehavior="False" 
                            ValidationGroup="signup" onclick="Button1_Click" style="height: 26px" />
                    </td>
                    <td align="center" class="style40" valign="middle">
                        &nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
