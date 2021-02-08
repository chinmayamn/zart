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
public partial class products : System.Web.UI.Page
{
    Products product = new Products();
    Brands brand = new Brands();
    Category category = new Category();
    admin ad = new admin();
    Filter filter = new Filter();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
          
            if (Request.QueryString["ssid"] != null)
            {
                viewtype.Visible = true;
                Repeater6.Visible = false;
                Repeater4.Visible = false;
                Repeater1.Visible = true;
                Repeater8.Visible = false;

                Repeater5.Visible = false;
                Repeater7.Visible = false;
                Repeater3.Visible = true;
                Repeater9.Visible = false;
                nav1.Visible = true;
                nav2.Visible = true;
                int id = Convert.ToInt32(Request.QueryString["ssid"].ToString());

                
                //product
                DataTable dt = product.getproductbysubsubcategory(id);
                if (dt.Rows.Count == 0)
                {
                }
                else
                {
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                }

                //brands
                DataTable dt1 = ad.brandfilter(id);
                if (dt1.Rows.Count == 0)
                {
                }
                else
                {
                    Repeater2.DataSource = dt1;
                    Repeater2.DataBind();
                }

                //left nav

                //getting cid by ssid
                DataTable dt2 = ad.getcategorydata(id);
                if (dt2.Rows.Count == 0)
                {
                }
                else
                {
                    Literal1.Text = dt2.Rows[0]["category"].ToString();
                    acat.HRef = "products.aspx?cid=" + dt2.Rows[0]["id"].ToString();
                    int cid= Convert.ToInt32( dt2.Rows[0]["id"]);
                    DataTable dt3 = category.getsubcategorybycategory(cid);
                    if (dt3.Rows.Count == 0)
                    {
                    }
                    else
                    {
                        DataList1.DataSource = dt3;
                        DataList1.DataBind();

                        foreach (DataListItem Item in DataList1.Items)
                        {
                            bindnested(Item.ItemIndex);
                        }
                    }
                }
                //navigation


                DataTable dt4 = ad.getnavigation(id);
                if (dt4.Rows.Count == 0)
                {
                }
                else
                {
                    Repeater3.DataSource = dt4;
                    Repeater3.DataBind();
                    Literal2.Text = dt4.Rows[0]["category"].ToString();
                }
            }



            //sub-category
            if (Request.QueryString["sid"] != null)
            {
                int id = Convert.ToInt32(Request.QueryString["sid"].ToString());

                Repeater1.Visible = false;
                Repeater6.Visible = false;
                Repeater4.Visible = false; 
                Repeater8.Visible = true;

                nav1.Visible = false;
                nav2.Visible = false;
                admin ad = new admin();
                //product
                //DataTable dt = ad.getproductbysubcategoryuser(id);

                DataTable dt = ad.getsubsubcategorybysubcategoryuser(id);
                
                if (dt.Rows.Count == 0)
                {
                }
                else
                {

                    Repeater8.DataSource = dt;
                    Repeater8.DataBind();
                }

                 //left nav

                //getting cid by ssid
                DataTable dt2 = ad.getcategorydatabysub(id);
                if (dt2.Rows.Count == 0)
                {
                }
                else
                {
                    Literal1.Text = dt2.Rows[0]["category"].ToString();
                    acat.HRef = "products.aspx?cid=" + dt2.Rows[0]["id"].ToString();
                    int cid = Convert.ToInt32(dt2.Rows[0]["id"]);
                    DataTable dt3 = category.getsubcategorybycategory(cid);
                    if (dt3.Rows.Count == 0)
                    {
                    }
                    else
                    {
                        DataList1.DataSource = dt3;
                        DataList1.DataBind();

                        foreach (DataListItem Item in DataList1.Items)
                        {
                            bindnested(Item.ItemIndex);
                        }
                    }
                }
                //navigation

                DataTable dt4 = ad.getnavigation2(id);
                if (dt4.Rows.Count == 0)
                {
                }
                else
                {
                    Repeater5.Visible = false;
                    Repeater7.Visible = false;
                    Repeater3.Visible = false;
                    Repeater9.Visible = true;
                    Repeater9.DataSource = dt4;
                    Repeater9.DataBind();
                    Literal2.Text = dt4.Rows[0]["category"].ToString();
                }
            }

            //category

