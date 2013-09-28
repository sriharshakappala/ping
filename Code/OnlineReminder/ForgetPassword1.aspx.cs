using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgetPassword1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    User u; 
    protected void Button1_Click(object sender, EventArgs e)
    {
        u = new User().getById(TextBox1.Text);
        if (u != null)
        {
            Label2.Text = u.getSecurityQuestion();
            Label3.Text = "Answer";
            TextBox2.Visible = Button2.Visible = true;
        }
        else 
        {
            Label1.Text = "Invalid Username";
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        u = new User().getById(TextBox1.Text);
        if (TextBox2.Text == u.getAnswer())
        {
            Session.Add("User", u);
            string body = "User Name : " + u.getUserName() + "\n" + 
                          "Password  : " + u.getPassword();
            WebMail.Send("ping.reminder@gmail.com", u.getRecoveryEmail(), "Account Information", body);
            Message.Send(u.getRecoveryMobile(), body);
            Response.Redirect("CantAccessYourAccount2.aspx");

        }
        else
            Label4.Text = "Incorrect answer";
    }
}