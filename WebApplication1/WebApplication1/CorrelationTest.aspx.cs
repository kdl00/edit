using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using STATCONNECTORCLNTLib; 
using StatConnectorCommonLib; 
using STATCONNECTORSRVLib;
using MathNet.Numerics.Statistics;


namespace Edit
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // HttpContext ctx = HttpContext.Current;
           //ctx.Request.Form[
            string connStr = "Server=127.0.0.1;Database=edit;Trusted_Connection=True;";
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM [edit].[dbo].[datawarehouse]", conn);
            SqlDataReader r = cmd.ExecuteReader();

            DataTable tableSchema = new DataTable();

            tableSchema.Load(r);

           foreach(DataColumn dc in tableSchema.Columns)
           {
                DropDownList1.Items.Add(dc.ColumnName);
                DropDownList2.Items.Add(dc.ColumnName);
           }

          

            conn.Close();

           // tableSchema.Columns.Contains()
         // //  if (r.HasRows)
        //    {
       //         while (r.Read())
       //         {

       //         }
       //     }

           

            /*
            StatConnector conn = new STATCONNECTORSRVLib.StatConnector();
            conn.Init("R");
            double[] x = new double[1000];
            double[] y = new double[1000];
            for (int i = 0; i < 1000; i++)
            {
                x[i] = i;
                y[i] = Math.Sqrt(i*2);
            }
            conn.EvaluateNoReturn("dx <- c(44.4, 45.9, 41.9, 53.3, 44.7, 44.1, 50.7, 45.2, 60.1)");
            conn.EvaluateNoReturn("dy <- c( 2.6,  3.1,  2.5,  5.0,  3.6,  4.0,  5.2,  2.8,  3.8)");
            object[] o = conn.Evaluate("cor.test(dx,dy)");
            // for pearson correlation [3] of returned object contains the correlation coef
           Literal1.Text = o[3].ToString();
            conn.Close();*/
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            string c1 = DropDownList1.SelectedValue;
            string c2 = DropDownList2.SelectedValue;
            string connStr = "Server=127.0.0.1;Database=edit;Trusted_Connection=True;";

            List<double> col1Values = new List<double>();
            List<double> col2Values = new List<double>();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(String.Format("SELECT [{0}],[{1}] FROM [edit].[dbo].[datawarehouse]", c1, c2), conn))
                {
                    using (SqlDataReader r = cmd.ExecuteReader())
                    {
                        DataTable dt = new DataTable();
                        dt.Load(r);

                        if (dt.Columns[0].DataType != typeof(System.Double) || dt.Columns[1].DataType != typeof(System.Double))
                        {
                            Literal1.Text = "These two columns cannot be compared!";
                            return;
                        }

                        double a = 0;
                        double b = 0;
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            if (dt.Rows[i].ItemArray.GetValue(0) != DBNull.Value && dt.Rows[i].ItemArray.GetValue(1) != DBNull.Value)
                            {
                                a = (double)dt.Rows[i].ItemArray.GetValue(0);
                                b = (double)dt.Rows[i].ItemArray.GetValue(1);
                                col1Values.Add(a);
                                col2Values.Add(b);
                            }
                        }
                    }
                }
            }

            double correlation = Math.Round(Correlation.Pearson(col1Values, col2Values), 3, MidpointRounding.ToEven);
            //double coeffDetermination = Math.Round(Math.Pow(correlation, 2), 3, MidpointRounding.ToEven);
           //double coeffAlienation = Math.Round(1 - coeffDetermination, 3, MidpointRounding.ToEven);
            Literal1.Text = String.Format("The correlation is: {0}<br>", correlation);
        }
    }
}