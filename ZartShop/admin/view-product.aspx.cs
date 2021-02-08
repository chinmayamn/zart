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
public partial class admin_view_product : System.Web.UI.Page
{
    Category category = new Category();
    Products product = new Products();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            filldata();
        }

    }
    public void filldata()
    {
        
        DataTable dt = product.getproducts();
        if (dt.Rows.Count == 0)
        {
            Label1.Visible = true;
            GridView1.Visible = true;
        }
        else
        {
            Label1.Visible = false;
            GridView1.Visible = true;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        admin ad = new admin();
        MessageBox msg = new MessageBox();
        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        ad.deleteproduct(id);
        msg.Show("Product deleted successfully");
        filldata();

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        filldata();
    }
}
