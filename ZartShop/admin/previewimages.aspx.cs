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
public partial class admin_previewimages : System.Web.UI.Page
{
    Products product = new Products();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            int id = Convert.ToInt32(Request.QueryString["id"]);
            fillgrid(id);
        }

    }
    public void fillgrid(int id)
    {
        

        DataTable dt = product.getproductpreview(id);
        if (dt.Rows.Count == 0)
        {
            GridView1.Visible = false;
            Label1.Visible = true;
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
        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        

        product.deleteproductpreview(id);
        MessageBox msg = new MessageBox();
        msg.Show("Product preview image deleted successfully");
        int id1 = Convert.ToInt32(Request.QueryString["id"]);
        fillgrid(id1);
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        GridView1.PageIndex = e.NewPageIndex;
        int id1 = Convert.ToInt32(Request.QueryString["id"]);

        fillgrid(id1);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        MessageBox msg = new MessageBox();
        string UniqueName = (DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString());
        string ImageFile1 = string.Empty;
        int id = Convert.ToInt32(Request.QueryString["id"]);

        if (FileUpload1.PostedFile.ContentLength > 0)
        {
            string temp1 = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
            if (temp1 == ".jpeg" || temp1 == ".JPEG" || temp1 == ".jpg" || temp1 == ".JPG" || temp1 == ".png" || temp1 == ".PNG" || temp1 == ".bmp" || temp1 == ".BMP" || temp1 == ".gif" || temp1 == ".GIF" || temp1 == ".wmf" || temp1 == ".WMF")
            {
                string z1;
                string x1 = Server.MapPath("~\\uploads") + "\\";
                string s1 = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                string[] words = s1.Split('.');
                z1 = x1 + UniqueName + s1;//file extension
                FileUpload1.PostedFile.SaveAs(z1);
                string urldet1 = "~\\" + "uploads" + "\\" + UniqueName + s1;
                ImageFile1 = urldet1.Replace("\\", "/");

                product.addproductpreview(ImageFile1,id);
                msg.Show("Product preview image added successfully");
                fillgrid(id);
            

            }
            else
            {
                msg.Show("Upload proper image file");
            }

        }
        else
        {
            msg.Show("Product preview image required");
        }

    }
}
