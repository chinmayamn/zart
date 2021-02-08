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
public partial class cart : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            items();
         
        }
    }
   
    public void items()
    {
         admin ad = new admin();
         double p;
        DataTable dt = ad.getfreeshippinguser();
        if (dt.Rows.Count == 0)
        {
            p = 0;
        }
        else
        {
       p = Convert.ToDouble( dt.Rows[0]["price"]);
        }



        if (HttpContext.Current.Profile.ZartShopping.Items.Count == 0)
        {

            Repeater1.Visible = false;
            int i = Convert.ToInt32(HttpContext.Current.Profile.ZartShopping.Items.Count);

            if (i == 0)
            {
                Literal1.Text = "0";
            }
            else
            {
                Literal1.Text = i.ToString();
            }
            Literal3.Text = HttpContext.Current.Profile.ZartShopping.Total.ToString();
            Literal3.Text = HttpContext.Current.Profile.ZartShopping.Total.ToString();

            if (Convert.ToDouble(Literal3.Text) > p)
            {
                Literal2.Visible = true;
            }
            else
            {
                Literal2.Visible = false;
            }

        }
        else
        {
            Repeater1.Visible = true;
            int i = Convert.ToInt32(Profile.ZartShopping.Items.Count);

            if (i == 0)
            {
                Literal1.Text = "0";
            }
            else
            {
                Literal1.Text = i.ToString();
            }



             Repeater1.DataSource = Profile.ZartShopping.Items;
        Repeater1.DataBind();

       

        Literal3.Text = Profile.ZartShopping.Total.ToString();

        if (Convert.ToDouble(Literal3.Text) > p)
        {
            Literal2.Visible = true;
        }
        else
        {
            Literal2.Visible = false;
        }
        }


       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("shipping-address.aspx");
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        MessageBox msg = new MessageBox();
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


            //System.Web.UI.Page page = (System.Web.UI.Page)this.Page;
            //user u = (user)page.Master;
            //u.total();

            ((user)this.Page.Master).total();

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
               
            }


          


        }

            items();
          
    }
}
