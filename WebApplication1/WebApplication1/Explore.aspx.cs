using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Utils;
using DevExpress.Web.ASPxPivotGrid;

namespace Edit
{
    public partial class Explore : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int fieldLength = ASPxPivotGrid1.Fields.Count;
            for (int i = 0; i < fieldLength; i++)
            {
                ASPxPivotGrid1.Fields[i].CellFormat.FormatType = FormatType.Numeric;
                ASPxPivotGrid1.Fields[i].CellFormat.FormatString = "0.##";
            }
        }
    }
}