using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Pages_Wyszukiwarka : System.Web.UI.Page
{
    SqlConnection vid = new SqlConnection("Data Source=ALEKSANDRA\\SQLEXPRESS; Initial Catalog=KosmetykiDB; Integrated Security=True; MultipleActiveResultSets=True; Application Name=EntityFramework");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String str = " SELECT ID,Nazwa,Cena,Opis FROM produkty WHERE( nazwa like '%' + @search + '%')";
        SqlCommand xp = new SqlCommand(str, vid);
        xp.Parameters.Add("@search", SqlDbType.NVarChar).Value = TextBox1.Text;


        vid.Open();
        xp.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = xp;
        DataSet ds = new DataSet();
        da.Fill(ds, "Nazwa");
        GridView1.DataSource = ds;
        GridView1.DataBind();
        vid.Close();
    }
}