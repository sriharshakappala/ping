using System;
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

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox1.Focus();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        User u = new User().getById(TextBox1.Text);
        if (u != null)
        {
            if (u.getPassword() == TextBox2.Text)
            {
                Session.Add("User", u);
                Dummy d = Dummy.getById(TextBox1.Text);
                if(d == null)
                    Response.Redirect("Default2.aspx");
                else
                    Response.Redirect("./SignUpStep2.aspx?UserName="+u.getUserName()+"&Email="+u.getRecoveryEmail()+"&MobileNumber="+u.getRecoveryMobile());
            }
        }
        Label8.Text = "&nbsp;&nbsp;&nbsp;&nbsp;Invalid Username or Password";
    }
}
