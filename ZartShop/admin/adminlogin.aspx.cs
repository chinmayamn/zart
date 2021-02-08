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
public partial class admin_adminlogin : System.Web.UI.Page
{
    WebsiteSettings websettings = new WebsiteSettings();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            websitesettings();

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

    protected void Button1_Click(object sender, EventArgs e)
    {
        MessageBox msg = new MessageBox();
        admin ad = new admin();
        DataTable dt = ad.getadminlogin();
        string u = dt.Rows[0]["username"].ToString();
        string p = dt.Rows[0]["password"].ToString();
        string username = TextBox1.Text;
        string password = TextBox2.Text;

        if (username == u && password == p)
        {
            Session["pwd"] = TextBox2.Text;
            Session["name"] = TextBox1.Text;
            Response.Redirect("banner.aspx");
        }
        else
        {
            msg.Show("Enter correct username and password");
        }


    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        MessageBox msg = new MessageBox();
        admin ad = new admin();
        mailing mail = new mailing();

        DataTable dt = ad.getadminlogin();
        string u = dt.Rows[0]["username"].ToString();
        string p = dt.Rows[0]["password"].ToString();
        string adminemail=mailing.adminemail;

        mail.mymail(adminemail,"Dear Admin,<br/> Please your admin panel details are as follows <br/>Username :" + u + "Password :"+ p+ "<br/><br/>Regards,<br/>ZartShop.Com" ,"Admin Panel Password");
        msg.Show("Username and password has been sent to your specified email id");
    }
}

