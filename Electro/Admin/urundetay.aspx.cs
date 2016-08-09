using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electro.Admin
{
    public partial class urundetay : System.Web.UI.Page
    {
        electronixEntities5 elec = new electronixEntities5();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            string urunId = Request.QueryString["urunId"];
            if (string.IsNullOrEmpty(urunId))
            {
                Response.Redirect("urunler.aspx");
            }
            int id = 0;
            bool rakamMi = int.TryParse(urunId, out id);

            if (!rakamMi || id == 0) Response.Redirect("urunler.aspx");

           
            Urunler seciliUrun =elec.Urunler.FirstOrDefault(urun=> urun.Id == id);
            KategoriDoldur();
            MarkaDoldur();
            ddlKategori.SelectedValue = seciliUrun.MarkaId.ToString();
            ddlMarka.SelectedValue = seciliUrun.KategoriId.ToString();
            txtDetay.Text = seciliUrun.Detay;
            txtFiyat.Text = seciliUrun.Fiyat.ToString();
            txtModel.Text = seciliUrun.Model;
            txtAdet.Text = seciliUrun.Adet.ToString();
            cbOzel.Checked = seciliUrun.Ozel;
            cbTavsiye.Checked = seciliUrun.Tavsiye;
            cbVitrin.Checked = seciliUrun.Vitrin;
            cbYeni.Checked = seciliUrun.Yeni;
            ImgResim.ImageUrl = string.Format("~/images/urunler/{0}",seciliUrun.Resim);
           

        }

        private void MarkaDoldur()
        {
            var sonuc = (from k in elec.Markalar
                         select new { k.Id, k.Ad }).ToList();
            ddlMarka.DataTextField = "Ad";
            ddlMarka.DataValueField = "Id";

            ddlMarka.DataSource = sonuc;
            ddlMarka.DataBind();
        }

        private void KategoriDoldur()
        {
            var sonuc = (from k in elec.Kategoriler
                         select new { k.Id, k.Ad }).ToList();

            ddlKategori.DataTextField = "Ad";
            ddlKategori.DataValueField = "Id";
            ddlKategori.DataSource = sonuc;
            ddlKategori.DataBind();
        }

        protected void lblGüncelle_Click(object sender, EventArgs e)
        {
            int urunId = Convert.ToInt32(Request.QueryString["urunId"]);
            var güncellenecekUrun = (from u in elec.Urunler
                                     where u.Id == urunId
                                     select u).FirstOrDefault();
            int MarkaID = Convert.ToInt32(ddlMarka.SelectedValue);
            int KategoriID = Convert.ToInt32(ddlKategori.SelectedValue);
           
            güncellenecekUrun.Detay = txtDetay.Text;
            güncellenecekUrun.Fiyat = Convert.ToDouble(txtFiyat.Text);
            güncellenecekUrun.KategoriId = KategoriID;
            güncellenecekUrun.MarkaId = MarkaID;
            güncellenecekUrun.Model = txtModel.Text;
            güncellenecekUrun.Adet = Convert.ToInt32(txtAdet.Text.Trim());
            güncellenecekUrun.Ozel = cbOzel.Checked;
            güncellenecekUrun.Tavsiye = cbOzel.Checked;
            güncellenecekUrun.Vitrin = cbVitrin.Checked;
            güncellenecekUrun.Yeni = cbYeni.Checked;
            if (fuResim.HasFile)
            {
                güncellenecekUrun.Resim = fuResim.FileName;
                string ResimYolu = string.Format("~/images/urunler/{0}",güncellenecekUrun.Resim);
                fuResim.SaveAs(Server.MapPath(ResimYolu));
            }
        
            elec.SaveChanges();
            string sayfayagonder = string.Format("urundetay.aspx?urunId={0}", güncellenecekUrun.Id);
            Response.Redirect(sayfayagonder);


        }

        protected void lblSil_Click(object sender, EventArgs e)
        {
            int urunId = Convert.ToInt32(Request.QueryString["urunId"]);
            var silinecekId = (from u in elec.Urunler
                               where u.Id == urunId
                               select u).FirstOrDefault();
            elec.Urunler.Remove(silinecekId);

            try
            {
                bool sonuc = Convert.ToBoolean(elec.SaveChanges());
                if (sonuc)
                {
                    //Response.Write("Urun Silindi.");
                    string sayfayagonder = string.Format("urunler.aspx?");
                    Response.Redirect(sayfayagonder);

                }
                else
                {
                    Response.Write("Urun Silinemedi.");
                }
            }
            catch (SqlException ex)
            {

                string hata = ex.Message;
            }
        }
    }
}