﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Management_Management : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void grdProduct_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //get selected row
        GridViewRow row = grdProducts.Rows[e.NewEditIndex];

        //get id of selected product
        int rowId = Convert.ToInt32(row.Cells[1].Text);

        //redirect user to ManageProduct along with the selected rowId
        Response.Redirect("~/Pages/Management/ManageProducts.aspx?id=" + rowId);


    }
 
}