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
public partial class admin_website_settings : System.Web.UI.Page
{
    WebsiteSettings websettings = new WebsiteSettings();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            filldata();
        }

    }
    public void filldata()
    {
        
        DataTable dt = websettings.getwebsitesettings();
        if (dt.Rows.Count == 0)
        {
        }
        else
        {
            TextBox1.Text = dt.Rows[0]["title"].ToString();
            TextBox2.Text = dt.Rows[0]["keywords"].ToString();
            TextBox3.Text = dt.Rows[0]["description"].ToString();

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        MessageBox msg = new MessageBox();
        websettings.updatewebsitesettings(TextBox1.Text, TextBox2.Text, TextBox3.Text);
       
        msg.Show("Website settings updated successfully");
        filldata();
    }
}
