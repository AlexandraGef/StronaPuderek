using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ProductModel
/// </summary>
public class ProductModel
{
	public string InsertProduct(Produkty product)
    {
try
{
    KosmetykiDBEntities db = new KosmetykiDBEntities();
    db.Produkties.Add(product);
    db.SaveChanges();
    return product.Nazwa + " produkt został dodany";
}
        catch(Exception e)
{
    return "Error: " + e;
}
    }
    public string UpdateProduct(int id, Produkty product)
    {
        try
        {
            KosmetykiDBEntities db = new KosmetykiDBEntities();
           //Fetch object from db
            Produkty p = db.Produkties.Find(id);
            p.Nazwa = product.Nazwa;
            p.Cena = product.Cena;
            p.TypeId = product.TypeId;
            p.Opis = product.Opis;
            p.Zdjecie = product.Zdjecie;

            db.SaveChanges();
            return product.Nazwa + " produkt został zaktualizowany";
        }
        catch (Exception e)
        {
            return "Error: " + e;
        }
    }
    public string DeleteProduct(int id)
    {
        try
        {
            KosmetykiDBEntities db = new KosmetykiDBEntities();
            Produkty product = db.Produkties.Find(id);
            db.Produkties.Attach(product);
            db.Produkties.Remove(product);
            db.SaveChanges();
            return product.Nazwa + " produkt został usunięty";
        }
        catch (Exception e)
        {
            return "Error: " + e;
        }
    }

public Produkty GetProduct(int id)
    {
        try
        {
            using (KosmetykiDBEntities db = new KosmetykiDBEntities())
            {
                Produkty product = db.Produkties.Find(id);
                return product;
            }
        }
    catch(Exception)
        {
            return null;
        }
    }
public List<Produkty> GetAllProducts()
{
    try
    {
        using(KosmetykiDBEntities db = new KosmetykiDBEntities())
        {
            List<Produkty> products = (from x in db.Produkties select x).ToList();
            return products;

        }
    }
    catch (Exception)
    {
        return null;
    }
}
    public List<Produkty> GetProductsByType(int typeId)
{
    try
    {
        using (KosmetykiDBEntities db = new KosmetykiDBEntities())
        {
            List<Produkty> products = (from x in db.Produkties 
                                       where x.TypeId == typeId 
                                       select x).ToList();
            return products;

        }
    }
    catch (Exception)
    {
        return null;
    }
}


}