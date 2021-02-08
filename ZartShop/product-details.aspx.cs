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
using System.Drawing;
using ZartDAL;
public partial class product_details : System.Web.UI.Page
{
    Products product = new Products();
    Brands brand = new Brands();
    Filter filter = new Filter();
    admin ad = new admin();
    Order or = new Order();
    MessageBox msg = new MessageBox();
    protected void Page_Load(object sender, EventArgs e)

    {
       
      
        if (!Page.IsPostBack)
        {



            MembershipUser mem = Membership.GetUser();
            //if (mem == null)
            //{

            //    string tempest = HttpContext.Current.Request.Url.AbsoluteUri;
            //    Response.Redirect("login.aspx?returnurl=" + tempest);
            //}


    
            if (Request.QueryString["id"] != null)
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                filldata(id);
               // fillproductpreview(id);
               // fillnav(id);
               // fillsimiliar(id);
               // filllikethis(id);
            }
        }

    }
 
    public void fillnav(int id)
    {
        
        DataTable dt = ad.getproductnavigate(id);
        if (dt.Rows.Count == 0)
        {
        }
        else
        {
            Repeater3.DataSource = dt;
            
            Repeater3.DataBind();
        }
    }
    public void fillproductpreview(int id)
    {
        

        DataTable dt = product.getproductpreview(id);
        if (dt.Rows.Count == 0)
        {
            
        }
        else
        {
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

            i2.Src = dt.Rows[0]["image"].ToString();
        }
    }
    public void fillsimiliar(int id)
    {
       

        DataTable dt = ad.fillsimiliar(id);
        if (dt.Rows.Count == 0)
        {

        }
        else
        {
            Repeater4.DataSource = dt;
            Repeater4.DataBind();

          
        }
    }
    public void filllikethis(int id)
    {
       

        DataTable dt = ad.filllikethis(id);
        if (dt.Rows.Count == 0)
        {

        }
        else
        {
            Repeater5.DataSource = dt;
            Repeater5.DataBind();


        }
    }
    public  void filldata(int id)

    {
      
        DataTable dt = product.getproductbyid(id);
        if (dt.Rows.Count == 0)
        {
        }
        else
        {
            lblactual.Text = dt.Rows[0]["actual"].ToString();
            lblmrp.Text = dt.Rows[0]["mrp"].ToString();
            lbldiscount.Text = Convert.ToString(Convert.ToInt32(dt.Rows[0]["mrp"]) - Convert.ToInt32(dt.Rows[0]["actual"])) ;
            lbloff.Text ="("+ dt.Rows[0]["discount"].ToString()+ "% Off)" ;
            lblproduct.Text = dt.Rows[0]["pname"].ToString();
            string avail=dt.Rows[0]["availability"].ToString();
            lblbrand.Text = dt.Rows[0]["bname"].ToString();

            
            if(avail=="Yes")
            {
                i1.Src = "images/avail.jpg";
            }
            else
            {
            
                i1.Src="images/incomplete.jpg";
            }

            lbldetails.Text = Server.HtmlDecode(dt.Rows[0]["details"].ToString());
            lblreviews.Text = Server.HtmlDecode(dt.Rows[0]["reviews"].ToString());


            string color = dt.Rows[0]["color"].ToString();
            string[] tempcolor = color.Split(',');
            int tt=tempcolor.Count();
            DataTable dt1 = new DataTable();
            dt1.Columns.Add("color");
            dt1.Columns.Add("id");

            for (int xx = 0; xx < tt-1; xx++)
            {
                string f = tempcolor[xx].ToString();

           
                    DataTable dt2 = filter.getfilterbyid(Convert.ToInt32(f));
                    if (dt2.Rows.Count > 0)
                    {
                        dt1.Rows.Add(dt2.Rows[0]["filtervalue"].ToString(), dt2.Rows[0]["id"].ToString());
                    }
               
            }

            DropDownList1.DataSource = dt1;
            DropDownList1.DataTextField = dt1.Columns["color"].ToString();
            DropDownList1.DataValueField = dt1.Columns["id"].ToString();
            DropDownList1.DataBind();

            string size = dt.Rows[0]["size"].ToString();
            string[] tempsize = size.Split(',');
            int tt1 = tempsize.Count();
            DataTable dt4 = new DataTable();
            dt4.Columns.Add("size");
            dt4.Columns.Add("id");

            for (int yy = 0; yy < tt1 - 1; yy++)
            {
                string g = tempsize[yy].ToString();


                DataTable dt3 = filter.getfilterbyid(Convert.ToInt32(g));

                if (dt3.Rows.Count > 0)
                {
                    dt4.Rows.Add(dt3.Rows[0]["filtervalue"].ToString(), dt3.Rows[0]["id"].ToString());
                }

            }

            Repeater2.DataSource = dt4;
            Repeater2.DataBind();

        }


      //  Literal1.Text=GetYouTubeScript(dt.Rows[0]["video"].ToString());

    }

    protected string GetYouTubeScript(string id)
    {
        string scr = @"<object width='375' height='325'> ";
        scr = scr + @"<param name='movie' value='http://www.youtube.com/v/" + id + "'></param> ";
        scr = scr + @"<param name='allowFullScreen' value='true'></param> ";
        scr = scr + @"<param name='allowscriptaccess' value='always'></param> ";
        scr = scr + @"<embed src='http://www.youtube.com/v/" + id + "' ";
        scr = scr + @"type='application/x-shockwave-flash' allowscriptaccess='always' ";
        scr = scr + @"allowfullscreen='true' width='375' height='325'> ";
        scr = scr + @"</embed></object>";
        return scr;
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        
        MessageBox msg = new MessageBox();
        int id = Convert.ToInt32(Request.QueryString["id"]);
        DataTable dt=product.getproductbyid(id);

        string size;
        if (Label1.Text == "")
        {
            size = " ";
        }
        else
        {
            size=Label1.Text;
        }
       string bb;
        if(lblbrand.Text=="")
        {
            bb=" ";
        }
        else
        {
            bb=lblbrand.Text;
        }
        Profile.ZartShopping.Insert(id,dt.Rows[0]["pname"].ToString(),dt.Rows[0]["image"].ToString(),Convert.ToInt32(TextBox1.Text), Convert.ToDouble(dt.Rows[0]["discount"]),DropDownList1.SelectedItem.Text.ToString(), size  , bb , Convert.ToDouble( dt.Rows[0]["actual"]) , Convert.ToDouble(dt.Rows[0]["tax"]));
        ((user)this.Page.Master).total();

        cart1.items();

     msg.Show("Item added to cart successfully");
             
    
    }
    protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        MessageBox msg = new MessageBox();
        if (e.CommandName == "size")
        {
            LinkButton lnk = (LinkButton)e.Item.FindControl("LinkButton1");
            Label1.Text = e.CommandArgument.ToString();

             foreach (RepeaterItem item in Repeater2.Items)

        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                LinkButton ll = (LinkButton)item.FindControl("LinkButton1");
                if (ll.CommandArgument == Label1.Text)
                {
                    ll.BackColor = System.Drawing.Color.SlateBlue;
                    ll.ForeColor = System.Drawing.Color.White;

                }
                else
                {
                    ll.ForeColor = System.Drawing.Color.Black;
                    ll.BackColor = System.Drawing.Color.LightGray;
                }
            }
            }
        }


           

   


    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
       
        MembershipUser mem = Membership.GetUser();
        if (mem != null)
        {
            string userid = mem.ProviderUserKey.ToString();
            string size;
            if (Label1.Text == "")
            {
                size = " ";
            }
            else
            {
                size = Label1.Text;
            }
            string bb;
            if (lblbrand.Text == "")
            {
                bb = " ";
            }
            else
            {
                bb = lblbrand.Text;
            }

            or.insertwishlist(userid, Convert.ToInt32(Request.QueryString["id"]), bb, size, DropDownList1.SelectedItem.Text.ToString(), TextBox1.Text);
            msg.Show("Product has been added to your wishlist");
        } else
{
    msg.Show("Please login to add this product to wishlist");
}
    }
   
}
