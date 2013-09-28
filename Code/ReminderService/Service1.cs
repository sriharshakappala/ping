using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Data.OleDb;
using System.Threading;
using System.Windows.Forms;

namespace ReminderService
{
    public partial class Service1 : ServiceBase
    {
        DataSet ds;
        int y, m, d, h, mi, s, id;
        string status;

        public Service1()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            //MessageBox.Show("Service Starting........");
            while (true)
            {
                try
                {
                    ds = DataBase.getDataSet("SELECT * FROM Clock");
                    timer1.Enabled = true;
                    if (System.IO.Directory.Exists(@"D:\ReLoadDataBase"))
                        System.IO.Directory.Delete(@"D:\ReLoadDataBase");
                    break;
                }
                catch (Exception e) { }
            }
        }

        protected override void OnStop()
        {
            //MessageBox.Show("Service Stopping......");
        }

        private void timer1_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
        {
            //MessageBox.Show("Timer");
            ThreadStart ts = new ThreadStart(check);
            new Thread(ts).Start();
        }

        private void check()
        {
            //MessageBox.Show("Check");
            try
            {
                DataTableReader odr = ds.CreateDataReader();
                DateTime dt = DateTime.Now;
                int year = dt.Year;
                int month = dt.Month;
                int dayOfMonth = dt.Day;
                int dayOfWeek = (int)dt.DayOfWeek;
                int hour = dt.Hour;
                int minute = dt.Minute;
                int second = dt.Second;
                while (odr.Read())
                {
                    try
                    {
                        y = int.Parse(odr["year"].ToString());
                        m = int.Parse(odr["month"].ToString());
                        d = int.Parse(odr["day"].ToString());
                        h = int.Parse(odr["hour"].ToString());
                        mi = int.Parse(odr["minute"].ToString());
                        s = int.Parse(odr["second"].ToString());
                        id = int.Parse(odr["id"].ToString());
                        status = odr["status"].ToString();
                       
                        if ((y == year || y == -1) && (m == month || m == -1) && (d == dayOfMonth || d == -1 || (d - 40) == dayOfWeek) && (h == hour || h == -1) && (mi == minute || mi == -1) && (s == second || s == -1))
                        {
                            //MessageBox.Show("OK");
                            Messages[] msgs = Messages.getByClockId(id);
                            Mails[] mls = Mails.getByClockId(id);
                            for (int i = 0; i < mls.Length; i++)
                            {
                                Thread t = new Thread(new ParameterizedThreadStart(SendMail));
                                t.Start(mls[i]);
                            }
                            for (int i = 0; i < msgs.Length; i++)
                            {
                                Thread t = new Thread(SendMessage);
                                t.Start(msgs[i]);
                            }
                            Clock.UpdateStatus(id, dt.ToString());
                            ds = DataBase.getDataSet("SELECT * FROM Clock");
                        }
                    }
                    catch (Exception ee) { MessageBox.Show(ee.StackTrace); }
                }
                odr.Close();
            }
            catch (Exception ee) { MessageBox.Show(ee.StackTrace); }
        }

        public void SendMail(object o)
        {
            //MessageBox.Show("Mail");
            Mails m = (Mails)o;
            WebMail.Send("ping.reminder@gmail.com", m.getToAddress(), m.getSubject(), m.getBody());
        }

        public void SendMessage(object o)
        {
            //MessageBox.Show("Message");
            Messages m = (Messages)o;
            Message.Send(m.getDestNumber(), m.getMessage());
        }

        private void fileSystemWatcher1_Created(object sender, System.IO.FileSystemEventArgs e)
        {
            if (e.Name == "ReLoadDataBase")
            {
                ds = DataBase.getDataSet("SELECT * FROM Clock");
                System.IO.Directory.Delete(@"D:\ReLoadDataBase");
            }
        }
    }
}
