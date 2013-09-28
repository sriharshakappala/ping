using System;

/// <summary>
/// Summary description for Reminder
/// </summary>
public class Reminder
{
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
        return DataBase.putData(InsertStmt)>=1;
    }

    public string getQuery()
    {
        return "INSERT INTO Remainder VALUES('','" + UserName + "','" + EventDate + "','" + EventType + "','" + EventNote + "'," + MailsId + "," + MessageId + ")";
    }
}
