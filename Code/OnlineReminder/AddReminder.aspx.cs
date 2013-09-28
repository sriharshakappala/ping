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
using System.ServiceProcess;

public partial class AddReminder : System.Web.UI.Page
{
    User u;
    ServiceController sc = new ServiceController("ReminderService");

    protected void Page_Load(object sender, EventArgs e)
    {
        u = (User)Session["User"];
        if (u == null)
            Response.Redirect("Login.aspx");
        if (DropDownList7.Items.Count == 0)
        {
            Calendar1.SelectedDate = DateTime.Now;
            DropDownList1.Items.Add("Every Year");
            for (int i = 0; i < 100; i++)
            {
                string str = (DateTime.Now.Year + i) + "";
                DropDownList1.Items.Add(str);
                DropDownList9.Items.Add(str);
            }
            DropDownList1.SelectedIndex = 1;
            DropDownList9.SelectedIndex = 0;
            DropDownList2.SelectedIndex = DateTime.Now.Month;
            DropDownList8.SelectedIndex = DateTime.Now.Month - 1;

            DropDownList7.Items.Clear();
            DropDownList3.Items.Clear();
            DropDownList3.Items.Add("Every Day");
            int temp = DateTime.DaysInMonth(int.Parse(DropDownList9.Text), DropDownList8.SelectedIndex);
            for (int i = 1; i <= temp; i++)
            {
                DropDownList7.Items.Add(i + "");
                DropDownList3.Items.Add(i + "");
            }
            DropDownList7.SelectedIndex = DateTime.Now.Day - 1;
            DropDownList3.SelectedIndex = DateTime.Now.Day;
            DropDownList11.SelectedIndex = (int)DateTime.Now.DayOfWeek + 1;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            int mid = 1, msgid = 1;
            //System.Windows.Forms.MessageBox.Show("Before alert " + Request.Params.Get("alert"));
            if (Request.Params.Get("alert") != null)
            {
                //System.Windows.Forms.MessageBox.Show("In alert ");
                Mails m;
                Messages mg;
                Clock c;
                bool MailEnabled = (Request.Params.Get("mail") != null);
                bool MessageEnabled = Request.Params.Get("message") != null;
     
                if (MailEnabled || MessageEnabled)
                {

                    c = InitializeClock();
                    c.Save();
                    if (MailEnabled)
                    {
                        Label1.Text += "  Mail  ";
                        m = new Mails(-1, TextBox1.Text, TextBox2.Text, TextBox3.Text, c.getId());
                        m.save();
                        mid = m.getId();
                    }
                    if (MessageEnabled)
                    {
                        Label1.Text += "   Message";
                        mg = new Messages(-1, TextBox4.Text, TextBox6.Text, c.getId());
                        mg.save();
                        msgid = mg.getId();
                    }
                }
            }
           // System.Windows.Forms.MessageBox.Show("Before saving");
            Label1.Text += "       Remainder";
            Reminder r = new Reminder(u.getUserName(), Calendar1.SelectedDate.ToString("dd/MMM/yyyy"), DropDownList10.SelectedItem.Text, TextBox7.Text, mid, msgid);
           // System.Windows.Forms.MessageBox.Show("After saving");
            Label1.Text = r.getQuery();
            if (r.save())
            {
                /*Response.Write("<script language='javascript'>"+
                                    "alert('Reminder added successfully..');"+
                                    "window.open('./RemindersList.aspx');"+
                                    "alert('new Page');"+
                               "</script>");*/
                Response.Redirect("RemindersList.aspx");
            }
            else
                Response.Write("<script language='javascript'>alert('An error occured in saving your reminder , try again after few seconds');</script>");
        }
        catch (Exception ee) { Response.Write(ee.Message); }
    }

    private Clock InitializeClock()
    {
        Clock c = new Clock();

        if (DropDownList1.SelectedIndex == 0) c.setYear(-1);
        else c.setYear((DateTime.Now.Year + DropDownList1.SelectedIndex - 1));
        if (DropDownList2.SelectedIndex == 0) c.setMonth(-1);
        else c.setMonth(DropDownList2.SelectedIndex);

        if (RadioButton1.Checked)
        {
            if (DropDownList3.SelectedIndex == 0) c.setDay(-1);
            else c.setDay(DropDownList3.SelectedIndex);
        }
        else
        {
            if (DropDownList11.SelectedIndex == 0) c.setDay(-1);
            else c.setDay(39 + DropDownList11.SelectedIndex);
        }
        if (DropDownList4.SelectedIndex == 0) c.setHour(-1);
        else c.setHour(((DropDownList4.SelectedIndex) % 12 + DropDownList12.SelectedIndex * 12) % 24);
        if (DropDownList5.SelectedIndex == 0) c.setMinute(-1);
        else c.setMinute(DropDownList5.SelectedIndex - 1);
        if (DropDownList6.SelectedIndex == 0) c.setSecond(-1);
        else c.setSecond(DropDownList6.SelectedIndex - 1);

        return c;
    }
    protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!((object)DropDownList7).Equals(sender))
        {
            try
            {
                DropDownList7.Items.Clear();
                int temp = DateTime.DaysInMonth(int.Parse(DropDownList9.Text), DropDownList8.SelectedIndex);
                for (int i = 1; i <= temp; i++)
                    DropDownList7.Items.Add(i + "");
            }
            catch (Exception ee) { Response.Write(ee.StackTrace); }
        }
        try
        {
            Calendar1.VisibleDate = new DateTime(int.Parse(DropDownList9.Text), DropDownList8.SelectedIndex + 1, int.Parse(DropDownList7.Text));
            Label1.Text = "Calender changed";
        }
        catch (Exception ee) { Response.Write(ee.Message); }
    }
}
