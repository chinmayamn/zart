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
public partial class admin_sub_category : System.Web.UI.Page
{
    Category category = new Category();
    protected void Page_Load(object sender, EventArgs e)
    {
        Button4.Visible = false;
        Button3.Visible = true;
        Label2.Visible = false;

        if (!Page.IsPostBack)
        {
            Button4.Visible = false;
            Button3.Visible = true;
            Label2.Visible = false;
            fillgrid1();
            filldropdown();
            if (Request.QueryString["sid"] != null)
            {
                edit1();
                Button3.Visible = false;
                Button4.Visible = true;

            }
        }


    }

    public void filldropdown()
    {
       
        MessageBox msg = new MessageBox();
        DataTable ds = category.fillcategory();
        if (ds.Rows.Count == 0)
        {
        }
        else
        {

            DropDownList1.DataSource = ds;
            DropDownList1.DataTextField = ds.Columns["category"].ToString();
            DropDownList1.DataValueField = ds.Columns["id"].ToString();
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "Select");
            //DropDownList3.DataSource = ds;
            //DropDownList3.DataTextField = ds.Columns["category"].ToString();
            //DropDownList3.DataValueField = ds.Columns["id"].ToString();
            //DropDownList3.DataBind();
            //DropDownList3.Items.Insert(0, "Select");
        }
    }
    public void fillgrid1()
    {
       
        MessageBox msg = new MessageBox();
        DataTable ds = category.fillsubcategory();
        if (ds.Rows.Count == 0)
        {
            Label2.Visible = true;
            Label2.Text = "No sub-category added till now";
            GridView2.Visible = false;
        }
        else
        {
            Label2.Visible = false;
            GridView2.Visible = true;
            GridView2.DataSource = ds;
            GridView2.DataBind();

        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
       
        MessageBox msg = new MessageBox();
        category.createsubcategory(DropDownList1.SelectedItem.Value.ToString(), TextBox2.Text);
        msg.Show("Sub-category created successfully");
        TextBox2.Text = "";
        fillgrid1();

    }
    protected void Button4_Click(object sender, EventArgs e)
    {
       
        MessageBox msg = new MessageBox();
        string id = Convert.ToString(Request.QueryString["sid"]);

        category.updatesubcategory(id, DropDownList1.SelectedItem.Value.ToString(), TextBox2.Text);
        Response.Write("<script type=text/javascript>window.alert('Sub-category updated successfully');window.location='sub-category.aspx';</script>");
    }
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        fillgrid1();
    }
    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int d = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Value);

       
        MessageBox msg = new MessageBox();

        DataTable ds = category.checksubcategory(d);
        if (ds.Rows.Count == 0)
        {

            category.deletecategory(d);

            msg.Show("Sub-Category deleted successfully");
            TextBox2.Text = "";
            Button3.Visible = true;
            Button4.Visible = false;
            fillgrid1();
        }
        else
        {
            msg.Show("Delete subcategories first");
        }
    }
    public void edit1()
    {
       
        MessageBox msg = new MessageBox();


        int id = Convert.ToInt32(Request.QueryString["sid"].ToString());

        DataTable ds = category.getsubcategorybyid(id);
        string t = ds.Rows[0]["parentid"].ToString();
        TextBox2.Text = ds.Rows[0]["category"].ToString();

        for (int i = 0; i < DropDownList1.Items.Count; i++)
        {
            if (DropDownList1.Items[i].Value.ToString() == t)
            {
                DropDownList1.Items[i].Selected = true;
            }

        }

    }
}
