using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using MathNet.Numerics.Statistics;


namespace Edit
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = "Server=127.0.0.1;Database=edit;Trusted_Connection=True;";
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM [edit].[dbo].[datawarehouse]", conn);
            SqlDataReader r = cmd.ExecuteReader();

            DataTable tableSchema = new DataTable();

            tableSchema.Load(r);

            foreach (DataColumn dc in tableSchema.Columns)
            {
                DropDownList1.Items.Add(dc.ColumnName);
                DropDownList2.Items.Add(dc.ColumnName);
            }

            conn.Close();
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

            double correlation = Math.Round(Correlation.Pearson(col1Values, col2Values), 5, MidpointRounding.ToEven);
            double percentageCorrelation = Math.Round(correlation * 100, 0);
            Literal1.Text = String.Format("The correlation is: {0}% ({1})<br/><p><strong>Please understand that high correlations do not necessarily imply causation -- only association!</strong></p><br/>", percentageCorrelation, correlation);
        }
    }
}