using System.Data.OleDb;
/// <summary>
/// Summary description for Dummy
/// </summary>
public class Dummy
{
    string UserName;
    string EmailActivationCode;
    string MobileActivationCode;

    public Dummy(string UserName, string EmailActivationCode, string MobileActivationCode)
    {
        this.UserName = UserName;
        this.EmailActivationCode = EmailActivationCode;
        this.MobileActivationCode = MobileActivationCode;
    }

    public string getUserName()
    {
        return UserName;
    }

    public string getEmailActivationCode()
    {
        return EmailActivationCode;
    }

    public string getMobileActivationCode()
    {
        return MobileActivationCode;
    }

    public bool Save()
    {
        string CmdText = "INSERT INTO Dummy VALUES('" + UserName + "','" + EmailActivationCode + "','" + MobileActivationCode + "')";
        return DataBase.putData(CmdText)>=1;
    }

    public bool Delete()
    {
        string CmdText = "DELETE FROM Dummy WHERE User_Name='" + UserName + "'";
        return DataBase.delete(CmdText) >= 1;
    }

    public static Dummy getById(string UserName)
    {
        string query = "SELECT * FROM Dummy WHERE User_Name='" + UserName + "'";
        OleDbDataReader odr = DataBase.getData(query);
        if (odr.Read())
            return new Dummy(odr[0].ToString(), odr[1].ToString(), odr[2].ToString());
        return null;
    }
}
