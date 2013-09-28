using System;
using System.Data.OleDb;
/// <summary>
/// Summary description for Mails
/// </summary>
public class Mails
{
    int Id;
    String ToAddress;
    String Subject;
    String Body;
    int ClockId;

    public Mails(int Id, String ToAddress, String Subject, String Body, int ClockId)
    {
        this.Id = Id;
        this.ToAddress = ToAddress;
        this.Subject = Subject;
        this.Body = Body;
        this.ClockId = ClockId;
    }

    public String getBody()
    {
        return Body;
    }

    public void setBody(String Body)
    {
        this.Body = Body;
    }

    public int getClockId()
    {
        return ClockId;
    }

    public void setClockId(int ClockId)
    {
        this.ClockId = ClockId;
    }

    public int getId()
    {
        return Id;
    }

    public void setId(int Id)
    {
        this.Id = Id;
    }

    public String getSubject()
    {
        return Subject;
    }

    public void setSubject(String Subject)
    {
        this.Subject = Subject;
    }

    public String getToAddress()
    {
        return ToAddress;
    }

    public void setToAddress(String ToAddress)
    {
        this.ToAddress = ToAddress;
    }

    public bool save()
    {
        string cmdTxt="INSERT INTO Mails VALUES('"+ToAddress+"','"+Subject+"','"+Body+"',"+ClockId+")";
        if (DataBase.putData(cmdTxt)>=1)
        {
            string query = "SELECT Id FROM Mails WHERE To_Address='" + ToAddress + "' AND Subject='" + Subject + "' AND Body='" + Body + "' AND Clock_Id=" + ClockId;
            OleDbDataReader dr = DataBase.getData(query);
            if (dr.Read())
            {
                Id = int.Parse(dr[0].ToString());
                dr.Close();
                return true;
            }
            return true;
        }
        return false;
    }

    public bool delete()
    {
        string cmd = "DELETE FROM Mails WHERE id=" + Id;
        return DataBase.delete(cmd) == 1;
    }

    public static Mails getById(int Id)
     {
        string query = "SELECT * FROM Mails WHERE id=" + Id;
        OleDbDataReader odr = DataBase.getData(query);

        if (odr.Read())
            return new Mails(int.Parse(odr[0].ToString()), odr[1].ToString(), odr[2].ToString(), odr[3].ToString(), int.Parse(odr[4].ToString()));
       
        return null;
    }

    public Mails[] getByClockId(int ClockId)
    {
        string temp = "SELECT count(*) FROM Mails WHERE clock_id=" + ClockId;
        OleDbDataReader t = DataBase.getData(temp);
        int Count = 0;
        if (t.Read())
            Count = int.Parse(t[0].ToString());
        Mails[] m = new Mails[Count];
        string query = "SELECT * FROM Mails WHERE clock_id=" + ClockId;
        OleDbDataReader odr = DataBase.getData(query);

        for (int i = 0; odr.Read(); i++)
            m[i] = new Mails(int.Parse(odr[0].ToString()), odr[1].ToString(), odr[2].ToString(), odr[3].ToString(),int.Parse(odr[4].ToString()));
        return m;
    }
    public static bool upDateClockId(int id,int ClockId)
    {
        return DataBase.putData("UPDATE Mails set Clock_ID=" + ClockId + " WHERE id=" + id) >= 1;
    }
    public bool update()
    {
        string cmd =    " UPDATE Mails" +
                        " SET   To_Address='" + ToAddress +"'"+
                        "       ,Subject='" + Subject +"'"+
                        "       ,Body='" + Body +"'"+
                        "       ,Clock_Id=" + ClockId +
                        " WHERE Id=" + Id;
        return DataBase.putData(cmd) == 1 ;
    }
}

