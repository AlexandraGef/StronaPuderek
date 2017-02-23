using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_eyelinery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FillPage();
    }
    private void FillPage()
    {
        //get a list of all products in DB
        ProductModel productModel = new ProductModel();
        List<Produkty> products = productModel.GetProductsByType(1002);

        //make sure products exist in the database
        if (products != null)
        {
            //create a new panel with an imagebutton and 2 labels for each Product
            foreach (Produkty product in products)
            {
                Panel productPanel = new Panel();
                ImageButton imageButton = new ImageButton();
                Label lblName = new Label();
                Label lblPrice = new Label();

                //set childControls properties
                imageButton.ImageUrl = "~/Images/Products/" + product.Zdjecie;
                imageButton.CssClass = "productImage";
                imageButton.PostBackUrl = "~/Pages/Product.aspx?id=" + product.Id;

                lblName.Text = product.Nazwa;
                lblName.CssClass = "productName";

                lblPrice.Text = product.Cena + " zł";
                lblPrice.CssClass = "productPrice";

                //add child controls to Panel

                productPanel.Controls.Add(imageButton);
                productPanel.Controls.Add(new Literal { Text = "<br />" });
                productPanel.Controls.Add(lblName);
                productPanel.Controls.Add(new Literal { Text = "<br />" });
                productPanel.Controls.Add(lblPrice);

                //add dynamic panel to static parent panel

                pnlProducts.Controls.Add(productPanel);

            }
        }
        else
        {
            //no products found
            pnlProducts.Controls.Add(new Literal { Text = "Nie znaleziono produktu !" });
        }
    }
}