using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            SetImageUrl();
        }
    }
    protected void Unnamed1_Tick(object sender, EventArgs e)
    {
        SetImageUrl();
    }

    private void SetImageUrl()
    {
        Random rand = new Random();
        int i = rand.Next(1, 9);
        Image1.ImageUrl = "~/Images/" + i.ToString() + ".jpg";
    }

  
}
