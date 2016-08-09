using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electro.Admin
{
    public partial class UrunEkle : System.Web.UI.Page
    {
        electronixEntities5 elec = new electronixEntities5();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                KategorileriDoldur();
                MarkalarıDoldur();


            }
        }

        private void MarkalarıDoldur()
        {
            var sonuc = (from k in elec.Markalar
                         select new { k.Id, k.Ad }).ToList();
            ddlMarka.DataTextField = "Ad";
            ddlMarka.DataValueField = "Id";

            ddlMarka.DataSource = sonuc;
            ddlMarka.DataBind();
        }

        private void KategorileriDoldur()
        {
            var sonuc = (from k in elec.Kategoriler
                         select new { k.Id, k.Ad }).ToList();
            ddlKategori.DataTextField = "Ad";
            ddlKategori.DataValueField = "Id";

            ddlKategori.DataSource = sonuc;
            ddlKategori.DataBind();
        }

        protected void ddlMarka_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        protected void lbKaydet_Click1(object sender, EventArgs e)
        {
            int MarkaID = Convert.ToInt32(ddlMarka.SelectedValue);
            int KategoriID = Convert.ToInt32(ddlKategori.SelectedValue);
            Urunler ekle = new Urunler();
            ekle.Detay = txtDetay.Text;
            ekle.Fiyat = Convert.ToDouble(txtFiyat.Text);
            ekle.KategoriId = KategoriID;
            ekle.MarkaId = MarkaID;
            ekle.Adet = Convert.ToInt32(txtAdet.Text.Trim());
            ekle.Model = txtModel.Text;
            ekle.Ozel = cbOzel.Checked;
            ekle.Tavsiye = cbOzel.Checked;
            ekle.Vitrin = cbVitrin.Checked;
            ekle.Yeni = cbYeni.Checked;
            if (fuResim.HasFile)
            {
                ekle.Resim = fuResim.FileName;
                string ResimYolu = string.Format("~/images/urunler/{0}", ekle.Resim);
                fuResim.SaveAs(Server.MapPath(ResimYolu));
            }
            elec.Urunler.Add(ekle);
            elec.SaveChanges();
            string mesaj = string.Format("<a style=\"display:none;\" id=\"fakeId\" href=\"javascript:showDialog('Success','{0} {1} eklendi !','success',2);\">Merhaba</a><script>document.getElementById('fakeId').click();</script>", ddlMarka.SelectedItem.Text, txtModel.Text);


            ClientScript.RegisterClientScriptBlock(this.GetType(), "hede", mesaj, false);

        }
    }
}