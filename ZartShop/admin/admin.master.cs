using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Data.SqlClient;
using ZartDAL;
public partial class admin_admin : System.Web.UI.MasterPage
{
    WebsiteSettings websettings = new WebsiteSettings();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            websitesettings();
            //if (Session["pwd"] != null)
            //{
            //}
            //else
            //{
            //    Response.Redirect("adminlogin.aspx");
            //}
        }
    }
    public void websitesettings()
    {
      


        DataTable dt = websettings.getwebsitesettings();
        if (dt.Rows.Count == 0)
        {
          
           

        }
        else
        {
        Page.Title = dt.Rows[0]["title"].ToString();
        metaKeywords.Content = dt.Rows[0]["keywords"].ToString();
        metaDesc.Content = dt.Rows[0]["description"].ToString();

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("adminlogin.aspx");
    }
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {

    }
}