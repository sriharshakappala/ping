using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using SMSClientLib;
using System.Net;
using System.IO;
/// <summary>
/// Summary description for Message
/// </summary>
public class Message
{
    public static bool Send(string MobileNumber,string Message)
    {
        string connectionString = "http://s2.freesmsapi.com/messages/send?skey=acc5a8f25a9e2d7fab2d08d477463ee3&message="+Message+"&recipient="+MobileNumber;
        try
        {
            System.IO.Stream SourceStream = null;
            System.Net.HttpWebRequest myRequest = (HttpWebRequest)WebRequest.Create(connectionString);
            myRequest.Credentials = CredentialCache.DefaultCredentials;
            HttpWebResponse webResponse = (HttpWebResponse)myRequest.GetResponse();
            SourceStream = webResponse.GetResponseStream();
            StreamReader reader = new StreamReader(webResponse.GetResponseStream());
            string str = reader.ReadLine();
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }
}
