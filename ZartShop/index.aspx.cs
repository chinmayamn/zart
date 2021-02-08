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
public partial class index : System.Web.UI.Page
{
    Brands brand = new Brands();
    Products product = new Products();
    Banner banner = new Banner();
    admin ad = new admin();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            newarrival();
            entertainment();
            hotoffers();
            exclusive();
            DataTable dt=banner.getbanner();
            if(dt.Rows.Count!=0)
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
            DataTable dt1 = ad.getadsbyposition("Top-Right");
            if (dt1.Rows.Count != 0)
            {
                 Repeater2.DataSource = dt1;
                Repeater2.DataBind();
            }
            DataTable dt2 = ad.getadsbyposition("Left-1");
            if (dt2.Rows.Count != 0)
            {
                img3.Src = dt2.Rows[0]["image"].ToString();
            }
            DataTable dt3 = ad.getadsbyposition("Left-2");
            if (dt3.Rows.Count != 0)
            {
                img4.Src = dt3.Rows[0]["image"].ToString();
            }
        }
    }
    public void newarrival()
    {
        DataTable dt = ad.gettop4newarrivals();
        if (dt.Rows.Count != 0)
        {
            Repeater3.DataSource = dt;
            Repeater3.DataBind();
        }
    }
    public void entertainment()
    {
        DataTable dt = ad.gettop4entertainmentgadgets();
        if (dt.Rows.Count != 0)
        {
            Repeater4.DataSource = dt;
            Repeater4.DataBind();
        }
    }
    public void hotoffers()
    {
        DataTable dt = ad.gettop6hotoffers();
        if (dt.Rows.Count != 0)
        {
            Repeater5.DataSource = dt;
            Repeater5.DataBind();
        }
    }
    public void exclusive()
    {
        DataTable dt = ad.gettop6exclusive();
        if (dt.Rows.Count != 0)
        {
            Repeater6.DataSource = dt;
            Repeater6.DataBind();
        }
    }
    protected void Repeater3_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "add")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            DataTable dt = product.getproductbyid(id);
            int dis=Convert.ToInt32(dt.Rows[0]["brand"]);
            DataTable dt1=brand.getbrandsbyid(dis);
            string disa=string.Empty;
            if(dt1.Rows.Count!=0)
           {
                disa=dt.Rows[0]["bname"].ToString();
            }
            Profile.ZartShopping.Insert(id, dt.Rows[0]["pname"].ToString(), dt.Rows[0]["image"].ToString(), 1, Convert.ToDouble(dt.Rows[0]["discount"]), " ", " ", disa, Convert.ToDouble(dt.Rows[0]["actual"]), Convert.ToDouble(dt.Rows[0]["tax"]));
            ((user)this.Page.Master).total();
            MessageBox msg = new MessageBox();
            msg.Show("Product added to cart successfully");
        }
    }
    protected void Repeater4_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "add")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            DataTable dt = product.getproductbyid(id);
            int dis = Convert.ToInt32(dt.Rows[0]["brand"]);
            DataTable dt1 = brand.getbrandsbyid(dis);
            string disa = string.Empty;
            if (dt1.Rows.Count != 0)
            {
                disa = dt.Rows[0]["bname"].ToString();
            }
            Profile.ZartShopping.Insert(id, dt.Rows[0]["pname"].ToString(), dt.Rows[0]["image"].ToString(), 1, Convert.ToDouble(dt.Rows[0]["discount"]), " ", " ", disa, Convert.ToDouble(dt.Rows[0]["actual"]),  Convert.ToDouble(dt.Rows[0]["tax"]));
            ((user)this.Page.Master).total();
            MessageBox msg = new MessageBox();
            msg.Show("Product added to cart successfully");
        }
    }
}
