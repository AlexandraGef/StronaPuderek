using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CartModel
/// </summary>
public class CartModel
{
    public string InsertKoszyk(Koszyk cart)
    {
        try
        {
            KosmetykiDBEntities db = new KosmetykiDBEntities();
            db.Koszyks.Add(cart);
            db.SaveChanges();
            return cart.DataZakupu + " produkt został dodany do koszyka";
        }
        catch (Exception e)
        {
            return "Error: " + e;
        }
    }
    public string UpdateKoszyk(int id, Koszyk cart)
    {
        try
        {
            KosmetykiDBEntities db = new KosmetykiDBEntities();
            //Fetch object from db
            Koszyk p = db.Koszyks.Find(id);
            p.DataZakupu = cart.DataZakupu;
            p.Ilosc = cart.Ilosc;
            p.KlientID = cart.KlientID;
            p.JestwKoszyku = cart.JestwKoszyku;
            p.ProduktID= cart.ProduktID;

            db.SaveChanges();
            return cart.DataZakupu + " produkt został dodany do koszyka";
        }
        catch (Exception e)
        {
            return "Error: " + e;
        }
    }
    public string DeleteKoszyk(int id)
    {
        try
        {
            KosmetykiDBEntities db = new KosmetykiDBEntities();
            Koszyk cart = db.Koszyks.Find(id);
            db.Koszyks.Attach(cart);
            db.Koszyks.Remove(cart);
            db.SaveChanges();
            return cart.DataZakupu + " produkt został usunięty z koszyka";
        }
        catch (Exception e)
        {
            return "Error: " + e;
        }
    }

    public List<Koszyk> GetOrdersInCart(string userId)
    {
        KosmetykiDBEntities db = new KosmetykiDBEntities();
        List<Koszyk> orders = (from x in db.Koszyks
                               where x.KlientID == userId
                               && x.JestwKoszyku
                               orderby x.DataZakupu
                               select x).ToList();

        return orders;
    }
    public int GetAmountOfOrders (string userId)
    {
        try
        {
            KosmetykiDBEntities db = new KosmetykiDBEntities();
            int amount = (from x in db.Koszyks
                          where x.KlientID == userId
                          && x.JestwKoszyku
                          select x.Ilosc).Sum();

            return amount;
        }
        catch
        {
            return 0;
        }
    }
    public void UpdateQuantity(int id, int quantity)
    {
        KosmetykiDBEntities db = new KosmetykiDBEntities();
        Koszyk cart = db.Koszyks.Find(id);
        cart.Ilosc = quantity;
        db.SaveChanges();

    }
    public void MarkOrdersAsPaid(List<Koszyk> carts)
    {
        KosmetykiDBEntities db = new KosmetykiDBEntities();

        if(carts != null)
        {
            foreach(Koszyk cart in carts)
            {
                Koszyk oldCart = db.Koszyks.Find(cart.ID);
                oldCart.DataZakupu = DateTime.Now;
                oldCart.JestwKoszyku = false;
            }
            db.SaveChanges();

        }
    }
}