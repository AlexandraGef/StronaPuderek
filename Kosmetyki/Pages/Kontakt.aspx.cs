using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
public partial class Pages_Kontakt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ScriptManager.ScriptResourceMapping.AddDefinition("jquery",
    new ScriptResourceDefinition
    {
        Path = "~/scripts/jquery-1.7.2.min.js",
        DebugPath = "~/scripts/jquery-1.7.2.min.js",
        CdnPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.1.min.js",
        CdnDebugPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.1.js"
    });
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        MailMessage mm = new MailMessage("firmakosmetyki@gmail.com", "firmakosmetyki@gmail.com");
        mm.Subject = txtSubject.Text;
        mm.Body = "Name: " + txtName.Text + "<br /><br />Email: " + txtEmail.Text + "<br />" + txtBody.Text;
        if (FileUpload1.HasFile)
        {
            string FileName = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
            mm.Attachments.Add(new Attachment(FileUpload1.PostedFile.InputStream, FileName));
        }
        mm.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.EnableSsl = true;
        System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
        NetworkCred.UserName = "firmakosmetyki@gmail.com";
        NetworkCred.Password = "firmakosmetyki123";
        smtp.UseDefaultCredentials = true;
        smtp.Credentials = NetworkCred;
        smtp.Port = 587;
        smtp.Send(mm);
        lblMessage.Text = "Twój e-mail został wysłany. Odpowiemy na niego jak najszybciej.";
    }
  
}