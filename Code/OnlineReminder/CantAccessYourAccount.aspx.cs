using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class CantAccessYourAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        User u = new User().getByEmailId(TextBox1.Text);
        if (u != null)
        {
            Session.Add("User", u);
            string body = "User Name : "+u.getUserName()+"\n"+
                          "Password  : "+u.getPassword();
            WebMail.Send("ping.reminder@gmail.com", u.getRecoveryEmail(), "Account Information", body);
            Message.Send(u.getRecoveryMobile(), body);
            Response.Redirect("CantAccessYourAccount2.aspx");
        }
        else
            Label1.Text = "&nbsp;&nbsp;&nbsp;No account found with that email address";
    }
}
