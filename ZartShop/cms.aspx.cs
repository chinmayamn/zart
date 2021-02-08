using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using ZartDAL;
public partial class cms : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            Cms ad = new Cms();
            DataTable dt = ad.getaboutus(Request.QueryString["id"]);
            if (dt.Rows.Count == 0)
            {
            }
            else
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
        }
    }
}
