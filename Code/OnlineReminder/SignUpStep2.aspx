<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUpStep2.aspx.cs" Inherits="SignUpStep2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Activation</title>
    <style type="text/css">
        #form1
        {
            height: 606px;
        }
        .style1
        {
        }
        .style2
        {
            width: 132px;
        }
        h1
        {                    
          font-family:"alberto";
          font-size:70px;
          color:cornsilk;
       }
       td
       {
       	    color:gray;
       	}
        .style3
        {
            height: 43px;
        }
        .style4
        {
            width: 132px;
            height: 43px;
        }
        .style5
        {
            height: 74px;
        }
        .style6
        {
            height: 27px;
        }
        .style7
        {
            width: 132px;
            height: 27px;
        }
        </style>
</head>
<body background="SignUp2.png">
    <form id="form1" runat="server">
<h1> &nbsp; &nbsp; ping</h1>
    <p> &nbsp;</p>
    <asp:Panel ID="Panel1" runat="server" 
    style="Position:absolute; top: 133px; left: 803px; width: 459px;" 
        Height="360px">
        <table style="width:100%; font-family: Calibri;">
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="style5" colspan="3" valign="middle">
                    <asp:Label ID="Label4" runat="server" Font-Names="Calibri" Font-Size="XX-Large" 
                        Text="Activate your account" Font-Bold="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    </td>
                <td class="style7">
                    </td>
                <td class="style6">
                    </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label1" runat="server" Text="Enter E-Mail confirmation code" 
                        Font-Names="Calibri"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="TextBox1" runat="server" style="margin-left: 0px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Font-Names="Calibri" Text="Resend" 
                        Width="58px" onclick="Button1_Click" />
                </td>
            </tr>
            <tr>
                <td class="style3">
                    </td>
                <td class="style4">
                    <asp:Label ID="Label5" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>
                </td>
                <td class="style3">
                    </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label3" runat="server" Text="Enter mobile confirmation code"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Button2" runat="server" Font-Names="Calibri" Text="Resend" 
                        Width="58px" onclick="Button2_Click" />
                </td>
            </tr>
            <tr>
                <td class="style3">
                    </td>
                <td class="style4">
                    <asp:Label ID="Label6" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>
                </td>
                <td class="style3">
                    </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td align="center" class="style2" valign="middle">
                    <asp:Button ID="Button3" runat="server" Font-Names="Calibri" Font-Size="Large" 
                        Height="30px" Text="Next" Width="67px" onclick="Button3_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    </form>
</body>
</html>
