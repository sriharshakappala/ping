<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="SendMail.aspx.cs" Inherits="SendMail" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style13
        {
            height: 23px;
        }
        .style17
        {
            height: 24px;
            width: 237px;
        }
        .style18
        {
            height: 28px;
            text-align: left;
        }
        .style19
        {
            height: 14px;
            text-align: left;
        }
        .style20
        {
            height: 26px;
        }
        .style21
        {
            height: 23px;
        }
    .style22
    {
        height: 24px;
        width: 41px;
    }
    .style23
    {
        width: 41px;
    }
    .style24
    {
        height: 28px;
        text-align: left;
        width: 41px;
    }
    .style25
    {
        height: 14px;
        text-align: left;
        width: 41px;
    }
    .style26
    {
        height: 26px;
        width: 41px;
    }
    .style27
    {
        height: 23px;
        width: 41px;
    }
    .style28
    {
        height: 24px;
        width: 56px;
    }
    .style29
    {
        width: 56px;
    }
    .style30
    {
        height: 28px;
        text-align: left;
        width: 56px;
    }
    .style31
    {
        height: 14px;
        text-align: left;
        width: 56px;
    }
    .style32
    {
        height: 26px;
        width: 56px;
    }
    .style33
    {
        height: 23px;
        width: 56px;
    }
    .style34
    {
        width: 522px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1">
    <div>
        <table>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style34">
                <asp:Panel ID="Panel1" runat="server" BackColor="#D8D8D8">
            <table style="width: 67%;" style="font-family: Calibri;">
                <tr>
                    <td class="style28">
                        </td>
                    <td class="style22">
                        </td>
                    <td class="style17">
                        </td>
                    <td class="style17">
                        </td>
                </tr>
                <tr>
                    <td class="style29">
                        </td>
                    <td class="style23">
                        </td>
                    <td style="text-align: center">
                        <asp:Label ID="Label2" runat="server" Font-Names="Calibri" Font-Size="X-Large" 
                            Text="New Mail"></asp:Label>
                    </td>
                    <td>
                        </td>
                </tr>
                <tr>
                    <td class="style30">
                        </td>
                    <td class="style24">
                        To
                    </td>
                    <td class="style18">
                        <asp:TextBox ID="TextBox1" runat="server" Width="419px"></asp:TextBox>
                    </td>
                    <td class="style18">
                        &nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBox1" ErrorMessage="*" ValidationGroup="SendMail"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style31">
                    </td>
                    <td class="style25">
                    </td>
                    <td class="style19">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="TextBox1" ErrorMessage="Invalid E-mail Id" 
                            Font-Names="Calibri" Font-Size="Small" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ValidationGroup="SendMail" Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                    <td class="style19">
                    </td>
                </tr>
                <tr>
                    <td class="style32">
                        </td>
                    <td class="style26">
                        Subject
                    </td>
                    <td class="style20">
                        <asp:TextBox ID="TextBox2" runat="server" Width="418px"></asp:TextBox>
                    </td>
                    <td class="style20">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style33">
                    </td>
                    <td class="style27">
                    </td>
                    <td class="style21">
                    </td>
                    <td class="style21">
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="style29">
                        &nbsp;</td>
                    <td valign="top" class="style23">
                        &nbsp;Body
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" Columns="50" Rows="10" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Panel ID="Panel3" runat="server" Width="34px">
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="style29">
                        &nbsp;</td>
                    <td class="style23">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style29">
                        &nbsp;</td>
                    <td class="style23">
                        &nbsp;
                    </td>
                    <td align="right" style="text-align: center">
                        <asp:Button ID="Button1" runat="server" Font-Names="Calibri" Text="Send" 
                            onclick="Button1_Click" ValidationGroup="SendMail" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input ID="Reset1" style="font-family: Calibri;" type="reset" value="Reset" />
                    </td>
                    <td align="right" style="text-align: center">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style29">
                        &nbsp;</td>
                    <td class="style23">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    </form>
</asp:Content>

