using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electro
{
    public partial class iletisim : System.Web.UI.Page
    {
        electronixEntities5 elec = new electronixEntities5();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {




            int kullaniciId = Convert.ToInt32(Session["kullanici"]);
            var kuEmail = (from k in elec.Kullanicilar
                           where k.id == kullaniciId
                           select k).FirstOrDefault();
            string kulMailAdres = kuEmail.Email;

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("vildan898991@gmail.com", "Wissen MS-Yaz_10", System.Text.Encoding.UTF8);
            if (Session["kullanici"] == null)
            {
                kulMailAdres = txtEmail.Text.Trim();
            }
            else
            {
                mail.To.Add(kulMailAdres);
            }

            mail.CC.Add("vildan898991@gmail.com");
            mail.Subject = "Electonic e-Ticaret Sitesi";
            mail.Body = "Sayın," + txtAdSoyad.Text + "," + "<br/>" + "En akın Zamanda İletişime Geçilecektir  ";//mesaj göderilen
            StringBuilder sbMesaj = new StringBuilder();
            sbMesaj.Append("---------------------------------------------");
            sbMesaj.Append("<a href=\"" + Request.Url.Host + "/Default.aspx\" >Alişverise devam için tıklayınız</a> ");
         
            mail.Body = sbMesaj.ToString();
            mail.IsBodyHtml = true;
            SmtpClient sc = new SmtpClient();
            sc.Host = "smtp.gmail.com";  // mail.domain.com
            sc.Port = 587;
            sc.EnableSsl = true; //ssl sertifikaları kullanıyorsa belirmek lazım
            sc.Credentials = new NetworkCredential("vildan898991@gmail.com", "vildan89vildan");//gondelirecek epoasta ve sifresi

            sc.Send(mail);


        }
    }
}