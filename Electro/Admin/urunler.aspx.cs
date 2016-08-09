using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electro.Admin
{
    public partial class urunler : System.Web.UI.Page
    {
        electronixEntities5 elec = new electronixEntities5();
        int marId;
        int katId;
        protected void Page_Load(object sender, EventArgs e)
        { 

            if (IsPostBack) return;
     

            TumUrunleriGetir();
                MarkalarıDoldur();
               
            KategorileriDoldur();
            string markaninIdsi = Request.QueryString["Id"];
          
        }

        private void TumUrunleriGetir()
        {
            var sonu = (from u in elec.Urunler
                        select u).ToList();
            dgvUrunler.DataSource = sonu;
            dgvUrunler.DataBind();
        }

       

        private void MarkalarıDoldur()
        {
            var sonuc = (from k in elec.Markalar
                         select new { k.Id, k.Ad }).ToList();
            ddlMarkalar.DataTextField = "Ad";
            ddlMarkalar.DataValueField = "Id";

            ddlMarkalar.DataSource = sonuc;
            ddlMarkalar.DataBind();
        }

        private void KategorileriDoldur()
        {

            var sonuc = (from k in elec.Kategoriler
                         select new { k.Id, k.Ad }).ToList();
           
            ddlKategoriler.DataTextField = "Ad";
            ddlKategoriler.DataValueField = "Id";
            ddlKategoriler.DataSource = sonuc;
            ddlKategoriler.DataBind();

        }
        private void UrunleriDoldur(int? mID,int? kID)
        {
            if (mID==0 )
            {
                var urunleriGetir = (from u in elec.Urunler
                                     where u.Kategoriler.Id == kID
                                     select u).ToList();
                dgvUrunler.DataSource = urunleriGetir;
                dgvUrunler.DataBind();
            }
            else if (kID==0)
            {
                var urunleriGetir = (from u in elec.Urunler
                                     where u.Markalar.Id == mID
                                     select u).ToList();
                dgvUrunler.DataSource = urunleriGetir;
                dgvUrunler.DataBind();
            }
            else
            {
                var urunleriGetir = (from u in elec.Urunler
                                     where u.Markalar.Id == mID && u.Kategoriler.Id==kID
                                     select u).ToList();
                dgvUrunler.DataSource = urunleriGetir;
            }
            dgvUrunler.DataBind();
        }

        protected void ddlMarkalar_SelectedIndexChanged(object sender, EventArgs e)
        {
          
            if (string.IsNullOrEmpty(ddlKategoriler.SelectedValue)) return; //kategoriler boş ise devam

            marId = Convert.ToInt32(ddlMarkalar.SelectedValue);
          //  katId = Convert.ToInt32(ddlKategoriler.SelectedValue);

            UrunleriDoldur(marId, katId);

            
        }

        protected void ddlKategoriler_SelectedIndexChanged(object sender, EventArgs e)
        {
            // MarkayaGoreKategoriDoldur();
            marId = Convert.ToInt32(ddlMarkalar.SelectedValue);
          katId = Convert.ToInt32(ddlKategoriler.SelectedValue);
            UrunleriDoldur(marId, katId);

        }
    }
}