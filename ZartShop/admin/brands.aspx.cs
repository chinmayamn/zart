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
public partial class admin_brands : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
        Button2.Visible = false;
        Button1.Visible = true;
        Image1.Visible = false;
        if (!Page.IsPostBack)
        {
            Button1.Visible = true;
            Button2.Visible = false;
            Label1.Visible = false;
            fillgrid();
            if (Request.QueryString["id"] != null)
            {
                edit();
                Button1.Visible = false;
                Button2.Visible = true;
                Image1.Visible = true;

            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Brands ad = new Brands();
        MessageBox msg = new MessageBox();
        string UniqueName = (DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString());
        string ImageFile1 = string.Empty;

        if (FileUpload1.PostedFile.ContentLength > 0)
        {
            string temp = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
            if (temp == ".jpeg" || temp == ".JPEG" || temp == ".jpg" || temp == ".JPG" || temp == ".png" || temp == ".PNG" || temp == ".bmp" || temp == ".BMP" || temp == ".gif" || temp == ".GIF" || temp == ".wmf" || temp == ".WMF")
            {


                string z;
                string x = Server.MapPath("~\\uploads") + "\\";
                string s = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                string[] words = s.Split('.');
                z = x + UniqueName + s;//file extension
                FileUpload1.PostedFile.SaveAs(z);
                string urldet = "~\\" + "uploads" + "\\" + UniqueName + s;
                ImageFile1 = urldet.Replace("\\", "/");

                ad.addbrand(TextBox1.Text,Server.HtmlEncode(uc1.Value), ImageFile1);
             
                msg.Show("Brand added successfully");
                fillgrid();
                TextBox1.Text = "";
                uc1.Value = "";
            }
            else
            {
                msg.Show("Upload proper image file");
            }


        }
        else
        {
            msg.Show("Brand image required");
        }
       

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Brands ad = new Brands();
        MessageBox msg = new MessageBox();
        string UniqueName = (DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString());
        string ImageFile1 = string.Empty;
        string id = Request.QueryString["id"].ToString();
        if (FileUpload1.PostedFile.ContentLength > 0)
        {
            string temp = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
            if (temp == ".jpeg" || temp == ".JPEG" || temp == ".jpg" || temp == ".JPG" || temp == ".png" || temp == ".PNG" || temp == ".bmp" || temp == ".BMP" || temp == ".gif" || temp == ".GIF" || temp == ".wmf" || temp == ".WMF")
            {


                string z;
                string x = Server.MapPath("~\\uploads") + "\\";
                string s = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
                string[] words = s.Split('.');
                z = x + UniqueName + s;//file extension
                FileUpload1.PostedFile.SaveAs(z);
                string urldet = "~\\" + "uploads" + "\\" + UniqueName + s;
                ImageFile1 = urldet.Replace("\\", "/");

                ad.updatebrand(id,TextBox1.Text, Server.HtmlEncode(uc1.Value), ImageFile1);
             
 Response.Write("<script type=text/javascript>window.alert('Brand updated successfully');window.location='brands.aspx';</script>");

            }
            else
            {
                msg.Show("Upload proper image file");
            }


        }
        else
        {
            ad.updatebrand(id, TextBox1.Text, Server.HtmlEncode(uc1.Value));

            Response.Write("<script type=text/javascript>window.alert('Brand updated successfully');window.location='brands.aspx';</script>");

        }
       



              }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        fillgrid();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int d = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

        Brands ad = new Brands();
        MessageBox msg = new MessageBox();

        DataTable ds = ad.checkproductbrand(d);
        if (ds.Rows.Count == 0)
        {

            ad.deletebrand(d);

            msg.Show("Brand deleted successfully");
         
            fillgrid();
        }
        else
        {
            msg.Show("Delete products under this brand first");
        }
    }
    public void fillgrid()
    {
        Brands ad = new Brands();
        MessageBox msg = new MessageBox();
        DataTable ds = ad.fillbrands();
        if (ds.Rows.Count == 0)
        {
            Label1.Visible = true;
            Label1.Text = "No brands added till now";
            GridView1.Visible = false;
        }
        else
        {
            Label1.Visible = false;
            GridView1.Visible = true;
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
    public void edit()
    {
        Brands ad = new Brands();
        MessageBox msg = new MessageBox();


        int id = Convert.ToInt32(Request.QueryString["id"].ToString());

        DataTable ds = ad.getbrandsbyid(id);
        TextBox1.Text = ds.Rows[0]["bname"].ToString();
        uc1.Value = Server.HtmlDecode(ds.Rows[0]["bdetails"].ToString());
        Image1.ImageUrl = ds.Rows[0]["bimage"].ToString();

    }
}
