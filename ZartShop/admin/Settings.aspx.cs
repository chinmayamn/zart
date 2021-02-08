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
using System.Data.SqlClient;
using ZartDAL;
public partial class admin_Settings : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            admin ad = new admin();
            DataTable dt = ad.fillleftcategory();
            if (dt.Rows.Count == 0)
            {
            }
            else
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }


            DataTable dt1 = ad.fillrightcategory();
            if (dt1.Rows.Count == 0)
            {
           } 
            else
            {
                Repeater2.DataSource = dt1;
                Repeater2.DataBind();
            }
        }
    }
    protected void Repeater2_ItemCreated(object sender, RepeaterItemEventArgs e)
    {
        MessageBox msg = new MessageBox();
        msg.Show("asd");
    }
}
