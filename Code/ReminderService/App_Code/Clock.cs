using System.Data.OleDb;
/// <summary>
/// Summary description for Clock
/// </summary>
public class Clock
{
    int Id;
    int Day;
    int Month;
    int Year;
    int Second;
    int Minute;
    int Hour;
    string Status;

    public Clock(int Id, int Day, int Month, int Year, int Second, int Minute, int Hour)
    { 
        this.Id=Id;
        this.Day=Day;
        this.Month=Month;
        this.Year=Year;
        this.Second=Second;
        this.Minute=Minute;
        this.Hour = Hour;
    }

    public Clock()
    { 
    
    }

    public int getId()
    {
        return Id;
    }

    public int getDay()
    {
        return Day;
    }

    public int getMonth()
    {
        return Month;
    }

    public int getYear()
    {
        return Year;
    }

    public int getSecond()
    {
        return Second;
    }

    public int getMinute()
    {
        return Minute;
    }

    public int getHour()
    {
        return Hour;
    }

    public string getStatus()
    {
        return Status;
    }

    public void setId(int Id)
    {
        this.Id = Id;
    }

    public void setDay(int Day)
    {
        this.Day = Day;
    }

    public void setMonth(int Month)
    {
        this.Month = Month;
    }
    
    public void setYear(int Year)
    {
        this.Year = Year;
    }

    public void setSecond(int Second)
    {
        this.Second = Second;
    }

    public void setMinute(int Minute)
    {
        this.Minute = Minute;
    }

    public void setHour(int Hour)
    {
        this.Hour = Hour;
    }

    public void setStatus(string Status)
    {
        this.Status = Status;
    }

    public bool Save()
    {
        string q = "SELECT Id FROM Clock WHERE Day='" + Day + "' AND Month='" + Month + "' AND Year='" + Year + "' AND Second='" + Second + "' AND Minute='" + Minute + "' AND Hour='" + Hour + "'";
        OleDbDataReader dr1 = DataBase.getData(q);
        if (dr1.Read())
        {
            Id = int.Parse(dr1[0].ToString());
            return true;
        }
        string cmdTxt="INSERT INTO Clock VALUES("+Day+","+Month+","+Year+","+Second+","+Minute+","+Hour+",'')";
        if (DataBase.putData(cmdTxt)>=1)
        {
            OleDbDataReader dr = DataBase.getData(q);
            if (dr.Read())
            {
                Id = int.Parse(dr[0].ToString());
                return true;
            }
            return true;
        }
        return false;
    }

    public static bool UpdateStatus(int Id, string Status)
    {
        return DataBase.putData("UPDATE Clock set Status='" + Status + "' WHERE id=" + Id) >= 1;
    }
}
