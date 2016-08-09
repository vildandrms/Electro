using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electro
{
    public partial class Login : System.Web.UI.Page
    {
        electronixEntities5 elec = new electronixEntities5();
        protected void Page_Load(object sender, EventArgs e)
        {
            Label lblgiris = (Label)this.Master.FindControl("lblGiris");
            if (!IsPostBack)
            {
                if (Session["kullanici"] !=null)
                {

                    lblgiris.Text = "Çıkış";

                }
                else if (Session["kullanici"] !=null && lblgiris.Text=="Çıkış")
                {
                    lblgiris.Text = "Giriş";
                    Session.Remove("kullanici");
                    Response.Redirect("Default.aspx");

                }

            }

        }

       

     
        protected void BtnUyeOL_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
        }

        protected void btnUyeKayit_Click(object sender, EventArgs e)
        {
            Kullanicilar yeni = new Kullanicilar();
            yeni.Ad = txtAd.Text.Trim();
            yeni.Soyad = txtSoyad.Text.Trim();
            yeni.Adres = txtAdres.Text.Trim();
            yeni.Email = txtEmail.Text.Trim();
            yeni.Sifre = txtSifre.Text.Trim();
            yeni.Telefon = Convert.ToInt32(txtTelefon.Text.Trim());
            yeni.TcNo = Convert.ToInt32(txtTcNo.Text.Trim());
            elec.Kullanicilar.Add(yeni);
            try
            {
                bool sonuc = Convert.ToBoolean(elec.SaveChanges());
                if (sonuc)
                {
                    Session["kullanici"] = yeni.id;
                    Response.Redirect("Default.aspx");
                    
                }
                else
                {
                    lblMesaj.Text = "Kayıt Başarısız.";
                }
            }
            catch (SqlException ex)
            {

                string hata = ex.Message;
            }

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string mail = Login1.UserName;
            string sifre = Login1.Password;
            var kulKontrol = (from k in elec.Kullanicilar
                              where k.Email == mail && k.Sifre == sifre
                              select k).FirstOrDefault();
            if (kulKontrol != null)
            {
                Session["kullanici"] = kulKontrol.id;
                Response.Redirect("Default.aspx");
            }
        }
    }
}