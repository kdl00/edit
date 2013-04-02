﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using MathNet.Numerics.Statistics;
using DevExpress.Utils;
using DevExpress.XtraCharts;
using DevExpress.XtraCharts.Web;


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
            
            SeriesPoint[] sp = new SeriesPoint[col1Values.Count];
            Series s = new Series("Comparison", ViewType.Point);
            for (int i = 0; i < col1Values.Count; i++)
            {
                sp[i] = new SeriesPoint(col1Values[i], col2Values[i]);
                s.Points.Add(sp[i]);
            }
            RegressionLine rl = new RegressionLine("regression line");
            rl.LineStyle.DashStyle = DashStyle.Dot;
            rl.LineStyle.Thickness = 2;
            rl.Color = System.Drawing.Color.Aqua;

            
           
            
            s.ArgumentScaleType = ScaleType.Numerical;
            s.ValueScaleType = ScaleType.Numerical;
            ChartTitle ct = new ChartTitle();
            ct.Text = DropDownList1.SelectedValue + " compared to " + DropDownList2.SelectedValue;
            WebChartControl1.Titles.Clear();
            WebChartControl1.Titles.Add(ct);
            WebChartControl1.Series.Clear();
            WebChartControl1.Series.Add(s);
            ((PointSeriesView)WebChartControl1.Series[0].View).Indicators.Clear();
            ((PointSeriesView)WebChartControl1.Series[0].View).Indicators.Add(rl);
            ((XYDiagramSeriesViewBase)WebChartControl1.Series[0].View).AxisX.Title.Visible = true;
            ((XYDiagramSeriesViewBase)WebChartControl1.Series[0].View).AxisX.Title.Alignment = System.Drawing.StringAlignment.Center;
            ((XYDiagramSeriesViewBase)WebChartControl1.Series[0].View).AxisX.Title.Text = DropDownList1.SelectedValue;
            ((XYDiagramSeriesViewBase)WebChartControl1.Series[0].View).AxisX.Title.TextColor = System.Drawing.Color.Red;
            ((XYDiagramSeriesViewBase)WebChartControl1.Series[0].View).AxisX.Title.Antialiasing = true;

            ((XYDiagramSeriesViewBase)WebChartControl1.Series[0].View).AxisY.Title.Visible = true;
            ((XYDiagramSeriesViewBase)WebChartControl1.Series[0].View).AxisY.Title.Alignment = System.Drawing.StringAlignment.Center;
            ((XYDiagramSeriesViewBase)WebChartControl1.Series[0].View).AxisY.Title.Text = DropDownList2.SelectedValue;
            ((XYDiagramSeriesViewBase)WebChartControl1.Series[0].View).AxisY.Title.TextColor = System.Drawing.Color.Red;
            ((XYDiagramSeriesViewBase)WebChartControl1.Series[0].View).AxisY.Title.Antialiasing = true;
            
        }
    }
}