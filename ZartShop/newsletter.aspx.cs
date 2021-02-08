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
public partial class newsletter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Newsletter ad = new Newsletter();
        MessageBox msg = new MessageBox();
        DataTable dt = ad.checknewsletter(TextBox1.Text);
        if (dt.Rows.Count == 0)
        {
            ad.addnewsletter(TextBox1.Text);
            TextBox1.Text = "";
            msg.Show("You have been successfully subscribed to our newsletter");
        }
        else
        {
            msg.Show("You are already subscribed to our newsletter");
        }
    }
}
