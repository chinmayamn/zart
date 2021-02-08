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
public partial class wishlist : System.Web.UI.Page
{
    Order or = new Order();
    admin ad = new admin();
    Products product = new Products();
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
                fillwishlist();
            }

        }
    }

    public void fillwishlist()
    {
      
       MembershipUser mem = Membership.GetUser();
       string userid = mem.ProviderUserKey.ToString();
       DataTable dt = or.getwishlistuser(userid);
       if (dt.Rows.Count == 0)
       {
           Label1.Visible = true;
           Repeater1.Visible = false;
       }
       else
       {
           Label1.Visible = false;
           Repeater1.Visible = true;
           Repeater1.DataSource = dt;
           Repeater1.DataBind();
       }
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
       
        MessageBox msg = new MessageBox();
        if (e.CommandName == "delete")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            or.removewishlistuser(id);
            msg.Show("Product removed from your wishlist");
            fillwishlist();
            


        }
        if (e.CommandName == "add")
        {
            
            int id = Convert.ToInt32(e.CommandArgument);

            DataTable dt = product.getproductbyid(id);
            Label l4 = (Label)e.Item.FindControl("Label4");
            Label l7 = (Label)e.Item.FindControl("Label7");
            Label l5 = (Label)e.Item.FindControl("Label5");
            Label l6 = (Label)e.Item.FindControl("Label6");
            Profile.ZartShopping.Insert(id, dt.Rows[0]["pname"].ToString(), dt.Rows[0]["image"].ToString(), Convert.ToInt32(l6.Text), Convert.ToDouble(dt.Rows[0]["discount"]), l5.Text, l7.Text, l4.Text, Convert.ToDouble(dt.Rows[0]["actual"]),Convert.ToDouble(dt.Rows[0]["tax"]));
            Cart1.items();
            ((user)this.Page.Master).total();
            MembershipUser mem = Membership.GetUser();
            string userid = mem.ProviderUserKey.ToString();
            or.removewishlistuser(userid,id);
             msg.Show("Product added to cart successfully");
            fillwishlist();
         
            
        }

    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {


        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType== ListItemType.AlternatingItem)
        {
            Label l2 = (Label)e.Item.FindControl("Label2");
            Label l3= (Label)e.Item.FindControl("Label3");
            Image i1 = (Image)e.Item.FindControl("Image1");
           
if (l3.Text == "Yes")
        {
            l2.Text = " In-Stock ";
        i1.ImageUrl="images/avail.jpg";
        }
        else
        {

            l2.Text = " Out-of-Stock ";
    
         i1.ImageUrl= "images/incomplete.jpg";
        }
        }
      
        

    }
}
