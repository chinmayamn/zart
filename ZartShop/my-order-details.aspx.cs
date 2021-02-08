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
public partial class my_order_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            MembershipUser mem = Membership.GetUser();
            if (mem == null)
            {
                string tempest = HttpContext.Current.Request.Url.AbsoluteUri;
                Response.Redirect("login.aspx?returnurl=" + tempest);
            }
            else
            {
                getdata();
                if (Request.QueryString["id"] != null)
                {
                    datafill();
                    fillprofile();
                    orders();
                    ordersproduct();
                    fillorderstatusgrid();
                }
            }
        }
    }
    public void fillprofile()
    {
        MembershipUser mem = Membership.GetUser();
        string id = mem.UserName;
        MembershipUser u = Membership.GetUser(id);
        string c = u.UserName.ToString();
        ProfileCommon comm = Profile.GetProfile(c);
        Literal6.Text = comm.name + "<br>" + comm.Address + " ( " + comm.Landmark + " ) " + "<br>" + comm.City + " - " + comm.PostalCode + "<br>" + comm.State + "<br>" + comm.Country + "<br>" + comm.Mobile + "<br>" + mem.Email.ToString(); 
    }

    public void datafill()
    {
        string id = Convert.ToString(Request.QueryString["id"]);

       Order or= new Order();
       DataTable dt = or.select_ordersid(id);
       if (dt.Rows.Count == 0)
       {
       }
       else
       {
           Repeater1.DataSource = dt;
           Repeater1.DataBind();
       }

    
    }
    public void getdata()
    {
        MembershipUser mem = Membership.GetUser();
        string userid = mem.ProviderUserKey.ToString();

        Order or = new Order();
        DataTable dt = or.getorderdet(userid);
        if (dt.Rows.Count == 0)
        {
        }
        else
        {
            Literal7.Text  = Literal5.Text= dt.Rows[0]["name"].ToString() + "<br>" + dt.Rows[0]["address"].ToString() + "<br>" + "( " + dt.Rows[0]["landmark"].ToString() + " )" + "<br>" + dt.Rows[0]["city"].ToString() + " - " + dt.Rows[0]["postal"].ToString() + "<br>" + dt.Rows[0]["state"].ToString() + "<br>" + dt.Rows[0]["country"].ToString() + "<br>" + dt.Rows[0]["mobile"].ToString() + "<br>" + dt.Rows[0]["email"].ToString();
        }

    
    }

    public void orders()
    {

         string id = Convert.ToString(Request.QueryString["id"]);

       Order or= new Order();
       DataTable dt = or.select_ordersid(id);
       if (dt.Rows.Count == 0)
       {
       }
       else
       {
           Literal4.Text = dt.Rows[0]["Status"].ToString();
       }
    }

    public void ordersproduct()
    {

        string id = Convert.ToString(Request.QueryString["id"]);

        Order or = new Order();
        DataTable dt = or.getordersproduct(id);
        if (dt.Rows.Count == 0)
        {
        }
        else
        {
            Repeater2.DataSource = dt;
            Repeater2.DataBind();

            double p=0;
            for (int i = 0; i <dt.Rows.Count; i++)
            {
                p = p + Convert.ToDouble(dt.Rows[i]["linetotal"]);
            }


              
              Literal3.Text = p.ToString();
        }
    }


    public void fillorderstatusgrid()
    {
        revieworder ro = new revieworder();

        int id = Convert.ToInt32(Request.QueryString["id"]);
        DataSet ds = ro.fillorderstatus(id);
        if (ds.Tables[0].Rows.Count == 0)
        {
            Literal1.Visible = true;

            Repeater3.Visible = false;
        }
        else
        {
            Literal1.Visible = false;
            Repeater3.Visible = true;
            Repeater3.DataSource = ds;
            Repeater3.DataBind();
        }
    }
}
