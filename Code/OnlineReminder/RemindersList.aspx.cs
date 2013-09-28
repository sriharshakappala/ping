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

public partial class _Default : System.Web.UI.Page
{
    DropDownList dDL1, dDL11, dDL12, dDL2, dDL3, dDL4, dDL5, dDL6;
    RadioButton rB1, rB2;
    public int DEFAULT_MSGID = 1, DEFAULT_MLID = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        User u = (User)Session["User"];
        if (u != null)
        {
            HiddenField1.Value = u.getUserName();
        }
        else
            Response.Redirect("Login.aspx");
    }

    #region .......Storing Clock Controls which are created for editing.......

    protected void DropDownList1_Init(object sender, EventArgs e)
    {
        Session.Add("dDL1", sender);
    }
    protected void DropDownList2_Init(object sender, EventArgs e)
    {
        Session.Add("dDL2", sender);
    }
    protected void DropDownList3_Init(object sender, EventArgs e)
    {
        Session.Add("dDL3", sender);
    }
    protected void DropDownList11_Init(object sender, EventArgs e)
    {
        Session.Add("dDL11", sender);
    }
    protected void DropDownList4_Init(object sender, EventArgs e)
    {
        Session.Add("dDL4", sender);
    }
    protected void DropDownList5_Init(object sender, EventArgs e)
    {
        Session.Add("dDL5", sender);
    }
    protected void DropDownList6_Init(object sender, EventArgs e)
    {
        Session.Add("dDL6", sender);
    }
    protected void DropDownList12_Init(object sender, EventArgs e)
    {
        Session.Add("dDL12", sender);
    }
    protected void RadioButton1_Init(object sender, EventArgs e)
    {
        Session.Add("rB1", sender);
    }
    protected void RadioButton2_Init(object sender, EventArgs e)
    {
        Session.Add("rB2", sender);
    }

    #endregion

    #region  .......Initializing Clock for edit mode.......

    protected void Clock_IdLabel_DataBinding(object sender, EventArgs e)
    {
        int cid = (int)Session["CID"];
        Clock ck = Clock.getById(cid);
        Session.Add("c", (Clock.getById(cid)));
        // Response.Write("<script language='javascript'>alert('Cid added');</script>");
    }
    protected void DropDownList1_DataBinding(object sender, EventArgs e)
    {
        try
        {
            int SelectedYear = ((Clock)Session["c"]).getYear();
            int StartingYear = DateTime.Now.Year >= SelectedYear ? SelectedYear : DateTime.Now.Year;
            DropDownList dl1 = ((DropDownList)sender);
            DropDownList1.Value = dl1.ClientID;
            dl1.Items.Add("Every Year");
            for (int i = 0; i < 100; i++)
            {
                string str = (StartingYear + i) + "";
                dl1.Items.Add(str);
            }
            dl1.SelectedIndex = SelectedYear - StartingYear + 1;
        }
        catch (Exception ee) { }
    }
    protected void DropDownList2_DataBinding(object sender, EventArgs e)
    {
        try
        {
            DropDownList dl = ((DropDownList)sender);
            DropDownList2.Value = dl.ClientID;
            int Month = ((Clock)Session["c"]).getMonth();
            //System.Windows.Forms.MessageBox.Show(Month + "");
            dl.SelectedIndex = (Month == -1) ? 0 : Month;
        }
        catch (Exception ee) { }
    }
    protected void DropDownList3_DataBinding(object sender, EventArgs e)
    {
        try
        {
            DropDownList dl = ((DropDownList)sender);
            DropDownList3.Value = dl.ClientID;
            Clock c = (Clock)Session["c"];
            dl.Items.Clear();
            dl.Items.Add("Every Day");
            for (int i = 1; i <= DateTime.DaysInMonth(c.getYear(), c.getMonth()); i++)
                dl.Items.Add(i + "");
            if (c.getDay() <= 31)
            {
                dl.Enabled = true;
                dl.SelectedIndex = (c.getDay() == -1) ? 0 : c.getDay();
                Response.Write("<script language='javascript'> document.getElementById(\"" + dl.ClientID + "\").disabled=true</script>");
            }
            //System.Windows.Forms.MessageBox.Show("Day -- " + c.getDay());
        }
        catch (Exception ee) { }
    }
    protected void RadioButton1_DataBinding(object sender, EventArgs e)
    {
        try
        {
            RadioButton rb = ((RadioButton)sender);
            RadioButton1.Value = ((RadioButton)sender).ClientID;
            Session.Add("RB1", sender);
            Clock c = ((Clock)Session["c"]);
            rb.Checked = (c.getDay() <= 31);
            //System.Windows.Forms.MessageBox.Show(c.getDay() + "    " + rb.Text + "111");
        }
        catch (Exception ee) { }
    }
    protected void RadioButton2_DataBinding(object sender, EventArgs e)
    {
        try
        {
            RadioButton rb = ((RadioButton)sender);
            RadioButton2.Value = ((RadioButton)sender).ClientID;
            Session.Add("RB2", sender);
            Clock c = ((Clock)Session["c"]);
            rb.Checked = (c.getDay() >= 40);
            //System.Windows.Forms.MessageBox.Show(c.getDay() + "    " + rb.Text + "dhdt");
        }
        catch (Exception ee) { }
    }

    protected void DropDownList11_DataBinding(object sender, EventArgs e)
    {
        try
        {
            DropDownList dl = ((DropDownList)sender);
            DropDownList11.Value = dl.ClientID;
            Clock c = ((Clock)Session["c"]);
            if (c.getDay() >= 40)
            {
                dl.Enabled = true;
                dl.SelectedIndex = (c.getDay() == -1) ? 0 : c.getDay() - 39;
                Response.Write("<script language='javascript'> document.getElementById(\"" + dl.ClientID + "\").disabled=true</script>");
            }
        }
        catch (Exception ee) { }
    }

    protected void DropDownList4_DataBinding(object sender, EventArgs e)
    {
        try
        {
            DropDownList dl = ((DropDownList)sender);
            DropDownList4.Value = dl.ClientID;
            int Hour = ((Clock)Session["c"]).getHour();
            if (Hour == -1)
                dl.SelectedIndex = 0;
            else if (Hour == 0)
                dl.SelectedIndex = 12;
            else
                dl.SelectedIndex = 1 + (Hour - 1) % 12;
        }
        catch (Exception ee) { }

    }
    protected void DropDownList5_DataBinding(object sender, EventArgs e)
    {
        try
        {
            DropDownList dl = ((DropDownList)sender);
            DropDownList5.Value = dl.ClientID;
            int Minute = ((Clock)Session["c"]).getMinute();
            dl.SelectedIndex = (Minute == -1) ? 0 : Minute;
        }
        catch (Exception ee) { }
    }
    protected void DropDownList6_DataBinding(object sender, EventArgs e)
    {
        try
        {
            DropDownList dl = ((DropDownList)sender);
            DropDownList6.Value = dl.ClientID;
            int Second = ((Clock)Session["c"]).getSecond();
            dl.SelectedIndex = (Second == -1) ? 0 : Second;
        }
        catch (Exception ee) { }
    }
    protected void DropDownList12_DataBinding(object sender, EventArgs e)
    {
        try
        {
            DropDownList dl = ((DropDownList)sender);
            DropDownList12.Value = dl.ClientID;
            int Hour = ((Clock)Session["c"]).getHour();
            dl.SelectedIndex = Hour <= 12 ? 0 : 1;
        }
        catch (Exception ee) { }
    }
    
    #endregion

    #region .......Updating the Clock.......

    protected void LinkButton1_Click(object sender, EventArgs e)    // Update Link of Clock in Edit mode
    {
        setEditMode(false);
        Clock c;
        c = InitializeClock();
        c.Save();
        Reminder r = Reminder.getById(int.Parse(Session["RID"].ToString()));
 
        Mails.upDateClockId(r.getMailsId(), c.getId());
        Messages.upDateClockId(r.getMessageId(), c.getId());
    }
    private Clock InitializeClock()
    {
        CreateDropDowns();
        Clock c = new Clock();
        if (dDL1.SelectedIndex == 0) c.setYear(-1);
        else c.setYear((DateTime.Now.Year + dDL1.SelectedIndex - 1));
        if (dDL2.SelectedIndex == 0) c.setMonth(-1);
        else c.setMonth(dDL2.SelectedIndex);
        if (rB1.Checked)
        {
            if (dDL3.SelectedIndex == 0) c.setDay(-1);
            else c.setDay(dDL3.SelectedIndex);
        }
        else
        {
            if (dDL11.SelectedIndex == 0) c.setDay(-1);
            else c.setDay(39 + dDL11.SelectedIndex);
        }
        if (dDL4.SelectedIndex == 0) c.setHour(-1);
        else c.setHour(dDL4.SelectedIndex + dDL12.SelectedIndex * 12);
        if (dDL5.SelectedIndex == 0) c.setMinute(-1);
        else c.setMinute(dDL5.SelectedIndex - 1);
        if (dDL6.SelectedIndex == 0) c.setSecond(-1);
        else c.setSecond(dDL6.SelectedIndex - 1);
        return c;
    }
    private void CreateDropDowns()                                  // Fetching Dropdowns which are stored in session
    {

        dDL1 = (DropDownList)Session["dDL1"];
        dDL2 = (DropDownList)Session["dDL2"];
        dDL3 = (DropDownList)Session["dDL3"];
        dDL4 = (DropDownList)Session["dDL4"];
        dDL5 = (DropDownList)Session["dDL5"];
        dDL6 = (DropDownList)Session["dDL6"];
        dDL11 = (DropDownList)Session["dDL11"];
        dDL12 = (DropDownList)Session["dDL12"];
        rB1 = (RadioButton)Session["rB1"];
        rB2 = (RadioButton)Session["rB2"];
    }
    
    #endregion

    #region .......Handling Enable/Disable of Clock panel.......

    protected void Panel1_Init(object sender, EventArgs e)
    {
        Session.Add("panel", sender);
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        setEditMode(true);
    }
    private void setEditMode(bool value)
    {
        Panel p = ((Panel)Session["panel"]);
        p.Enabled = value;
        ((LinkButton)Session["update"]).Visible = value;
        ((LinkButton)Session["cancel"]).Visible = value;
        ((LinkButton)Session["edit"]).Visible = !value;
    }
    protected void LinkButton1_Init(object sender, EventArgs e)
    {
        Session.Add("update", sender);
    }
    protected void LinkButton2_Init(object sender, EventArgs e)
    {
        Session.Add("cancel", sender);
    }
    protected void LinkButton3_Init(object sender, EventArgs e)
    {
        Session.Add("edit", sender);
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        setEditMode(false);
    }

    #endregion

    #region .......Handling Deletion of Reminder.......

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Reminder r = Reminder.getById(int.Parse(Session["RID"].ToString()));
        try
        {
            if(r.getMailsId()!=DEFAULT_MLID)
                Mails.getById(r.getMailsId()).delete();
            if(r.getMessageId()!=DEFAULT_MSGID)
                Messages.getById(r.getMessageId()).delete();
        }
        catch (Exception ee) { }
    }
    protected void LinkButton1_Click1(object sender, EventArgs e)   //Delete Button
    {
       LinkButton l = (LinkButton)sender;
       Session.Add("RID",l.CommandArgument);        // Command argument contains ReminderId
    }

    #endregion

    //Storing ReminderId,MessagesId,MailsId,ClockId
    protected void LinkButton2_Click1(object sender, EventArgs e)   // Edit Button
    {
        LinkButton l = (LinkButton)sender;
        Reminder r = Reminder.getById(int.Parse(l.CommandArgument));
        Mails m = Mails.getById(r.getMailsId());
        
        Session.Add("RID",r.getId());
        Session.Add("MSGID",r.getMessageId());
        Session.Add("MLID",r.getMailsId());
        Session.Add("CID", m.getClockId());
        
    }

    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        
    }
    protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        int MailId = (int)Session["MLID"];
        
        if(MailId == DEFAULT_MLID)   // 114  -->  Default MailId
        {
            // Creating New Mail
            Mails Default = Mails.getById(MailId);
            Mails NewMail = new Mails(-1,Default.getToAddress(),Default.getSubject(),Default.getBody(),Default.getClockId());

            //Clearing Default Mail
            Default.setToAddress("");
            Default.setSubject("");
            Default.setBody("");
            Default.update();

            NewMail.save();
            Session.Add("MLID", NewMail.getId());

            //System.Windows.Forms.MessageBox.Show(NewMail.getId() + "");
            //Updating MailId of Reminder
            Reminder r = Reminder.getById(((int)Session["RID"]));
            r.setMailsId(NewMail.getId());

            r.update();
            //System.Windows.Forms.MessageBox.Show("Reminder Updated");
            TextBox t = (TextBox)Session["MLTB"];
            t.Text = NewMail.getId() + "";
        }
    }
   
    protected void FormView2_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        int MsgId = (int)Session["MSGID"];

        if (MsgId == DEFAULT_MSGID)   // 114  -->  Default MessageId
        {
            // Creating New Message
            Messages Default = Messages.getById(MsgId);
            Messages NewMessage = new Messages(-1, Default.getDestNumber(), Default.getMessage(), Default.getClockId());

            //Clearing Default Message
            Default.setDestNumber("");
            Default.setMessage("");
            Default.update();

            NewMessage.save();
            Session.Add("MSGID", NewMessage.getId());

            //System.Windows.Forms.MessageBox.Show(NewMessage.getId() + "");
            //Updating MessagesId of Reminder
            Reminder r = Reminder.getById(((int)Session["RID"]));
            r.setMessageId(NewMessage.getId());
            r.update();
            //System.Windows.Forms.MessageBox.Show("Reminder Updated");
        }
    }

    protected void TextBox4_DataBinding(object sender, EventArgs e)
    {
        //System.Windows.Forms.MessageBox.Show(((TextBox)sender).Text+"----->Binding");
        Session.Add("MLTB", sender);
    }
}