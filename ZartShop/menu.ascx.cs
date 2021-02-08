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
public partial class menu : System.Web.UI.UserControl
{
    Category category = new Category();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            filldropmenu();
            filltopmenu();
        }

    }
    public void filldropmenu()
    {
        
        DataTable dt = category.fillcategory();
        if (dt.Rows.Count == 0)
        {
        }
        else
        {
            Repeater23.DataSource = dt;

            Repeater23.DataBind();
            foreach (DataListItem Item in Repeater23.Items)
            {
                bindnested(Item.ItemIndex);
            }

        }
    }
    public void filltopmenu()
    {
        admin ad = new admin();
        DataTable dt = ad.fillrightcategory();
        if (dt.Rows.Count == 0)
        {
        }
        else
        {
            Repeater3.DataSource = dt;

            Repeater3.DataBind();
            foreach (DataListItem Item in Repeater3.Items)
            {
                bindnested1(Item.ItemIndex);
            }

        }
    }
    public void bindnested(int itemindex)
    {
        int z = itemindex;
        int id = Convert.ToInt32(Repeater23.DataKeys[itemindex]);
        
        DataTable dt = category.fillsubcategory(id);
        DataList nesteddatalist = (DataList)Repeater23.Items[itemindex].FindControl("Repeater2");
        nesteddatalist.DataSource = dt;
        nesteddatalist.DataBind();
        foreach (DataListItem Item in nesteddatalist.Items)
        {
            bindnested2(z,Item.ItemIndex);
        }

    }
    public void bindnested1(int itemindex)
    {
        int z = itemindex;
        int id = Convert.ToInt32(Repeater3.DataKeys[itemindex]);
        
        DataTable dt = category.fillsubcategory(id);
        DataList nesteddatalist = (DataList)Repeater3.Items[itemindex].FindControl("Repeater4");
        nesteddatalist.DataSource = dt;
        nesteddatalist.DataBind();
        foreach (DataListItem Item in nesteddatalist.Items)
        {
            bindnested3(z, Item.ItemIndex);
        }
    }
    public void bindnested2(int m,int itemindex)
    {
        DataList nesteddatalist = (DataList)Repeater23.Items[m].FindControl("Repeater2");
   DataList nesteddatalist1 = (DataList)nesteddatalist.Items[itemindex].FindControl("Repeater5");

        int z = itemindex;
        int id = Convert.ToInt32(nesteddatalist.DataKeys[itemindex]);
       
        DataTable dt = category.fillsubcategory(id);
     
        nesteddatalist1.DataSource = dt;
        nesteddatalist1.DataBind();
    }
    public void bindnested3(int m, int itemindex)
    {
        DataList nesteddatalist = (DataList)Repeater3.Items[m].FindControl("Repeater4");
        DataList nesteddatalist1 = (DataList)nesteddatalist.Items[itemindex].FindControl("Repeater6");

        int z = itemindex;
        int id = Convert.ToInt32(nesteddatalist.DataKeys[itemindex]);
      
        DataTable dt = category.fillsubcategory(id);

        nesteddatalist1.DataSource = dt;
        nesteddatalist1.DataBind();
    }
}
