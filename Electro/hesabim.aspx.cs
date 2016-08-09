using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electro
{
    public partial class hesabim : System.Web.UI.Page
    {
        electronixEntities5 elec = new electronixEntities5();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["kullanici"] != null)
                {
                    Panel2.Visible = true;
                    Panel1.Visible = false;
                    MusteriBilgileriniDoldur();
                   
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }

            }
        }

        private void MusteriBilgileriniDoldur()
        { int KID=Convert.ToInt32(Session["kullanici"]);
            var kul = (from k in elec.Kullanicilar
                     where k.id == KID
                     select k).FirstOrDefault();
            txtAd.Text = kul.Ad;
            txtSoyad.Text = kul.Soyad;
            txtAdres.Text = kul.Adres;
            txtTcNo.Text = kul.TcNo.ToString();
            txtEmail.Text = kul.Email;
            txtTelefon.Text = kul.Telefon.ToString();
            

        }

        private void gvSepetimDoldur()
        {
            int KID = Convert.ToInt32(Session["kullanici"]);
            var gv = (from g in elec.SepeteEklenen join s in elec.Satislar on g.SatisNo equals s.SatisNo into gs from yeni in gs.DefaultIfEmpty()
                      where g.Satildi == true && yeni.KullaniciNo == KID

                      select new { g.id, g.UrunId, g.Detay, yeni.SiparisTarih, yeni.TeslimTarihi, g.Adet, g.Fiyat, g.Tutar }).ToList();


           


            gvSepetim.DataSource = gv;
            gvSepetim.DataBind();
        }

      

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Panel2.Visible = true;
            Panel1.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
            gvSepetimDoldur();
        }

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            int kId = Convert.ToInt32(Session["kullanici"]);
            var kulId = (from k in elec.Kullanicilar
                         where k.id == kId
                         select k).FirstOrDefault();
            kulId.Ad = txtAd.Text.Trim();
            kulId.Soyad = txtSoyad.Text.Trim();
            kulId.TcNo = Convert.ToInt32(txtTcNo.Text.Trim());
            kulId.Telefon = Convert.ToInt32(txtTelefon.Text.Trim());
            kulId.Email = txtEmail.Text.Trim();
            kulId.Adres = txtAdres.Text.Trim();
           
            if (txtYeniSifre.Text.Trim()!="" && txtSifreTekrar.Text.Trim()!="")
            {
                kulId.Sifre = txtSifreTekrar.Text.Trim();
               
            }
            bool sonuc = Convert.ToBoolean(elec.SaveChanges());
            if (sonuc)
            {
                lblMesaj.Text = "Bilgileriniz Güncellendi.";
            }
            else
            {
                lblMesaj.Text = "Bilgileriniz Güncellenemedi !";

            }

        }
    }
}