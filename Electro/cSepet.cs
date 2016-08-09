using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Electro
{
    public class cSepet
    {
        public DataTable YeniSepet()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("sepetID");
            dt.Columns["sepetID"].DataType = typeof(int);
            dt.Columns["sepetID"].AutoIncrement = true;// ıd olugu için 1 er 1er artması için
            dt.Columns["sepetID"].AutoIncrementSeed = 1;
            dt.Columns["sepetID"].AutoIncrementStep = 1;

            dt.Columns.Add("UrunId");
            dt.Columns["UrunId"].DataType = typeof(int);

            dt.Columns.Add("Model");
            dt.Columns["Model"].DataType = typeof(string);

            dt.Columns.Add("Detayı");
            dt.Columns["Detayı"].DataType = typeof(string);

            dt.Columns.Add("Adet");
            dt.Columns["Adet"].DataType = typeof(int);
            dt.Columns["Adet"].DefaultValue = 1;

            dt.Columns.Add("Fiyatı");
            dt.Columns["Fiyatı"].DataType = typeof(decimal);
            dt.Columns["Fiyatı"].DefaultValue = 0;

            dt.Columns.Add("tutar");
            dt.Columns["tutar"].DataType = typeof(decimal);
            dt.Columns["tutar"].DefaultValue = 0;


            return dt;
        }
    }
}