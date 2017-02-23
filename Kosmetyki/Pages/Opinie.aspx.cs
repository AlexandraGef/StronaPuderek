using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class Pages_Opinie : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            bindrepeater();

        }
        ScriptManager.ScriptResourceMapping.AddDefinition("jquery",
    new ScriptResourceDefinition
    {
        Path = "~/scripts/jquery-1.7.2.min.js",
        DebugPath = "~/scripts/jquery-1.7.2.min.js",
        CdnPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.1.min.js",
        CdnDebugPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.1.js"
    });
    }

    private void bindrepeater()
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["KosmetykiDBConnectionString"].ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText="opi";
        cmd.Connection=con;
        cmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        Repeater1.DataSource=ds;
        Repeater1.DataBind();

    }
    protected void opiniabtn_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["KosmetykiDBConnectionString"].ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText="insert into [Opinie] (Imie,Email,Opinia)values(@im,@em,@op)";
        cmd.Connection=con;
        cmd.Parameters.AddWithValue("@im",imietxt.Text);
        cmd.Parameters.AddWithValue("@em",emailtxt.Text);
        cmd.Parameters.AddWithValue("@op",opiniatxt.Text);
        cmd.ExecuteNonQuery();
        Repeater1.DataBind();

    }
  
}