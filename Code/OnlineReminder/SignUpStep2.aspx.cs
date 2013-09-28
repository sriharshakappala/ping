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

public partial class SignUpStep2 : System.Web.UI.Page
{
    Dummy d;
    protected void Page_Load(object sender, EventArgs e)
    {
        string UserName = Request.QueryString.Get("UserName");
        d = Dummy.getById(UserName);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        string EmailId=Request.QueryString.Get("Email");
        WebMail.Send("nakka.rajeev@gmail.com", EmailId, "Activation Code", "Activation code :"+d.getEmailActivationCode());
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string MobileNumber = Request.QueryString.Get("MobileNumber");
        Message.Send(MobileNumber, "Activation code : "+d.getMobileActivationCode());
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string ea=d.getEmailActivationCode();
        string ma=d.getMobileActivationCode();
        if (TextBox1.Text != ea) Label5.Text = "Invalid Code";
        else Label5.Text = "";
        if (TextBox2.Text != ma) Label6.Text = "Invalid Code";
        else Label6.Text = "";
        if (TextBox1.Text == ea && TextBox2.Text == ma)
        {
            bool r = d.Delete();
            Response.Redirect("SignUpStep3.aspx");
        }
     }
}
