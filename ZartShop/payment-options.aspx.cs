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
public partial class payment_options : System.Web.UI.Page
{
    admin ad = new admin();
    PaymentGateway pgway = new PaymentGateway();
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
                   paymentgateway();

                LinkButton1.Visible = true;
                LinkButton2.Visible = false;
                e_mail.Visible = false;
            }
        }

    }
    public void paymentgateway()
    {
      
        DataTable dt = pgway.getpaymentgateway();
        if (dt.Rows.Count == 0)
        {
          
           
           
           
           
        }
        else
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                int a = Convert.ToInt32(dt.Rows[0][0]);
                int b = Convert.ToInt32(dt.Rows[0][1]);
                int c = Convert.ToInt32(dt.Rows[0][2]);
                int d = Convert.ToInt32(dt.Rows[0][3]);
                int e = Convert.ToInt32(dt.Rows[0][4]);

                if (a == 1)
                {
                    a1.Visible = true; tab2.Visible = true;

                }
                else
                {
                    a1.Visible = false; tab2.Visible = false;

                } 

                if (b == 1)
                {
                    a2.Visible = true; tab3.Visible = true;

                }
                else
                {
                    a2.Visible = false;  tab3.Visible = false;
                }

                if (c == 1)
                {
                    a3.Visible = true; tab4.Visible = true;

                }
                else
                {
                    a3.Visible = false;tab4.Visible = false;
                }

                if (d == 1)
                {
                    a4.Visible = true; tab5.Visible = true;

                }
                else
                {
                    a4.Visible = false; tab5.Visible = false;
                }

                if (e == 1)
                {
                    a5.Visible = true; tab6.Visible = true;

                }
                else
                {
                    a5.Visible = false; tab6.Visible = false;
                }




            }
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
            Label4.Text= Label5.Text = dt.Rows[0]["name"].ToString() + "<br>" + dt.Rows[0]["address"].ToString() + "<br>" + "( " + dt.Rows[0]["landmark"].ToString() + " )" + "<br>" + dt.Rows[0]["city"].ToString() + " - " + dt.Rows[0]["postal"].ToString() + "<br>" + dt.Rows[0]["state"].ToString() + "<br>" + dt.Rows[0]["country"].ToString() + "<br>" + dt.Rows[0]["mobile"].ToString() + "<br>" + dt.Rows[0]["email"].ToString();
        }

        Label1.Text = Profile.ZartShopping.Total.ToString();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Label4.Visible = false;
        e_mail.Visible = true;
        LinkButton1.Visible = false;
        LinkButton2.Visible = true;
        MembershipUser mem = Membership.GetUser();
        string userid = mem.ProviderUserKey.ToString();

        Order or = new Order();
        DataTable dt = or.getorderdet(userid);
        if (dt.Rows.Count == 0)
        {
        }
        else
        {
            TextBox1.Text = dt.Rows[0]["name"].ToString();
            TextBox2.Text = dt.Rows[0]["address"].ToString();
            TextBox3.Text = dt.Rows[0]["landmark"].ToString();
            TextBox4.Text = dt.Rows[0]["city"].ToString();
            Label6.Text = dt.Rows[0]["id"].ToString();
            string st = dt.Rows[0]["state"].ToString();

            //for (int i = 0; i < DropDownList1.Items.Count; i++)
            //{
            //    if (DropDownList1.Items[i].Text.ToString() == st)
            //    {
            //        DropDownList1.Items[i].Selected = true;
            //    }
            //}
            TextBox5.Text = dt.Rows[0]["postal"].ToString();
            TextBox6.Text = dt.Rows[0]["mobile"].ToString();
            TextBox7.Text = dt.Rows[0]["email"].ToString();
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
       
        Order or = new Order();
        MembershipUser mem = Membership.GetUser();
        string userid = mem.ProviderUserKey.ToString();
        or.Updateorder(Label6.Text, userid, TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, DropDownList1.SelectedItem.Text.ToString(), TextBox5.Text, TextBox6.Text, "India", TextBox7.Text);

        getdata();
        Label4.Visible = true;
        
        e_mail.Visible = false;
        LinkButton1.Visible = true;
        LinkButton2.Visible = false;
    
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MembershipUser memb = Membership.GetUser(Profile.UserName);
        string userid = "";
        try
        {
            userid = memb.ProviderUserKey.ToString();
        }
        catch (Exception ex)
        {
            Response.Redirect("Login.aspx");
        }
        Order or = new Order();
        MembershipUser mem = Membership.GetUser();
      
           DataTable dt = or.getorderdet(userid);
           if (dt.Rows.Count == 0)
           {
           }
           else
           {
               string orderid = dt.Rows[0]["id"].ToString();
               foreach ( CartItem item in Profile.ZartShopping.Items)
               {

                   or.Insertproduct_order(orderid, item.ProductId.ToString(), item.ProductName.ToString(), item.ProductImageUrl.ToString(),item.quantity.ToString(), item.discount.ToString(), item.Linetotal.ToString(),item.Color.ToString(),item.Size.ToString(),item.price.ToString(),item.Brand.ToString(), "2", item.Tax.ToString());
               }
           }


           double amt = Convert.ToDouble(Label1.Text);
           string email =dt.Rows[0]["email"].ToString();
           string name = dt.Rows[0]["name"].ToString();
           string account = dt.Rows[0]["id"].ToString();
           string responseURL = RedirectToPaypal.getItemNameAndCost(amt, email, name, account);
        
           Response.Redirect(responseURL);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void Button3_Click(object sender, EventArgs e)
    {

    }
}
