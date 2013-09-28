using System;
using System.Net.Mail;
/// <summary>
/// Summary description for Mail
/// </summary>
public static class WebMail
{
    public static bool Send(MailMessage mm)
    {
        try
        {
            SmtpClient sc = new SmtpClient("smtp.gmail.com", 587);
            sc.Send(mm);
            return true;
        }
        catch (Exception ee) { return false; }
    }
    public static bool Send(string from,string to,string subject,string body)
    {
        MailMessage mm = new MailMessage();
        try
        {
            mm.From = new MailAddress("ping@theping.in", "PING");
            mm.To.Add(to);
            mm.Subject = subject;
            mm.Body = body;
            SmtpClient sc = new SmtpClient("smtp.gmail.com", 587);
            sc.UseDefaultCredentials = false;
            sc.EnableSsl = true;
            sc.Credentials = new System.Net.NetworkCredential("ping@theping.in", "harshasatishrajeev");
            sc.Send(mm);
            return true;
        }
        catch (Exception ee) { return false; }
    }
}
