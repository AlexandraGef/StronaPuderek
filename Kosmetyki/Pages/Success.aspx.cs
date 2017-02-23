using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class Pages_Success : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
      
        PanelBank.Visible = false;
        btnZatwierdz.Visible = false;

        string userId = User.Identity.GetUserId();
        GetPurchasesInCart(userId);
   
    }

  
    protected void banki(object sender, EventArgs e)
    {
        if (droplistbank.SelectedValue == "Platnosc przy odbiorze" || droplistbank.SelectedValue== "wybierz")
        {
            PanelBank.Visible = false;
            btnZatwierdz.Visible = true;
        }
        else
        {
            PanelBank.Visible = true;
            btnZatwierdz.Visible = false;
        }
    }
    private void GetPurchasesInCart(string userId)
    {
        CartModel model = new CartModel();
        double subTotal = 0;
        //generate HTML for each element in purchaseList
        List<Koszyk> purchaseList = model.GetOrdersInCart(userId);
        CreateShopTable(purchaseList, out subTotal);

        //Add totals to webpage
        double vat = subTotal * 0.21;
        double totalAmount = subTotal + vat + 10;

        //display values on page
        litTotal.Text = subTotal + " zł";
        litVat.Text = vat + " zł";
        litTotalAmount.Text = totalAmount + " zł";
       

    }

    private void CreateShopTable(List<Koszyk> purchaseList, out double subTotal)
    {
        subTotal = new Double();
        ProductModel model = new ProductModel();


        foreach (Koszyk cart in purchaseList)
        {
            Produkty product = model.GetProduct(cart.ProduktID);

            //create the image button
            ImageButton btnImage = new ImageButton
            {
                ImageUrl = string.Format("~/Images/Products/{0}", product.Zdjecie),
                PostBackUrl = string.Format("~/Pages/Product.aspx?id={0}", product.Id)

            };

            Literal1.Text = Convert.ToString(product.Id);

            //create the 'quantity' dropdownlist
            //generate list with numbers from 1 to 20
            int[] amount = Enumerable.Range(1, 20).ToArray();
            DropDownList ddlAmount = new DropDownList
            {
                DataSource = amount,
                AppendDataBoundItems = true,
                AutoPostBack = true,
                ID = cart.ID.ToString()

            };
            ddlAmount.DataBind();
            ddlAmount.SelectedValue = cart.Ilosc.ToString();
            ddlAmount.SelectedIndexChanged += ddlAmount_SelectedIndexChanged;

            //create HTML table with 2 rows
            Table table = new Table { CssClass = "cartTable" };
            TableRow a = new TableRow();
            TableRow b = new TableRow();

            //create 6 cells for row a
            TableCell a1 = new TableCell
            {
                RowSpan = 2,
                Width = 50
            };
            TableCell a2 = new TableCell
            {
                Text = string.Format("<h4>{0}</h4><br/>{1}<br/>W zbiorze", product.Nazwa, "Produkt nr. " + product.Id),
                HorizontalAlign = HorizontalAlign.Left,
                Width = 350
            };
            TableCell a3 = new TableCell { Text = "Cena za sztukę" };
            TableCell a4 = new TableCell { Text = "Ilość<hr/>" };
            TableCell a5 = new TableCell { Text = "Cena wszystkich produktów<hr/>" };
            TableCell a6 = new TableCell { };


            //create 6cells for row b
            TableCell b1 = new TableCell { };
            TableCell b2 = new TableCell { Text = product.Cena + " zł" };
            TableCell b3 = new TableCell { };
            TableCell b4 = new TableCell { Text = (cart.Ilosc * (Convert.ToInt32(product.Cena))) + " zł" };
            TableCell b5 = new TableCell { };
            TableCell b6 = new TableCell { };

            //set 'special' controls
            a1.Controls.Add(btnImage);
            b3.Controls.Add(ddlAmount);

            //add cells to rows
            a.Cells.Add(a1);
            a.Cells.Add(a2);
            a.Cells.Add(a3);
            a.Cells.Add(a4);
            a.Cells.Add(a5);
            a.Cells.Add(a6);

            b.Cells.Add(b1);
            b.Cells.Add(b2);
            b.Cells.Add(b3);
            b.Cells.Add(b4);
            b.Cells.Add(b5);
            b.Cells.Add(b6);

            //add rows to table
            table.Rows.Add(a);
            table.Rows.Add(b);

            //add table to pnlShoppingCart
            pnlShoppingCart.Controls.Add(table);

            //add total amount of item in cart to subtotal
            subTotal += (cart.Ilosc * (Convert.ToInt32(product.Cena)));
        }
        //add current user's shopping cart to user specific session value
        Session[User.Identity.GetUserId()] = purchaseList;

    }
    private void ddlAmount_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList selectedList = (DropDownList)sender;
        int quantity = Convert.ToInt32(selectedList.SelectedValue);
        int cartId = Convert.ToInt32(selectedList.ID);

        CartModel model = new CartModel();
        model.UpdateQuantity(cartId, quantity);

        Response.Redirect("~/Pages/ShoppingCart.aspx");
    }


    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Wysylka wy = CreateSend();
        SendModel model1 = new SendModel();
        lblResult.Text = model1.InsertSend(wy);
        List<Koszyk> carts = (List<Koszyk>)Session[User.Identity.GetUserId()];
        CartModel model = new CartModel();
        model.MarkOrdersAsPaid(carts);
        Session[User.Identity.GetUserId()] = null;
        Response.Redirect("http://www.eurobank.pl/");
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Wysylka wy = CreateSend();
        SendModel model1 = new SendModel();
        lblResult.Text = model1.InsertSend(wy);
        List<Koszyk> carts = (List<Koszyk>)Session[User.Identity.GetUserId()];
        CartModel model = new CartModel();
        model.MarkOrdersAsPaid(carts);
        Session[User.Identity.GetUserId()] = null;
        Response.Redirect("http://www.bgzbnpparibas.pl/");
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Wysylka wy = CreateSend();
        SendModel model1 = new SendModel();
        lblResult.Text = model1.InsertSend(wy);
        List<Koszyk> carts = (List<Koszyk>)Session[User.Identity.GetUserId()];
        CartModel model = new CartModel();
        model.MarkOrdersAsPaid(carts);
        Session[User.Identity.GetUserId()] = null;
        Response.Redirect("http://www.bph.pl/pl/klienci_indywidualni");
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        Wysylka wy = CreateSend();
        SendModel model1 = new SendModel();
        lblResult.Text = model1.InsertSend(wy);
        List<Koszyk> carts = (List<Koszyk>)Session[User.Identity.GetUserId()];
        CartModel model = new CartModel();
        model.MarkOrdersAsPaid(carts);
        Session[User.Identity.GetUserId()] = null;
        Response.Redirect("https://www.bzwbk.pl/");
    }
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        Wysylka wy = CreateSend();
        SendModel model1 = new SendModel();
        lblResult.Text = model1.InsertSend(wy);
        List<Koszyk> carts = (List<Koszyk>)Session[User.Identity.GetUserId()];
        CartModel model = new CartModel();
        model.MarkOrdersAsPaid(carts);
        Session[User.Identity.GetUserId()] = null;
        Response.Redirect("http://www.pkobp.pl/");
    }
    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
    {
        Wysylka wy = CreateSend();
        SendModel model1 = new SendModel();
        lblResult.Text = model1.InsertSend(wy);
        List<Koszyk> carts = (List<Koszyk>)Session[User.Identity.GetUserId()];
        CartModel model = new CartModel();
        model.MarkOrdersAsPaid(carts);
        Session[User.Identity.GetUserId()] = null;
        Response.Redirect("http://raiffeisenpolbank.com/");
    }
    protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
    {
        Wysylka wy = CreateSend();
        SendModel model1 = new SendModel();
        lblResult.Text = model1.InsertSend(wy);
        List<Koszyk> carts = (List<Koszyk>)Session[User.Identity.GetUserId()];
        CartModel model = new CartModel();
        model.MarkOrdersAsPaid(carts);
        Session[User.Identity.GetUserId()] = null;
        Response.Redirect("https://www.mbank.pl/indywidualny/");
    }
    protected void ImageButton8_Click(object sender, ImageClickEventArgs e)
    {
        Wysylka wy = CreateSend();
        SendModel model1 = new SendModel();
        lblResult.Text = model1.InsertSend(wy);
        List<Koszyk> carts = (List<Koszyk>)Session[User.Identity.GetUserId()];
        CartModel model = new CartModel();
        model.MarkOrdersAsPaid(carts);
        Session[User.Identity.GetUserId()] = null;
        Response.Redirect("http://www.nordea.pl/");
    }
    protected void ImageButton9_Click(object sender, ImageClickEventArgs e)
    {
        Wysylka wy = CreateSend();
        SendModel model1 = new SendModel();
        lblResult.Text = model1.InsertSend(wy);
        List<Koszyk> carts = (List<Koszyk>)Session[User.Identity.GetUserId()];
        CartModel model = new CartModel();
        model.MarkOrdersAsPaid(carts);
        Session[User.Identity.GetUserId()] = null;
        Response.Redirect("https://www.pocztowy.pl/indywidualni/");
    }
    protected void ImageButton10_Click(object sender, ImageClickEventArgs e)
    {
        Wysylka wy = CreateSend();
        SendModel model1 = new SendModel();
        lblResult.Text = model1.InsertSend(wy);
        List<Koszyk> carts = (List<Koszyk>)Session[User.Identity.GetUserId()];
        CartModel model = new CartModel();
        model.MarkOrdersAsPaid(carts);
        Session[User.Identity.GetUserId()] = null;
        Response.Redirect("http://www.pekao.com.pl/");
    }
    protected void ImageButton11_Click(object sender, ImageClickEventArgs e)
    {
        Wysylka wy = CreateSend();
        SendModel model1 = new SendModel();
        lblResult.Text = model1.InsertSend(wy);
        List<Koszyk> carts = (List<Koszyk>)Session[User.Identity.GetUserId()];
        CartModel model = new CartModel();
        model.MarkOrdersAsPaid(carts);
        Session[User.Identity.GetUserId()] = null;
        Response.Redirect("https://www.getinbank.pl/");
    }
    protected void ImageButton12_Click(object sender, ImageClickEventArgs e)
    {
        Wysylka wy = CreateSend();
        SendModel model1 = new SendModel();
        lblResult.Text = model1.InsertSend(wy);
        List<Koszyk> carts = (List<Koszyk>)Session[User.Identity.GetUserId()];
        CartModel model = new CartModel();
        model.MarkOrdersAsPaid(carts);
        Session[User.Identity.GetUserId()] = null;
        Response.Redirect("https://www.bankmillennium.pl/");
    }
    protected void ImageButton13_Click(object sender, ImageClickEventArgs e)
    {
        Wysylka wy = CreateSend();
        SendModel model1 = new SendModel();
        lblResult.Text = model1.InsertSend(wy);
        List<Koszyk> carts = (List<Koszyk>)Session[User.Identity.GetUserId()];
        CartModel model = new CartModel();
        model.MarkOrdersAsPaid(carts);
        Session[User.Identity.GetUserId()] = null;
        Response.Redirect("https://www.mbank.pl/indywidualny/");
    }
    protected void ImageButton14_Click(object sender, ImageClickEventArgs e)
    {
        Wysylka wy = CreateSend();
        SendModel model1 = new SendModel();
        lblResult.Text = model1.InsertSend(wy);
        List<Koszyk> carts = (List<Koszyk>)Session[User.Identity.GetUserId()];
        CartModel model = new CartModel();
        Koszyk id = new Koszyk();
        Literal1.Text = Convert.ToString(id.ID);
        model.MarkOrdersAsPaid(carts);
        Session[User.Identity.GetUserId()] = null;
        Response.Redirect("https://www.aliorbank.pl/");
    }

    protected void btnZatwierdz_Click(object sender, EventArgs e)
    {
        
        Wysylka wy = CreateSend();
        SendModel model1 = new SendModel();
        lblResult.Text = model1.InsertSend(wy);
         List<Koszyk> carts = (List<Koszyk>)Session[User.Identity.GetUserId()];
        CartModel model = new CartModel();
        model.MarkOrdersAsPaid(carts);
        Session[User.Identity.GetUserId()] = null;
        Response.Redirect("~/Pages/Zakonczenie.aspx");
    }

    protected Wysylka CreateSend()
    {
       
            Wysylka wy = new Wysylka();
            wy.IdProdukt = Convert.ToInt16(Literal1.Text);
            wy.KlientId = User.Identity.GetUserId();
            wy.JakPlaci = droplistbank.SelectedValue;
            wy.JakWyslac = DropDownList1.SelectedValue;
            wy.Wiadomosc = TextBox6.Text;

            return wy;
        }
    }
    
    

   