            if (Request.QueryString["cid"] != null)
            {

                viewtype.Visible = false;
                nav1.Visible = false;
                nav2.Visible = false;
                Repeater1.Visible = false;
                Repeater4.Visible = true;
                Repeater6.Visible = false;
                Repeater8.Visible = false;
                int id = Convert.ToInt32(Request.QueryString["cid"].ToString());

                

                DataTable dt6 = ad.getsubcategorybycategoryuser(id);

                if (dt6.Rows.Count == 0)
                {
                }
                else
                {
                    Repeater4.DataSource = dt6;
                    Repeater4.DataBind();
                }


                DataTable dt2 = category.getcategorybyid(id);
                if (dt2.Rows.Count == 0)
                {
                }
                else
                {
                    Literal1.Text = dt2.Rows[0]["category"].ToString();
                    acat.HRef = "products.aspx?cid=" + dt2.Rows[0]["id"].ToString();
                    int cid = Convert.ToInt32(dt2.Rows[0]["id"]);
                    DataTable dt3 = category.getsubcategorybycategory(cid);
                    if (dt3.Rows.Count == 0)
                    {
                    }
                    else
                    {
                        DataList1.DataSource = dt3;
                        DataList1.DataBind();

                        foreach (DataListItem Item in DataList1.Items)
                        {
                            bindnested(Item.ItemIndex);
                        }
                    }
                }
                //navigation

                DataTable dt4 = ad.getnavigation1(id);
                if (dt4.Rows.Count == 0)
                {
                }
                else
                {
                    Repeater5.Visible = true;
                    Repeater3.Visible = false;
                    Repeater7.Visible = false;
                    Repeater9.Visible = false;
                    Repeater5.DataSource = dt4;
                    Repeater5.DataBind();
                    Literal2.Text = dt4.Rows[0]["category"].ToString();
                }
            }




            //default values on page


            if (Request.QueryString["cid"] == null && Request.QueryString["sid"] == null && Request.QueryString["ssid"] == null)
            {

                viewtype.Visible = false;
                Repeater1.Visible = false;
                Repeater4.Visible = false;
                Repeater6.Visible = true;
                Repeater8.Visible = false;
                nav1.Visible = false;
                nav2.Visible = false;
                Repeater3.Visible = false;
                Repeater5.Visible = false;
                Repeater7.Visible = true;
                Repeater9.Visible = false;


                
                DataTable dt7 = ad.fillcategoryuser();

                if (dt7.Rows.Count == 0)
                {
                }
                else
                {
                    Repeater6.DataSource = dt7;
                    Repeater6.DataBind();
                }



                Literal1.Text = "Home";
                acat.HRef = "index.aspx";

                DataTable dt8 = category.fillsubcategory();
                if (dt8.Rows.Count == 0)
                {
                }
                else
                {
                    DataList1.DataSource = dt8;
                    DataList1.DataBind();

                    foreach (DataListItem Item in DataList1.Items)
                    {
                        bindnested(Item.ItemIndex);
                    }
                }

                //navigation

                Repeater7.Visible = true;
                Repeater5.Visible = false;
                Repeater3.Visible = false;

                Literal2.Text = "Home";

            }
        }

    }

    public void bindnested(int itemindex)
    {
        int z = itemindex;
        int id = Convert.ToInt32(DataList1.DataKeys[itemindex]);
        
        DataTable dt = ad.getsubsubcategorywithcountbysubcategory(id);
        DataList nesteddatalist = (DataList)DataList1.Items[itemindex].FindControl("DataList2");
        nesteddatalist.DataSource = dt;
        nesteddatalist.DataBind();
      
    }


    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "add")
        {
           
            int id = Convert.ToInt32(e.CommandArgument);
            DataTable dt = product.getproductbyid(id);
            int dis = Convert.ToInt32(dt.Rows[0]["brand"]);
            DataTable dt1 = brand.getbrandsbyid(dis);
            string disa = string.Empty;
            if (dt1.Rows.Count == 0)
            {
            }
            else
            {
                disa = dt.Rows[0]["bname"].ToString();
            }
            Profile.ZartShopping.Insert(id, dt.Rows[0]["pname"].ToString(), dt.Rows[0]["image"].ToString(), 1, Convert.ToDouble(dt.Rows[0]["discount"]), " ", " ", disa, Convert.ToDouble(dt.Rows[0]["actual"]), Convert.ToDouble(dt.Rows[0]["tax"]));
            ((user)this.Page.Master).total();
            MessageBox msg = new MessageBox();
            msg.Show("Product added to cart successfully");
        }
    }
    protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "filter")
        {
            string fid = e.CommandArgument.ToString();

            LinkButton3.Visible = true;
            ViewState["brand"] = fid;

            foreach (RepeaterItem item in Repeater2.Items)

        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                LinkButton ll = (LinkButton)item.FindControl("LinkButton1");
                if (ll.CommandArgument != fid)
                {
                    ll.Visible = false;
                }
            }
            }
        }



    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        LinkButton3.Visible = false;
        foreach (RepeaterItem item in Repeater2.Items)
        {
            
                LinkButton ll = (LinkButton)item.FindControl("LinkButton1");
              
                    ll.Visible = true;
               
           
        }
        ViewState["brand"] = null;
    }
}
