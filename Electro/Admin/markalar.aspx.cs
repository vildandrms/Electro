using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electro.Admin
{
    public partial class markalar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MarkaDoldur();
            }

        }
        electronixEntities5 elec = new electronixEntities5();
        protected void lbtnKaydet_Click(object sender, EventArgs e)
        {
            if (txtMarka.Text.Trim() != "")
            {
                Markalar yeni = new Markalar();
                yeni.Ad = txtMarka.Text;
                elec.Markalar.Add(yeni);
                try
                {
                    bool sonuc = Convert.ToBoolean(elec.SaveChanges());
                    if (sonuc)
                    {
                        Response.Write("Marka Eklendi.");
                        txtMarka.Text = string.Empty;
                        MarkaDoldur();
                    }
                    else
                    {
                        Response.Write("Marka Eklenemedi.");
                    }
                }
                catch (SqlException ex)
                {

                    string hata = ex.Message;
                }
            }
            else
            {
                Response.Write("Marka İsmi Giriniz.");
            }
        }

        private void MarkaDoldur()
        {
            var sonuc = (from k in elec.Markalar
                         select new { k.Id, k.Ad }).ToList();
            ddlMarkalar.DataTextField = "Ad";
            ddlMarkalar.DataValueField = "Id";

            ddlMarkalar.DataSource = sonuc;
            ddlMarkalar.DataBind();
        }

        protected void ddlMarkalar_SelectedIndexChanged(object sender, EventArgs e)
        {

            lblMaId.Text = (ddlMarkalar.SelectedValue).ToString();
            txtMarka.Text = (ddlMarkalar.SelectedItem).ToString();
        }

        protected void lbtnGuncelle_Click(object sender, EventArgs e)
        {
            if (lblMaId.Text.Trim() != "")
            {


                int seciliMar = Convert.ToInt32(lblMaId.Text);
                var Gnc = (from k in elec.Markalar
                           where k.Id == seciliMar
                           select k).FirstOrDefault();

                Gnc.Ad = txtMarka.Text.Trim();
                //elec.Kategoriler.Add(Gnc);
                try
                {
                    bool sonuc = Convert.ToBoolean(elec.SaveChanges());
                    if (sonuc)
                    {
                        Response.Write("Marka Güncellendi.");
                        MarkaDoldur();
                        txtMarka.Text = string.Empty;
                    }
                    else
                    {
                        Response.Write("Marka Güncellenemedi.");
                    }
                }
                catch (SqlException ex)
                {

                    string hata = ex.Message;
                }
            }
            else
            {
                Response.Write("Marka Seçiniz.");
            }
        }

        protected void lbtnSil_Click(object sender, EventArgs e)
        {
            if (lblMaId.Text.Trim() != "")
            {

                int seciliMar = Convert.ToInt32(lblMaId.Text);
                var sil = (from k in elec.Markalar
                           where k.Id == seciliMar
                           select k).FirstOrDefault();
                elec.Markalar.Remove(sil);

                try
                {
                    bool sonuc = Convert.ToBoolean(elec.SaveChanges());
                    if (sonuc)
                    {
                        Response.Write("Marka Silindi.");
                        MarkaDoldur();
                        txtMarka.Text = string.Empty;
                    }
                    else
                    {
                        Response.Write("Marka Silinemedi.");
                    }
                }
                catch (Exception)
                {

                    throw;
                }
            }
            else
            {
                Response.Write("Marka Seçiniz.");
            }
        }
    }
    }
