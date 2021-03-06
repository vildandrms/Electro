﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electro
{
    public partial class urundetay : System.Web.UI.Page
    {
        electronixEntities5 elec = new electronixEntities5();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DetayiGetir();
                SepeteYazdir();

            }
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
                    Label lblAdet = this.Master.FindControl("lblToplamUrun") as Label;
                    Label lblTutar = this.Master.FindControl("lblToplamTutar") as Label;
                    lblAdet.Text = ToplamAdetBul().ToString();
                    lblTutar.Text = ToplamTutarBul().ToString();
                }


            }
        }
        private void DetayiGetir()
        {

            int id = Convert.ToInt32(Request.QueryString["urunId"]);

            Urunler seciliUrun = elec.Urunler.FirstOrDefault(urun => urun.Id == id);
            List<Urunler> urunlerim = new List<Urunler>();
            urunlerim.Add(seciliUrun);
            rpUrunler.DataSource = urunlerim;
            rpUrunler.DataBind();
        }
        cSepet s = new cSepet();
        protected void rpUrunler_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "sepeteAt")
            {

                if (Session["sepeteAt"] == null)
                {
                    Session["sepeteAt"] = s.YeniSepet();
                }
                DataTable dt = (DataTable)Session["sepeteAt"];
                int UId = Convert.ToInt32(e.CommandArgument);

                Label Modeli = (Label)e.Item.FindControl("lblModel");
                Label Fiyat = (Label)e.Item.FindControl("lblFiyat");
                int Adeti = 1;
                bool Varmi = false;

                foreach (DataRow dr in dt.Rows)
                {
                    if (Convert.ToInt32(dr["UrunId"]) == UId)
                    {
                        Varmi = true;
                        dr["Adet"] = Convert.ToInt32(dr["Adet"]) + Convert.ToInt32(dr["Adet"]);
                        dr["tutar"] = Convert.ToDecimal(dr["tutar"]) + (Convert.ToInt32(Adeti) * Convert.ToDecimal(Fiyat.Text));
                      
                        Session["sepeteAt"] = dt;
                        SepeteYazdir();

                        break;


                    }
                }
                if (Varmi == false)
                {
                    var dty = (from u in elec.Urunler
                               where u.Id == UId
                               select u.Detay).FirstOrDefault();
                    DataRow drw;
                    drw = dt.NewRow();
                    drw["UrunId"] = UId;
                    drw["Model"] = Modeli.Text;
                    drw["Adet"] = Adeti;
                    drw["Detayı"] = dty;
                    drw["Fiyatı"] = Convert.ToSingle(Fiyat.Text);
                    drw["tutar"] = Adeti * Convert.ToDouble(Fiyat.Text);
                    dt.Rows.Add(drw);
                    Session["sepeteAt"] = dt;
                    SepeteYazdir();


                }

            }    }
        }
}