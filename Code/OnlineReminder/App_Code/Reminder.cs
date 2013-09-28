using System;
using System.Data.OleDb;
/// <summary>
/// Summary description for Reminder
/// </summary>
public class Reminder
{
    int Id;
    String UserName;
    String EventDate;
    String EventType;
    String EventNote;
    int MailsId;
    int MessageId;

    public Reminder(String UserName, String EventDate, String EventType, String EventNote, int MailsId, int MessageId)
    {
        this.UserName = UserName;
        this.EventDate = EventDate;
        this.EventType = EventType;
        this.EventNote = EventNote;
        this.MailsId = MailsId;
        this.MessageId = MessageId;
    }

    public int getId()
    {
        return Id;
    }

    public void setId(int Id)
    {
        this.Id = Id;
    }

    public String getEventDate()
    {
        return EventDate;
    }

    public void setEventDate(String EventDate)
    {
        this.EventDate = EventDate;
    }

    public String getEventNote()
    {
        return EventNote;
    }

    public void setEventNote(String EventNote)
    {
        this.EventNote = EventNote;
    }

    public String getEventType()
    {
        return EventType;
    }

    public void setEventType(String EventType)
    {
        this.EventType = EventType;
    }

    public int getMailsId()
    {
        return MailsId;
    }

    public void setMailsId(int MailsId)
    {
        this.MailsId = MailsId;
    }

    public int getMessageId()
    {
        return MessageId;
    }

    public void setMessageId(int MessageId)
    {
        this.MessageId = MessageId;
    }

    public String getUserName()
    {
        return UserName;
    }

    public void setUserName(String UserName)
    {
        this.UserName = UserName;
    }

    public bool save()
    {
        string InsertStmt = "INSERT INTO Remainder VALUES('" + UserName + "','" + EventDate + "','" + EventType + "','" + EventNote + "'," + MailsId + "," + MessageId + ")";
        if(DataBase.putData(InsertStmt)>=1)
        {
            string query = "SELECT * FROM Remainder WHERE User_Name='"+UserName+"' AND Event_Date='"+EventDate+"' AND Event_Type='"+EventType+"' AND Event_Note='"+EventNote+"' AND Mails_Id="+MailsId+" AND Messages_Id="+MessageId;
            OleDbDataReader odr = DataBase.getData(query);
            if (odr.Read())
                Id = int.Parse(odr[0].ToString());
            return true;
        }
        return false;
    }

    public static Reminder getById(int Id)
    {
        string query = "SELECT * FROM Remainder WHERE Id=" + Id;
        OleDbDataReader odr = DataBase.getData(query);
        if(odr.Read())
        {
            Reminder r = new Reminder(odr[1].ToString(), odr[2].ToString(), odr[3].ToString(), odr[4].ToString(), int.Parse(odr[5].ToString()), int.Parse(odr[6].ToString()));
            r.Id = Id;
            return r;
        }
        return null;
    } 

    public string getQuery()
    {
        return "INSERT INTO Remainder VALUES('','" + UserName + "','" + EventDate + "','" + EventType + "','" + EventNote + "'," + MailsId + "," + MessageId + ")";
    }

    public bool update()
    { 
        string cmd =    " UPDATE  Remainder"+
                        " SET   User_Name='"+UserName+"'"+
                        "       ,Event_Type='"+EventType+"'"+
                        "       ,Event_Note='"+EventNote+"'"+
                        "       ,Mails_Id="+MailsId+
                        "       ,Messages_Id="+MessageId+
                        " WHERE Id="+Id;
        return DataBase.putData(cmd) == 1;
    }
}