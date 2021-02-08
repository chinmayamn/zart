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
using ZartCartItem;
using ZartShopping;
using ZartDAL;
public partial class order_summary : System.Web.UI.Page
{
    admin ad = new admin();
    Products product = new Products();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            MembershipUser mem = Membership.GetUser();
            if (mem == null)
            {

                Response.Redirect("login.aspx");
            }
            else
            {
                getdata();
                cart();
                frees();

            }
        }

    }

    public void frees()
    {
        

        DataTable dt = ad.getfreeshippinguser();
        if (dt.Rows.Count == 0)
        {

        }
        else
        {
            Literal1.Text = dt.Rows[0]["price"].ToString();
        }

        if (Convert.ToDouble(Profile.ZartShopping.Total) > Convert.ToDouble(Literal1.Text))
        {
            Label2.Text = "You are eligible for free shipping";

        }
        else
        {
            Label2.Text = "";
        }

    }
    

    public void cart()
    {
        if (Profile.ZartShopping.Items.Count == 0)
        {
            Button1.Visible = false;
            Button2.Visible = true;

        }
        else
        {
            Button2.Visible = false;
            Button1.Visible = true;

        }
                Repeater1.DataSource = Profile.ZartShopping.Items;
                Repeater1.DataBind();
                Literal2.Text = Profile.ZartShopping.Total.ToString();
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
                    Label1.Text = dt.Rows[0]["name"].ToString() + "<br>" + dt.Rows[0]["address"].ToString() + "<br>" + "( " + dt.Rows[0]["landmark"].ToString() + " )" + "<br>" + dt.Rows[0]["city"].ToString() + " - " + dt.Rows[0]["postal"].ToString() + "<br>" + dt.Rows[0]["state"].ToString() + "<br>" + dt.Rows[0]["country"].ToString() + "<br>" + dt.Rows[0]["mobile"].ToString() + "<br>" + dt.Rows[0]["email"].ToString();
                }
    }


    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        MessageBox msg = new MessageBox();
        if (e.CommandName == "Edit")
        {
            LinkButton l1 = (LinkButton)e.Item.FindControl("LinkButton2");
            LinkButton l2 = (LinkButton)e.Item.FindControl("LinkButton3");
            Literal l3 = (Literal)e.Item.FindControl("Literal3");
            DropDownList l4 = (DropDownList)e.Item.FindControl("DropDownList1");
            Literal l5 = (Literal)e.Item.FindControl("Literal4");
            DropDownList l6 = (DropDownList)e.Item.FindControl("DropDownList2");
            l1.Visible = false;
            l2.Visible = true;
            l3.Visible = false;
            l4.Visible = true;
            l5.Visible = false;
            l6.Visible = true;
              
        DataTable dt = product.getproductbyid(Convert.ToInt32(e.CommandArgument));
        if (dt.Rows.Count == 0)
        {
            l4.Visible = false;
        }
        else
        {
            l4.Visible = true;
            string color = dt.Rows[0]["color"].ToString();
            string[] tempcolor = color.Split(',');
            int tt = tempcolor.Count();
            DataTable dt1 = new DataTable();
            dt1.Columns.Add("color");
            dt1.Columns.Add("id");

            for (int xx = 0; xx < tt - 1; xx++)
            {
                string f = tempcolor[xx].ToString();


                DataTable dt2 = ad.getcolorfilterbyid(Convert.ToInt32(f));

                dt1.Rows.Add(dt2.Rows[0]["color"].ToString(), dt2.Rows[0]["id"].ToString());

            }

            l4.DataSource = dt1;
            l4.DataTextField = dt1.Columns["color"].ToString();
            l4.DataValueField = dt1.Columns["id"].ToString();
            l4.DataBind();

        }

        string size = dt.Rows[0]["size"].ToString();
        string[] tempsize = size.Split(',');
        int tt1 = tempsize.Count();
        DataTable dt4 = new DataTable();
        dt4.Columns.Add("size");
        dt4.Columns.Add("id");

        for (int yy = 0; yy < tt1 - 1; yy++)
        {
            string g = tempsize[yy].ToString();


            DataTable dt3 = ad.getsizefilterbyid(Convert.ToInt32(g));

            dt4.Rows.Add(dt3.Rows[0]["size"].ToString(), dt3.Rows[0]["id"].ToString());

        }

        l6.DataSource = dt4;
        l6.DataTextField = dt4.Columns["size"].ToString();
        l6.DataValueField = dt4.Columns["id"].ToString();
        l6.DataBind();
        }
        if (e.CommandName == "Update")
        {
            LinkButton l1 = (LinkButton)e.Item.FindControl("LinkButton2");
            LinkButton l2 = (LinkButton)e.Item.FindControl("LinkButton3");
            Literal l3 = (Literal)e.Item.FindControl("Literal3");
            DropDownList l4 = (DropDownList)e.Item.FindControl("DropDownList1");
            Literal l5 = (Literal)e.Item.FindControl("Literal4");
            DropDownList l6 = (DropDownList)e.Item.FindControl("DropDownList2");
            l2.Visible = false;
            l1.Visible = true;
            l4.Visible = false;
            l3.Visible = true;
            l6.Visible = false;
            l5.Visible = true;
            string tempcolor=string.Empty;
            string tempsize=string.Empty;
            int rowid = Convert.ToInt32(e.Item.ItemIndex);
            if (l4.Items.Count == 0)
                tempcolor = "";
            else
                tempcolor = l4.SelectedItem.Text.ToString();

            if (l6.Items.Count == 0)
                tempsize = "";
            else
                tempsize = l6.SelectedItem.Text.ToString();
                Profile.ZartShopping.ColorUpdate(rowid, Convert.ToInt32(e.CommandArgument), tempcolor);

           
            Profile.ZartShopping.SizeUpdate(rowid, Convert.ToInt32(e.CommandArgument), tempsize);
           
            
            frees();
            cart();
        }
        if (e.CommandName == "less")
        {
            TextBox t1 = (TextBox)e.Item.FindControl("TextBox1");
            if (t1.Text == "0" || t1.Text == " ")
            {

                Profile.ZartShopping.Items.RemoveAt(e.Item.ItemIndex);

            }
            else
            {
                int t2 = Convert.ToInt32(t1.Text);
                t2--;
                t1.Text = t2.ToString();

                if (t1.Text == "0" || t1.Text == " ")
                {

                    Profile.ZartShopping.Items.RemoveAt(e.Item.ItemIndex);

                }
                else
                {
                    Profile.ZartShopping.QtyUpdate(Convert.ToInt32(e.Item.ItemIndex), Convert.ToInt32(e.CommandArgument), t2);
             
                
                }


            }



            ((user)this.Page.Master).total(); frees();
            cart();
        }

        if (e.CommandName == "more")
        {
            TextBox t3 = (TextBox)e.Item.FindControl("TextBox1");
            if (t3.Text == "0" || t3.Text == " ")
            {
                t3.Text = "1";
            }
            else
            {
                int t4 = Convert.ToInt32(t3.Text);
                t4++;
                t3.Text = t4.ToString();
                Profile.ZartShopping.QtyUpdate(Convert.ToInt32(e.Item.ItemIndex), Convert.ToInt32(e.CommandArgument), t4);


            } frees();
            cart();
        }
        if (e.CommandName == "remove")
        {
            Profile.ZartShopping.Items.RemoveAt(e.Item.ItemIndex);

            ((user)this.Page.Master).total(); 
            frees();
            cart();
        }


        
       

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("payment-options.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
}
