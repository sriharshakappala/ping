using System.Data;
using System.Data.OleDb;
/// <summary>
/// Summary description for DataBase
/// </summary>
public static class DataBase
{
    public static OleDbDataReader getData(string query)
    {
        OleDbConnection cn = new OleDbConnection("Data Source=RAJ;Initial Catalog=reminder;User ID=sa;Password=rajeev;Provider=SQLOLEDB;");
        cn.Open();
        if (cn.State == ConnectionState.Open)
        {
            OleDbCommand cmd = new OleDbCommand(query, cn);
            OleDbDataReader odr = cmd.ExecuteReader();
            return odr;
        }
        return null;
    }
    public static int putData(string cmdText)
    {
        OleDbConnection cn = new OleDbConnection("Data Source=RAJ;Initial Catalog=reminder;User ID=sa;Password=rajeev;Provider=SQLOLEDB");
        cn.Open();
        if (cn.State == ConnectionState.Open)
        {
            OleDbCommand cmd = new OleDbCommand(cmdText, cn);
            int r = cmd.ExecuteNonQuery();
            cn.Close();
            return r;
        }
        return -1;
    }
    public static int delete(string CmdText)
    {
        return putData(CmdText);
    }
}
