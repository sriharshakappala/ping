using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class Main : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddReminder.aspx");
    }
    protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
    {
        if (e.Item.Text == "Reminders")
            Response.Redirect("./RemindersList.aspx");
        else if (e.Item.Text == "Compose Mail")
            Response.Redirect("./SendMail.aspx");
        else if (e.Item.Text == "Compose Message")
            Response.Redirect("./SendMessage.aspx");
    }
}
