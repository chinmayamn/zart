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
public partial class admin_home_menu : System.Web.UI.Page
{
    Category category = new Category();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            filldata();
        }

    }
    public void filldata()
    {
        admin ad=new admin();
        DataTable dt = category.fillcategory();
        if (dt.Rows.Count == 0)
        {

        }
        else
        {
            CheckBoxList1.DataSource = dt;
            CheckBoxList1.DataTextField = dt.Columns["category"].ToString();
            CheckBoxList1.DataValueField = dt.Columns["id"].ToString();
            CheckBoxList1.DataBind();


            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["visible"].ToString() == "1")
                {
                    CheckBoxList1.Items[i].Selected = true;
                }
                else
                {
                    CheckBoxList1.Items[i].Selected = false;
                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        admin ad = new admin();
        MessageBox msg = new MessageBox();
        int t=0;
        for (int i = 0; i < CheckBoxList1.Items.Count; i++)
        {
            if (CheckBoxList1.Items[i].Selected == true)
            {
                t++;
            }
        }

        if (t > 6)
        {
            msg.Show("Only 6 items allowed");
        }
        else
        {
            for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            {
                if (CheckBoxList1.Items[i].Selected == true)
                {
                    ad.updatecategoryadmin(CheckBoxList1.Items[i].Value.ToString(),"1");
                }
                else
                {
                    ad.updatecategoryadmin(CheckBoxList1.Items[i].Value.ToString(),"-1");
                }
            }
            msg.Show("Category menu for home updated successfully");
        }
    }
    protected void CheckBoxList1_DataBound(object sender, EventArgs e)
    {

    }
}
