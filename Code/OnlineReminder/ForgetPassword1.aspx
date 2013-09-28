<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgetPassword1.aspx.cs" Inherits="ForgetPassword1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
      h1
      {            
          font-family:"alberto";
          font-size:70px;
      }
      tr
      {
          font-family:"calibri";
      }
      .fontStyle
      {
          color:red;
          font-family:"calibri";
          font-size:12px;
      }
     </style>
</head>
<body bgcolor="black" background=newbg.jpg>
    <form id="form1" runat="server">
    <div>
         <h1> &nbsp; ping </h1>
     <table>
        <tr>
            <td> <font size="5"> <b> Forget your password? </b> </font> <br> <br> </td> 
        </tr>
        <tr>  
           <td> To reset your password, type the username you use to sign in to your <font face="alberto"> ping </font> account. <br> <br> </td>
        </tr>
     </table>
     <table>
        <tr>
           <td> <b> Username </b> &nbsp; &nbsp; &nbsp; </td>
           <td> &nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
               &nbsp; </td>
           <td> &nbsp;<asp:Button ID="Button1" runat="server" Text="Submit" 
                   onclick="Button1_Click" />
            </td>
        </tr>                
        <tr>
           <td colspan="3"> 
               <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>                
        <tr>
           <td colspan="3"> 
               <asp:Label ID="Label2" runat="server" Font-Bold="True"></asp:Label>
            </td>
        </tr>                
        <tr>
           <td> 
               <asp:Label ID="Label3" runat="server"></asp:Label>
            </td>
           <td> 
               <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
            </td>
           <td> 
               <asp:Button ID="Button2" runat="server" Text="Continue" Visible="False" 
                   onclick="Button2_Click" />
            </td>
        </tr>                
        <tr>
           <td> 
               &nbsp;</td>
           <td> 
               <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
            </td>
           <td> 
               &nbsp;</td>
        </tr>                
     </table>
         <p class="fontStyle">
             ***Note that the username you type is a valid and existed one. We reset your old password by sending it to your e-mail that is specified by you at the time of account creation.
     </p>
    </div>
    </form>
</body>
</html>
