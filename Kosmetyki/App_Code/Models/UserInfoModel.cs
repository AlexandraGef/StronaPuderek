using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserInfoModel
/// </summary>
public class UserInfoModel
{
	public InformacjeOKlientach GetUserInformation(string guId)
    {
        KosmetykiDBEntities db = new KosmetykiDBEntities();
        InformacjeOKlientach info = (from x in db.InformacjeOKlientaches
                                     where x.GUID == guId
                                     select x).FirstOrDefault();

        return info;
    }
    public void InsertUserInformation(InformacjeOKlientach info)
    {
        KosmetykiDBEntities db = new KosmetykiDBEntities();
        db.InformacjeOKlientaches.Add(info);
        db.SaveChanges();
    }
}