using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electro.Admin
{
    public partial class raporlar : System.Web.UI.Page
    {
        electronixEntities5 elec = new electronixEntities5();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (GridView1.Visible == true)
            {
                GridView1.Visible = false;
                GridView2.Visible = false;
                txtUrunAra.Visible = false;
                Label2.Visible = false;
                btnModelAra.Visible = false;
            }
            else
            {
                GridView1.Visible = true;
                GridView2.Visible = false;
                txtUrunAra.Visible = true;
                Label2.Visible = true;
                btnModelAra.Visible = true;
            }

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (GridView2.Visible == true)
            {
                GridView2.Visible = false;
                GridView1.Visible = false;
                btnSatisArama.Visible = false;
                Label1.Visible = false;
                txtSatıiAra.Visible = false;
            }
            else
            {
                GridView2.Visible = true;
                GridView1.Visible = false;
                btnSatisArama.Visible = true;
                Label1.Visible = true;
                txtSatıiAra.Visible = true;
            }

        }

        protected void txtSatıiAra_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnSatisArama_Click(object sender, EventArgs e)
        {

            string arananSatıs = txtSatıiAra.Text;
            if (arananSatıs.Length >= 3)
            {
                GridView2.DataBind();
                for (int i = 0; i < GridView2.Rows.Count - 1; i++)
                {
                    for (int j = 0; j < GridView2.Columns.Count - 1; j++)
                    {
                        if (arananSatıs == GridView2.Rows[i].Cells[j].Text)
                        {
                            GridView2.Rows[i].Cells[j].BackColor = System.Drawing.Color.DeepPink;
                        }
                    }
                    txtSatıiAra.Text = "";
                }
            }
            else
            {
                GridView2.DataBind();
            }
        }

        protected void btnModelAra_Click(object sender, EventArgs e)
        {
            string arananSatıs = txtUrunAra.Text;
            if (arananSatıs.Length >= 3)
            {
                GridView1.DataBind();
                for (int i = 0; i < GridView1.Rows.Count - 1; i++)
                {
                    for (int j = 0; j < GridView1.Columns.Count - 1; j++)
                    {
                        if (arananSatıs == GridView1.Rows[i].Cells[j].Text)
                        {
                            GridView1.Rows[i].Cells[j].BackColor = System.Drawing.Color.DeepPink;
                        }
                    }
                    txtUrunAra.Text = "";
                }
            }
            else
            {
                GridView1.DataBind();

            }
        }
    }
}