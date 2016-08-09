using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electro.Admin
{
    public partial class kategoriler : System.Web.UI.Page
    {
        electronixEntities5 elec = new electronixEntities5();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack )
            {
                KategoriDoldur();
            }
        }

        private void KategoriDoldur()
        {
            var sonuc = (from k in elec.Kategoriler
                         select new {k.Id, k.Ad }).ToList();
            ddlKategoriler.DataTextField = "Ad";
            ddlKategoriler.DataValueField = "Id";
           
            ddlKategoriler.DataSource = sonuc;
            ddlKategoriler.DataBind();

        }

        protected void lbtnKaydet_Click(object sender, EventArgs e)
        {
            if (txtKategori.Text.Trim()!="")
            {
                Kategoriler yeni = new Kategoriler();
                yeni.Ad = txtKategori.Text;
                elec.Kategoriler.Add(yeni);
                try
                {
                  bool sonuc=  Convert.ToBoolean(elec.SaveChanges());
                    if (sonuc)
                    {
                        Response.Write("Kategori Eklendi.");
                        txtKategori.Text = string.Empty;
                        KategoriDoldur();
                    }
                    else
                    {
                        Response.Write("Kategori Eklenemedi.");
                    }
                }
                catch (SqlException ex)
                {

                    string hata = ex.Message;
                }
            }
            else
            {
                Response.Write("Kategori Giriniz.");
            }
        }

        protected void lbtnGuncelle_Click(object sender, EventArgs e)
        {
            if (lblKatId.Text.Trim()!="")
            {

           
            int seciliKat = Convert.ToInt32(lblKatId.Text);
            var Gnc = (from k in elec.Kategoriler
                         where k.Id == seciliKat
                         select k).FirstOrDefault();

            Gnc.Ad = txtKategori.Text.Trim();
            //elec.Kategoriler.Add(Gnc);
            try
            {
                bool sonuc=Convert.ToBoolean(elec.SaveChanges());
                if (sonuc)
                {
                    Response.Write("Kategori Güncellendi.");
                        KategoriDoldur();
                        txtKategori.Text = string.Empty;
                }
                else
                {
                    Response.Write("Kategori Güncellenemedi.");
                }
            }
            catch (SqlException ex)
            {

                    string hata = ex.Message;
            }
            }
            else
            {
                Response.Write("Kategori Seçiniz.");
            }
        }

        protected void ddlKategoriler_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblKatId.Text = (ddlKategoriler.SelectedValue).ToString();
            txtKategori.Text = (ddlKategoriler.SelectedItem).ToString();
        }

        protected void lbtnSil_Click(object sender, EventArgs e)
        {
            if (lblKatId.Text.Trim()!="")
            {

                int seciliKat = Convert.ToInt32(lblKatId.Text);
                var sil = (from k in elec.Kategoriler
                           where k.Id == seciliKat
                           select k).FirstOrDefault();
                elec.Kategoriler.Remove(sil);

                try
                {
                bool sonuc = Convert.ToBoolean(elec.SaveChanges());
                if (sonuc)
                {
                    Response.Write("Kategori Silindi.");
                    KategoriDoldur();
                    txtKategori.Text = string.Empty;
                }
                else
                {
                    Response.Write("Kategori Silinemedi.");
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
            else
            {
                Response.Write("Kategori Seçiniz.");
            }
}
    }
}