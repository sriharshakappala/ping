using System;
using System.Data.OleDb;

/// <summary>
/// Summary description for Messages
/// </summary>
public class Messages {
    int Id;
    String DestNumber;
    String Message;
    int ClockId;

    public Messages(int Id, String DestNumber, String Message, int ClockId) {
        this.Id = Id;
        this.DestNumber = DestNumber;
        this.Message = Message;
        this.ClockId = ClockId;
    }

    public int getClockId() {
        return ClockId;
    }

    public void setClockId(int ClockId) {
        this.ClockId = ClockId;
    }

    public String getDestNumber() {
        return DestNumber;
    }

    public void setDestNumber(String DestNumber) {
        this.DestNumber = DestNumber;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getMessage() {
        return Message;
    }

    public void setMessage(String Message) {
        this.Message = Message;
    }

    public bool save()
    {
        string cmdTxt = "INSERT INTO Messages VALUES('" + DestNumber + "','" + Message + "'," + ClockId + ")";
        if (DataBase.putData(cmdTxt)>=1)
        {
            string query = "SELECT Id FROM Messages WHERE Dest_Number='" + DestNumber + "' AND Message='" + Message + "' AND Clock_Id=" + ClockId;
            OleDbDataReader dr = DataBase.getData(query);
            if (dr.Read())
            {
                Id = int.Parse(dr[0].ToString());
                return true;
            }
            return true;
        }
        return false;
    }

    public bool delete()
    {
        string cmd = "DELETE FROM Messages WHERE id=" + Id;
        return DataBase.delete(cmd) == 1;
    }

    public static Messages getById(int Id)
    {
        string query = "SELECT * FROM Messages WHERE id="+Id;
        OleDbDataReader odr = DataBase.getData(query);

        if(odr.Read())
            return new Messages(int.Parse(odr[0].ToString()), odr[1].ToString(), odr[2].ToString(), int.Parse(odr[3].ToString()));

        return null;
    }

    public Messages[] getByClockId(int ClockId)
    {
        string temp = "SELECT count(*) FROM Messages WHERE clock_id=" + ClockId;
        OleDbDataReader t = DataBase.getData(temp);
        int Count = 0;
        if (t.Read())
            Count = int.Parse(t[0].ToString());
        Messages[] m = new Messages[Count];
        string query = "SELECT * FROM Messages WHERE clock_id=" + ClockId ;
        OleDbDataReader odr = DataBase.getData(query);

        for (int i = 0; odr.Read(); i++)
            m[i] = new Messages(int.Parse(odr[0].ToString()), odr[1].ToString(), odr[2].ToString(), int.Parse(odr[3].ToString()));
        return m;
    }

    public static bool upDateClockId(int id, int ClockId)
    {
        return DataBase.putData("UPDATE Messages set Clock_ID=" + ClockId + " WHERE id=" + id) >= 1;
    }

    public bool update()
    {
        string cmd =    "UPDATE Messages "+
                        "SET    Dest_Number='"+DestNumber+"'"+
                        "       ,Message='"+Message+"'"+
                        "       ,Clock_Id="+ClockId+
                        "WHERE  Id="+Id;
        return DataBase.putData(cmd) == 1;
    }
}