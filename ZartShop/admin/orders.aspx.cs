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
public partial class admin_orders : System.Web.UI.Page
{
    public int pgnum
    {
        get
        {
            if (ViewState["pgnum"] != null)
                return Convert.ToInt32(ViewState["pgnum"]);
            else
                return 0;
        }
        set
        {
            ViewState["pgnum"] = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            fillgrid();
        }
    }
    public void fillgrid()
    {
        revieworder or=new revieworder();

        DataTable dt = or.fillorder();
        if (dt.Rows.Count == 0)
        {
            Label1.Visible = true;
            Repeater1.Visible = false; LinkButton1.Visible = false;
            LinkButton2.Visible = false;
        }
        else
        {
            Label1.Visible = false;
            Repeater1.Visible = true;
            int cnt = dt.Rows.Count;
            Literal1.Text = Convert.ToString(cnt);
            PagedDataSource pageddata = new PagedDataSource();
            pageddata.DataSource = dt.DefaultView;
            pageddata.AllowPaging = true;
            pageddata.PageSize = 3;
            pageddata.CurrentPageIndex = pgnum;
            Literal2.Text = Convert.ToString(pageddata.PageSize);
            Literal3.Text = Convert.ToString(pgnum + 1);
            int vcnt = cnt / pageddata.PageSize;
            Literal4.Text = Convert.ToString(vcnt + 1);
            if (pgnum < 1)
                LinkButton1.Visible = false;
            else if (pgnum > 0)
                LinkButton1.Visible = true;
            if (pgnum == vcnt)
                LinkButton2.Visible = false;
            else
                if (pgnum <= vcnt)
                    LinkButton2.Visible = true;
            Repeater1.DataSource = pageddata;
            Repeater1.DataBind();

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        pgnum -= 1;
        fillgrid();
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        pgnum += 1;
        fillgrid();
    }
}
