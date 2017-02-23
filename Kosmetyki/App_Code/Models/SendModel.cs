using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SendModel
/// </summary>
public class SendModel
{
	public string InsertSend(Wysylka wyslij)
	{
        try
        {
            KosmetykiDBEntities db = new KosmetykiDBEntities();
            db.Wysylkas.Add(wyslij);
            db.SaveChanges();
            return "Wysyłka numer" + wyslij.Id + "zostanie jak najszybciej zrealizowana";
        }
        catch(Exception e)
        {
            return "Error: " + e;
        }
	}
   

    
}
