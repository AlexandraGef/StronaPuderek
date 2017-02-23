using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;


public partial class Pages_ShoppingCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //get id of current logged in user and display items in Cart
        string userId = User.Identity.GetUserId();
        GetPurchasesInCart(userId);
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

private void CreateShopTable(List<Koszyk> purchaseList,out double subTotal)
{
    subTotal = new Double();
    ProductModel model = new ProductModel();


    foreach(Koszyk cart in purchaseList)
    {
        Produkty product = model.GetProduct(cart.ProduktID);

        //create the image button
        ImageButton btnImage = new ImageButton
        {
            ImageUrl = string.Format("~/Images/Products/{0}", product.Zdjecie),
            PostBackUrl = string.Format("~/Pages/Product.aspx?id={0}", product.Id)

        };

        //create the delete link
        LinkButton lnkDelete = new LinkButton
        {
            PostBackUrl = string.Format("~/Pages/ShoppingCart.aspx?productId={0}", cart.ID),
            Text = "Usuń produkt",
            ID = "del" + cart.ID
        };

        //add an OnClick event
        lnkDelete.Click += Delete_Item;

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
        TableCell a1 = new TableCell { RowSpan = 2, Width = 50
        };
        TableCell a2 = new TableCell
        {
            Text = string.Format("<h4>{0}</h4><br/>{1}<br/>W zbiorze", product.Nazwa, "Produkt nr. " + product.Id),
            HorizontalAlign = HorizontalAlign.Left,
            Width = 350
        };
        TableCell a3 = new TableCell { Text = "Cena za sztukę"};
        TableCell a4 = new TableCell { Text = "Ilość<hr/>"}; 
        TableCell a5 = new TableCell { Text = "Cena wszystkich produktów<hr/>"};
        TableCell a6 = new TableCell { };
    

        //create 6cells for row b
        TableCell b1 = new TableCell { };
        TableCell b2 = new TableCell { Text = product.Cena + " zł"};
        TableCell b3 = new TableCell { };
        TableCell b4 = new TableCell { Text = (cart.Ilosc * (Convert.ToInt32(product.Cena))) + " zł" };
        TableCell b5 = new TableCell { };
        TableCell b6 = new TableCell { };

        //set 'special' controls
        a1.Controls.Add(btnImage);
        a6.Controls.Add(lnkDelete);
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
        subTotal += (cart.Ilosc*(Convert.ToInt32(product.Cena)));
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

private void Delete_Item(object sender, EventArgs e)
{
    LinkButton selectedLink = (LinkButton)sender;
    string link = selectedLink.ID.Replace("del", "");
    int cartId = Convert.ToInt32(link);

    CartModel model = new CartModel();
    model.DeleteKoszyk(cartId);

    Response.Redirect("~/Pages/ShoppingCart.aspx");
}

}
   
