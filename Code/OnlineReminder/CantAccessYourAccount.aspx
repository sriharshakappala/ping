<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CantAccessYourAccount.aspx.cs" Inherits="CantAccessYourAccount" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
   <style>
     h1
      {            
          color:Black;
          font-family:"alberto";
          font-size:70px;
      }
      tr
      {
        color:Black;
        font-family:"Calibri";
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
    <h1> ping </h1>   
     <table>
        <tr>
         <td> <font size="5"> <b> <br> <br> Forget Username?  </font> </b> </td>
      </tr>
      <tr>
         <td> Please enter the recovery email address you provided when creating your account. <br> <br> </td>
      </tr> 
     </table>
     <table>
         <tr>
           <td> <b> E-mail Address &nbsp; &nbsp;  </b> </td>
           <td> &nbsp;&nbsp;<b><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
               </b> &nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                   runat="server" ControlToValidate="TextBox1" ErrorMessage="*" 
                   Font-Names="Calibri" Font-Size="Small" ValidationGroup="CAUA"></asp:RequiredFieldValidator>
&nbsp;</td>           
           <td> &nbsp;<asp:Button ID="Button1" runat="server" Font-Names="Calibri" 
                   Font-Size="Small" Text="Submit" onclick="Button1_Click" 
                   ValidationGroup="CAUA" />
                 </td>
         <tr>
           <td> &nbsp;</td>
           <td colspan="2"> 
               <asp:Label ID="Label1" runat="server" Font-Names="Calibri" Font-Size="Small" 
                   ForeColor="#CC3300"></asp:Label>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                   ControlToValidate="TextBox1" 
                   ErrorMessage="&amp;nbsp;&amp;nbsp;Invalid E-Mail id" Font-Names="Calibri" 
                   Font-Size="Small" 
                   ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                   ValidationGroup="CAUA"></asp:RegularExpressionValidator>
             </td>
           </table>
     <p class="fontStyle">
          <br> <br> <br> <br> <br>  ***Note that the e-mail address you type is a valid and existed one. We reset your username by sending it to your e-mail that is specified by you at the time of account creation.
     </p>
     </form>
 </body>
</html>