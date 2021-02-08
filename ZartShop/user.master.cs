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
public partial class user : System.Web.UI.MasterPage
{
    WebsiteSettings websettings = new WebsiteSettings();
    Category category = new Category();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            websitesettings();
            fillsearch();
            total();

            data();
        }
   
       
    }
    public void data()
    {
            MembershipUser mem = Membership.GetUser();
            if (mem != null)
            {
                Literal text = (Literal)LoginView1.FindControl("Literal2");
              
                ProfileCommon comm = Profile.GetProfile( mem.UserName);
                string tempname = comm.name;

                if (tempname.Length > 8)
                {
                    tempname = tempname.Substring(0, 8);
                    text.Text = "Welcome " + tempname + "...";
                }
                else
                {
                    text.Text ="Welcome " + tempname;

                }

            }
            else
            {
               
            }
    }
    protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
    {

    }

    protected void LoginStatus1_LoggedOut(object sender, EventArgs e)
    {

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

    public void fillsearch()
    {
        
        DataTable dt = category.fillcategory();
        if (dt.Rows.Count == 0)
        {
            DropDownList1.Items.Insert(0, "All Categories");
        }
        else
        {
            DropDownList1.DataSource = dt;
            DropDownList1.DataTextField = dt.Columns["category"].ToString();
            DropDownList1.DataValueField = dt.Columns["id"].ToString();
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "All Categories");

        }
    }
    public void total()
    {
        int i = Convert.ToInt32(Profile.ZartShopping.Items.Count);
        if (i == 0 || i == 1)
        {
            Literal1.Text = i + " Item";
        }
        else
        {
            Literal1.Text = i + " Items";
        }
    }
}
