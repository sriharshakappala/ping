<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="SendMessage.aspx.cs"
    Inherits="SendMessage" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        td{ font-family:Calibri }
    .style17
    {
        width: 24px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <form name="form1">
        <table>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                <asp:Panel ID="Panel1" runat="server" Width="564px" BackColor="#D8D8D8">
            <table width="100%">
                <tr>
                    <td class="style17">
                        &nbsp;</td>
                    <td colspan="2">
                        &nbsp;</td>
                    <td colspan="3" style="text-align: left">
                        <asp:Label ID="Label2" runat="server" Font-Names="Calibri" Font-Size="X-Large" 
                            Text="New Message"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style17">
                        &nbsp;</td>
                    <td colspan="2">
                        &nbsp;</td>
                    <td colspan="3" style="text-align: left">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style17">
                        &nbsp;</td>
                    <td colspan="2">
                        Mobile Number
                    </td>
                    <td colspan="2" style="text-align: left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBox1" ErrorMessage="*" ValidationGroup="SendMessage"></asp:RequiredFieldValidator>
                    </td>
                    <td style="text-align: left">
                        <asp:TextBox ID="TextBox1" runat="server" Columns="32" Font-Names="Calibri" 
                            style="margin-left: 0px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="TextBox1" ErrorMessage="Invalid Mobile Number" 
                            Font-Size="Small" ValidationExpression="\d{10}" ValidationGroup="SendMessage"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style17">
                        &nbsp;</td>
                    <td colspan="2">
                        Message
                    </td>
                    <td rowspan="3" style="text-align: left">
                        &nbsp;&nbsp; &nbsp;</td>
                    <td rowspan="3" colspan="2" style="text-align: left">
                        <asp:TextBox ID="TextBox2" runat="server" Columns="32" Font-Names="Calibri" 
                            Rows="10" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style17">
                        &nbsp;</td>
                    <td colspan="2">
                    </td>
                </tr>
                <tr>
                    <td class="style17">
                        &nbsp;</td>
                    <td colspan="2">
                    </td>
                </tr>
                <tr>
                    <td class="style17">
                        &nbsp;</td>
                    <td colspan="2">
                        &nbsp;
                    </td>
                    <td align="center" colspan="2" style="text-align: left">
                        &nbsp;</td>
                    <td align="center" style="text-align: left">
                        &nbsp; &nbsp;
                        <asp:Button ID="Button4" runat="server" Font-Names="Calibri" 
                            OnClick="Button3_Click" Text="Send" ValidationGroup="SendMessage" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input id="Reset2" type="reset" value="Reset" style="font-family: Calibri;" />
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style17">
                        &nbsp;</td>
                    <td>
                        &nbsp;
                    </td>
                    <td colspan="2">
                        &nbsp;</td>
                    <td class="style30" colspan="2">
                        &nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
                </td>
            </tr>
        </table>
        </form>
    </div>
</asp:Content>
