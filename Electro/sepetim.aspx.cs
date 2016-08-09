using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electro
{
    public partial class sepetim : System.Web.UI.Page
    {
        electronixEntities5 elec = new electronixEntities5();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //SepeteYazdir();
                if (Session["sepeteAt"] != null)
                {
                    DataTable dt = (DataTable)Session["sepeteAt"];
                    SepetiDoldur(dt);
                }
                else
                {
                    DataTable dt = new DataTable();
                    gvSepetim.DataSource = dt;
                    gvSepetim.DataBind();
                }

            }
        }

        private void SepetiDoldur(DataTable dt)
        {
            if (Session["sepeteAt"] != null)
            {

                gvSepetim.Columns[1].FooterText = "Toplam : ";
                gvSepetim.Columns[2].FooterText = ToplamAdetBul().ToString();
                gvSepetim.Columns[2].FooterStyle.HorizontalAlign = HorizontalAlign.Center;
                gvSepetim.Columns[3].FooterText = ToplamTutarBul().ToString();
                gvSepetim.Columns[3].FooterStyle.HorizontalAlign = HorizontalAlign.Center;
                gvSepetim.DataSource = dt;
                gvSepetim.DataBind();
                if (Session["sepeteAt"] != null)
                {
                    DataTable dty = (DataTable)Session["sepeteAt"];


                    Label lblAdet = this.Master.FindControl("lblToplamUrun") as Label;
                    Label lblTutar = this.Master.FindControl("lblToplamTutar") as Label;
                    lblAdet.Text = ToplamAdetBul().ToString();
                    lblTutar.Text = ToplamTutarBul().ToString();

                }

            }
        }
        protected void rpSepettekiler_ItemCommand(object source, RepeaterCommandEventArgs e)
        {


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


        protected void gvSepetim_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = (DataTable)Session["sepeteAt"];
            dt.Rows.RemoveAt(e.RowIndex);
            Session["sepeteAt"] = dt;
            SepetiDoldur(dt);

        }
        Satislar s = new Satislar();
        protected void btnOdemeYap_Click(object sender, EventArgs e)
        {
            if (Session["kullanici"] != null)
            {


                Satislar s = new Satislar();
                s.KullaniciNo = Convert.ToInt32(Session["kullanici"]);
                s.Miktar = Convert.ToInt32(gvSepetim.Columns[2].FooterText);
                s.Tutar = Convert.ToDecimal(gvSepetim.Columns[3].FooterText);
                s.TeslimTarihi = DateTime.Now.AddDays(7);
                s.SiparisTarih = DateTime.Now;
                s.Durumu = 0;
               elec.Satislar.Add(s);
                elec.SaveChanges();
                pnlOdeme.Visible = true;
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void gvSepetim_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnBitir_Click(object sender, EventArgs e)
        {
           

                Odemeler o = new Odemeler();
            o.banka = ddlBankaSeciniz.SelectedItem.Text;
            o.cvcno = Convert.ToInt32(txtCvcNo.Text);
            o.taksitsayisi = Convert.ToInt32(ddlTaksitSayisi.SelectedItem.Text);
            o.kulid = Convert.ToInt32(Session["kullanici"]);
            
            elec.Odemeler.Add(o);
           elec.SaveChanges();
            int sOdemId = elec.Odemeler.Where(sn => sn.id == o.id).ToList().Last().id;
            int satidId = elec.Satislar.Max(ı => ı.SatisNo);
            var GSatis = (from k in elec.Satislar
                          where k.SatisNo == satidId
                          select k).FirstOrDefault();
            GSatis.OdemeId = sOdemId;
           

            elec.SaveChanges();
            SepeteEklenen spt = new SepeteEklenen();
            DataTable dt = (DataTable)Session["sepeteAt"];
            bool sonuc = false;
            foreach (DataRow dr in dt.Rows)
            {
                spt.SatisNo = GSatis.SatisNo;
                spt.Adet = Convert.ToInt32(dr["Adet"]);
                spt.Fiyat = Convert.ToInt32(dr["Fiyatı"]);
                spt.Tutar = Convert.ToDecimal(dr["tutar"]);
                spt.UrunId = Convert.ToInt32(dr["UrunId"]);
                //Model Eklenecek
                spt.Detay = dr["Detayı"].ToString();
                spt.Satildi = true;
 elec.SepeteEklenen.Add(spt);
           sonuc=Convert.ToBoolean(elec.SaveChanges());
              
                StoktanDus(spt.UrunId,Convert.ToInt32(spt.Adet));
               
            }
            
           
            try
            {
                if (sonuc)
                {


                    dt.Rows.Clear();
                    Session["sepetAt"] = dt;
                    SepetiDoldur(dt);
                }
                else
                {
                    spt.Satildi = false;
                }
            }
            catch (Exception ex)
            {

                string hata = ex.Message;
            }

        }

        private void StoktanDus(int urunId,int urunAdet)
        {
            var stok = (from u in elec.Urunler
                        where u.Id == urunId
                        select u).FirstOrDefault();
            stok.Adet = Convert.ToInt32(stok.Adet) - urunAdet;
            stok.Id = urunId;
            elec.SaveChanges();
        }
    }
}