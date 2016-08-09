using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electro
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        electronixEntities5 elec = new electronixEntities5();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                
                KategoriDoldur();
                MarkalarıDoldur();
                YeniÜrünleriDoldur();
                SepeteYazdir();
                
                if (Session["kullanici"]==null)
                {

                    lblGiris.Text = "Giriş";
                    
                }
                else if(Session["kullanici"]!=null)
                {
                    lblGiris.Text = "Çıkış";
                 
                }
               
            }
        }

        private void YeniÜrünleriDoldur()
        {
            var   yUrun = (from y in elec.Urunler
                         where y.Yeni == true
                         select y.Id).ToList();
            Random rnd = new Random();
            int gecici = rnd.Next(0,yUrun.Count);
            int istenilen = yUrun[gecici];
            var yUrun2 = (from y in elec.Urunler
                         where y.Yeni == true && y.Id==istenilen
                         select y).ToList();


            var yEnokSatan = (from y in elec.Urunler
                              where y.Vitrin == true
                              select y.Id).ToList();
            int gecici2 = rnd.Next(0, yEnokSatan.Count);
            int istenilen2 = yUrun[gecici2];
            var yEncokSatan2 = (from y in elec.Urunler
                                where y.Yeni == true && y.Id == istenilen2
                                select y).ToList();
            rptYeniUrunler.DataSource = yUrun2;
            rptYeniUrunler.DataBind();
            rptVitrin.DataSource = yEncokSatan2;
            rptVitrin.DataBind();

        }

        private decimal ToplamTutarBul()
        {
            decimal toplamtutar = 0;
            DataTable dt = (DataTable)Session["sepeteAt"];
            foreach (DataRow dr in dt.Rows)
            {
                toplamtutar += Convert.ToDecimal(dr["tutar"]);
            }
            return toplamtutar;
        }
        private int ToplamAdetBul()
        {
            int adet = 0;
            DataTable dt = (DataTable)Session["sepeteAt"];
            foreach (DataRow dr in dt.Rows)
            {
                adet += Convert.ToInt32(dr["Adet"]);
            }
            return adet;
        }
        private void SepeteYazdir()
        {
            if (Session["sepeteAt"] != null)
            {
                DataTable dt = (DataTable)Session["sepeteAt"];
                foreach (DataRow dr in dt.Rows)
                {
                    lblToplamUrun.Text = ToplamAdetBul().ToString();
                    lblToplamTutar.Text = ToplamTutarBul().ToString();
                }   
             

            }
        }
        private void MarkalarıDoldur()
        {
            var sonuc = (from m in elec.Markalar
                         select new { m.Id, m.Ad }).ToList();
            rpMarkalar.DataSource = sonuc;
            rpMarkalar.DataBind();
        }     
        private void KategoriDoldur()
        {

            var sonuc = (from k in elec.Kategoriler
                         select new { k.Id, k.Ad }).ToList();

            rpKategoriler.DataSource = sonuc;
            rpKategoriler.DataBind();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
           

        }
    }
}