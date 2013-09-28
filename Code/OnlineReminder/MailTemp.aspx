<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MailTemp.aspx.cs" Inherits="Mail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panel1" runat="server" Width="564px" Style="position: absolute;
            top: 38px; left: 227px; height: 520px;">
            <table style="width: 100%;" style="font-family: Calibri;">
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
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
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        To
                    </td>
                    <td>
                        &nbsp;
                        <asp:TextBox ID="TextBox1" runat="server" Width="419px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        Subject
                    </td>
                    <td>
                        &nbsp;
                        <asp:TextBox ID="TextBox2" runat="server" Width="418px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:Panel ID="Panel2" runat="server" Width="35px">
                        </asp:Panel>
                    </td>
                    <td valign="top">
                        &nbsp;Body
                    </td>
                    <td>
                        &nbsp;
                        <asp:TextBox ID="TextBox3" runat="server" Columns="50" Rows="20" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Panel ID="Panel3" runat="server" Width="34px">
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
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
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td align="right" style="text-align: center">
                        <asp:Button ID="Button1" runat="server" Font-Names="Calibri" Text="Submit" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input ID="Reset1" style="font-family: Calibri;" type="reset" value="Reset" />
                    </td>
                    <td align="right" style="text-align: center">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
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
    </div>
    </form>
</body>
</html>
