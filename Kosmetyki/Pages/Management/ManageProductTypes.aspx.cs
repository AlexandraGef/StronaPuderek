using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Management_ManageProductTypes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        TypyProduktowTypeModel model = new TypyProduktowTypeModel();
        TypyProduktow pt = CreateProductTypes();
        lblResult.Text = model.InsertTypyProduktow(pt);
    }
    private TypyProduktow CreateProductTypes()
{
    TypyProduktow p = new TypyProduktow();
    p.Name = txtName.Text;
    return p;
  
     
}
}