using System;


public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    Random r = new Random();
    protected void Button1_Click(object sender, EventArgs e)
    { 
        if (new User().getById(TextBox2.Text) == null)
        {
            if (new User().getByEmailId(TextBox5.Text) != null)
                Label11.Text = "This E-Mail id is already used by some other person";
            else
            {
                User u = new User(TextBox1.Text, TextBox2.Text, TextBox4.Text, TextBox5.Text, TextBox6.Text, DropDownList1.SelectedItem.Text, TextBox7.Text);
                u.save();
                Dummy d = new Dummy(TextBox2.Text, r.Next(10000, int.MaxValue) + "", r.Next(10000, int.MaxValue) + "");
                d.Save();
                if (WebMail.Send("nakka.rajeev@gmail.com", TextBox5.Text, "Activation", "Activation Code:" + d.getEmailActivationCode()))
                    ;  //     Label10.Text = "Mail sent Successfully";
                if (Message.Send(TextBox6.Text, "Activation code:" + d.getMobileActivationCode()))
                    ;
                Response.Redirect("./SignUpStep2.aspx?UserName=" + TextBox2.Text + "&Email=" + TextBox5.Text + "&MobileNumber=" + TextBox6.Text);
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (new User().getById(TextBox2.Text) == null)
        {
            Label10.ForeColor = System.Drawing.Color.Green;
            Label10.Text = "User name is available";
        }
        else
        {
            Label10.ForeColor = System.Drawing.Color.Red;
            Label10.Text = "User name is not available";
        }
    }
}
