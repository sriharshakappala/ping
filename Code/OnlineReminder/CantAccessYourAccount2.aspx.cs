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

public partial class CantAccessYourAccount2 : System.Web.UI.Page
{
    User u;
    protected void Page_Load(object sender, EventArgs e)
    {
        u = (User)Session["User"];
        if (u == null)
            Response.Redirect("Login.aspx");
        if(!IsPostBack)
            Label1.Text += " " + u.getRecoveryEmail() + " and " + u.getRecoveryMobile();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string body = "User Name : " + u.getUserName() + "\n" +
                      "Password  : " + u.getPassword();
        WebMail.Send("ping.reminder@gmail.com", u.getRecoveryEmail(), "Account Information", body);
        Message.Send(u.getRecoveryMobile(), body);
    }
}
