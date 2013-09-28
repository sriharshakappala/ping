using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Xml.Linq;

/// <summary>
/// Summary description for ReminderDetails
/// </summary>
public class ReminderDetails
{
    string Id,ReminderType,ReminderNote;
    DateTime ReminderDate;
    int Day, Month, Year, Second, Minute, Hour;
    
    public ReminderDetails()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}
