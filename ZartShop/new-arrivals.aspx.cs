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
public partial class new_arrivals : System.Web.UI.Page
{
    Category category = new Category();
    Products product = new Products();
    Brands brand = new Brands();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            admin ad = new admin();
            DataTable dt = ad.getnewarrivals();
            if (dt.Rows.Count == 0)
            {

            }
            else
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }


            //default values on page


            if (Request.QueryString["cid"] == null && Request.QueryString["sid"] == null && Request.QueryString["ssid"] == null)
            {

               

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

            

                Literal2.Text = "New - Arrivals";

            }
        }
    }

    public void bindnested(int itemindex)
    {
        int z = itemindex;
        int id = Convert.ToInt32(DataList1.DataKeys[itemindex]);
        admin ad = new admin();
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
}
