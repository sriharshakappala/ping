using System;
using System.Data.OleDb;
/// <summary>
/// Summary description for User
/// </summary>
public class User
{
    String UserName;
    String Password;
    String Name;
    String RecoveryEmail;
    String RecoveryMobile;
    String SecurityQuestion;
    String Answer;

    public User(String Name, String UserName, String Password, String RecoveryEmail, String RecoveryMobile, String SecurityQuestion, String Answer)
    {
        this.UserName = UserName;
        this.Password = Password;
        this.Name = Name;
        this.RecoveryEmail = RecoveryEmail;
        this.RecoveryMobile = RecoveryMobile;
        this.SecurityQuestion = SecurityQuestion;
        this.Answer = Answer;
    }

    public User()
    { 
    }
    public String getAnswer()
    {
        return Answer;
    }

    public void setAnswer(String Answer)
    {
        this.Answer = Answer;
    }

    public String getName()
    {
        return Name;
    }

    public void setName(String Name)
    {
        this.Name = Name;
    }

    public String getPassword()
    {
        return Password;
    }

    public void setPassword(String Password)
    {
        this.Password = Password;
    }

    public String getRecoveryEmail()
    {
        return RecoveryEmail;
    }

    public void setRecoveryEmail(String RecoveryEmail)
    {
        this.RecoveryEmail = RecoveryEmail;
    }

    public String getRecoveryMobile()
    {
        return RecoveryMobile;
    }

    public void setRecoveryMobile(String RecoveryMobile)
    {
        this.RecoveryMobile = RecoveryMobile;
    }

    public String getSecurityQuestion()
    {
        return SecurityQuestion;
    }

    public void setSecurityQuestion(String SecurityQuestion)
    {
        this.SecurityQuestion = SecurityQuestion;
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
        string InsertStmt = "INSERT INTO Users VALUES('" + Name + "','" + UserName + "','" + Password + "','" + RecoveryEmail + "','" + RecoveryMobile + "','" + SecurityQuestion + "','" + Answer + "')";
        return DataBase.putData(InsertStmt)>=1;
    }

    public User getById(String UserName)
    {
        string query = "SELECT * FROM Users WHERE User_Name='" + UserName + "'";
        //System.Windows.Forms.MessageBox.Show(query);
        OleDbDataReader odr=DataBase.getData(query);
        if (odr.Read())
            return new User(odr[0].ToString(), odr[1].ToString(), odr[2].ToString(), odr[3].ToString(), odr[4].ToString(), odr[5].ToString(), odr[6].ToString());
        return null;
    }
    public User getByEmailId(String EmailId)
    {
        string query = "SELECT * FROM Users WHERE Recovery_Email='" + EmailId + "'";
        OleDbDataReader odr = DataBase.getData(query);
        if (odr.Read())
            return new User(odr[0].ToString(), odr[1].ToString(), odr[2].ToString(), odr[3].ToString(), odr[4].ToString(), odr[5].ToString(), odr[6].ToString());
        return null;
    }
    public string getQuery()
    {
        return "INSERT INTO Users VALUES('" + Name + "','" + UserName + "','" + Password + "','" + RecoveryEmail + "','" + RecoveryMobile + "','" + SecurityQuestion + "','" + Answer + "')";
    }
}
