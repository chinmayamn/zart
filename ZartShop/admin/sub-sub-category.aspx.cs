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
public partial class admin_sub_sub_category : System.Web.UI.Page
{
    Category category = new Category();
    protected void Page_Load(object sender, EventArgs e)
    {
        Button6.Visible = false;
        Button5.Visible = true;
        Label4.Visible = false;
        if (!Page.IsPostBack)
        {

            Button6.Visible = false;
            Label4.Visible = false;
            Button5.Visible = true;
            filldropdown();
            fillgrid2();
            if (Request.QueryString["ssid"] != null)
            {
                edit2();
                Button5.Visible = false;
                Button6.Visible = true;

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


            DropDownList3.DataSource = ds;
            DropDownList3.DataTextField = ds.Columns["category"].ToString();
            DropDownList3.DataValueField = ds.Columns["id"].ToString();
            DropDownList3.DataBind();
            DropDownList3.Items.Insert(0, "Select");
        }
    }
    public void fillgrid2()
    {
        
        DataTable dt = category.getsubsubcategory();
        if (dt.Rows.Count == 0)
        {

            Label4.Visible = true;
            Label4.Text = "No sub-sub-category added till now";
            GridView3.Visible = false;
        }
        else
        {
            Label4.Visible = false;
            GridView3.Visible = true;
            GridView3.DataSource = dt;
            GridView3.DataBind();
        }

    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        
        MessageBox msg = new MessageBox();
        category.createsubcategory(DropDownList2.SelectedItem.Value.ToString(), TextBox3.Text);
        msg.Show("Sub-Sub-category created successfully");
        TextBox3.Text = "";
        fillgrid2();
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        
        MessageBox msg = new MessageBox();
        int id = Convert.ToInt32(Request.QueryString["ssid"]);


        category.updatesubcategory(id.ToString(), DropDownList2.SelectedItem.Value, TextBox3.Text);
        Response.Write("<script type=text/javascript>window.alert('Sub-sub-category updated successfully');window.location='sub-sub-category.aspx';</script>");
    }
    protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView3.PageIndex = e.NewPageIndex;
        fillgrid2();
    }
    protected void GridView3_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int d = Convert.ToInt32(GridView3.DataKeys[e.RowIndex].Value);

        
        MessageBox msg = new MessageBox();

        DataTable ds = category.checksubcategory(d);
        if (ds.Rows.Count == 0)
        {

            category.deletecategory(d);

            msg.Show("Category deleted successfully");
       
            Button5.Visible = true;
            Button6.Visible = false;
            fillgrid2();
        }
        else
        {
            msg.Show("Delete subcategories first");
        }
    }
    public void edit2()
    {
        
        MessageBox msg = new MessageBox();


        int id = Convert.ToInt32(Request.QueryString["ssid"].ToString());

        DataTable ds = category.getsubsubcategorybyid(id);
        TextBox3.Text = ds.Rows[0]["category"].ToString();

        string cid = ds.Rows[0]["id2"].ToString();
        for (int i = 0; i < DropDownList3.Items.Count; i++)
        {

            if (DropDownList3.Items[i].Value == cid)
            {
                DropDownList3.Items[i].Selected = true;
            }
        }


        DataTable dt = category.getsubcategorybycategory(Convert.ToInt32(cid));
        if (dt.Rows.Count == 0)
        {
        }
        else
        {

            DropDownList2.DataSource = dt;
            DropDownList2.DataTextField = dt.Columns["category"].ToString();
            DropDownList2.DataValueField = dt.Columns["id"].ToString();
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, "Select");
        }

        string sid = ds.Rows[0]["id1"].ToString();

        for (int j = 0; j < DropDownList2.Items.Count; j++)
        {

            if (DropDownList2.Items[j].Value == sid)
            {
                DropDownList2.Items[j].Selected = true;
            }
        }

    }

    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        MessageBox msg = new MessageBox();
        
        if (DropDownList3.SelectedItem.Text == "Select")
        {
            msg.Show("Select Category");
        }


        else
        {
            DataTable dt = category.getsubcategorybycategory(Convert.ToInt32(DropDownList3.SelectedItem.Value));
            if (dt.Rows.Count == 0)
            {
            }
            else
            {

                DropDownList2.DataSource = dt;
                DropDownList2.DataTextField = dt.Columns["category"].ToString();
                DropDownList2.DataValueField = dt.Columns["id"].ToString();
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, "Select");
            }


        }
    }
}
