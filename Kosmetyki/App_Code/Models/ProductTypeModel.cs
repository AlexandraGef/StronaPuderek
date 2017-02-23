using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TypyProduktowTypeModel
/// </summary>
public class TypyProduktowTypeModel
{
    public string InsertTypyProduktow(TypyProduktow productType)
    {
        try
        {
            KosmetykiDBEntities db = new KosmetykiDBEntities();
            db.TypyProduktows.Add(productType);
            db.SaveChanges();
            return productType.Name + " typ produktów został dodany";
        }
        catch (Exception e)
        {
            return "Error: " + e;
        }
    }
    public string UpdateTypyProduktow(int id, TypyProduktow productType)
    {
        try
        {
            KosmetykiDBEntities db = new KosmetykiDBEntities();
            //Fetch object from db
            TypyProduktow p = db.TypyProduktows.Find(id);
            p.Name = productType.Name;
 

            db.SaveChanges();
            return productType.Name + " typ produktu został zaktualizowany";
        }
        catch (Exception e)
        {
            return "Error: " + e;
        }
    }
    public string DeleteTypyProduktow(int id)
    {
        try
        {
            KosmetykiDBEntities db = new KosmetykiDBEntities();
            TypyProduktow productType = db.TypyProduktows.Find(id);
            db.TypyProduktows.Attach(productType);
            db.TypyProduktows.Remove(productType);
            db.SaveChanges();
            return productType.Name + " typ produktu został usunięty";
        }
        catch (Exception e)
        {
            return "Error: " + e;
        }
    }
}