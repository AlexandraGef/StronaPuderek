using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Management_ManageProducts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetImages();
            // check if the url contains and id parametr
            if (!String.IsNullOrWhiteSpace(Request.QueryString["id"]))
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                FillPage(id);

            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        ProductModel productModel = new ProductModel();
        Produkty product = CreateProduct();

        //check if the url contains an id parameter
        if(!String.IsNullOrWhiteSpace(Request.QueryString["id"]))
        {
            //ID exists --> update existing row
            int id = Convert.ToInt32(Request.QueryString["id"]);
            lblResult.Text = productModel.UpdateProduct(id, product);
             
        }
        else
        {
            //id doesn't not exist -> create a new row
            lblResult.Text = productModel.InsertProduct(product);
        }
     
    }
    private void FillPage(int id)
    {
        //get selected product from DB
        ProductModel productModel = new ProductModel();
        Produkty product = productModel.GetProduct(id);

        //fill textboxes
        txtDescription.Text = product.Opis;
        txtName.Text = product.Nazwa;
        txtPrice.Text = product.Cena.ToString();

        //set dropdownlist values
        ddImage.SelectedValue = product.Zdjecie;
        ddType.SelectedValue = product.TypeId.ToString();


    }

   
    private void GetImages()
    {
        try
        {
            //get all filepaths
            string[] images = Directory.GetFiles(Server.MapPath("~/Images/Products/"));

            //get all filenames and add them to an arraylist
            ArrayList imageList = new ArrayList();
            foreach (string image in images)
            {
                string imageName = image.Substring(image.LastIndexOf(@"\", StringComparison.Ordinal) + 1);
                imageList.Add(imageName);
            }
            //set the arraylist as the dropdownview's datasource and refresh
            ddImage.DataSource = imageList;
            ddImage.AppendDataBoundItems = true;
            ddImage.DataBind();
        }
        catch (Exception e)
        {
            lblResult.Text = e.ToString();
        }
        }
    private Produkty CreateProduct()
    {
        Produkty product = new Produkty();
        product.Nazwa = txtName.Text;
        product.Cena = Convert.ToDouble(txtPrice.Text);
        product.TypeId = Convert.ToInt32(ddType.SelectedValue);
        product.Opis = txtDescription.Text;
        product.Zdjecie = ddImage.SelectedValue;

        return product;

    }
  
}


