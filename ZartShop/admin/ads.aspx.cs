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
public partial class admin_ads : System.Web.UI.Page
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
        Ads ad = new Ads();
        MessageBox msg = new MessageBox();

        DataTable dt = ad.addcount(DropDownList1.SelectedItem.Text);
        if (dt.Rows.Count == 0)
        {
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

                    ad.addads(DropDownList1.SelectedItem.Text.ToString(), ImageFile1, TextBox1.Text);
                    DropDownList1.SelectedIndex = 0;
                    TextBox1.Text = "";
                    msg.Show("Ad added successfully");
                    fillgrid();
                    TextBox1.Text = "";
                    DropDownList1.SelectedIndex = 0;
                }
                else
                {
                    msg.Show("Upload proper image file");
                }


            }
            else
            {
                msg.Show("Ad image required");
            }

        }
        else
        {
            msg.Show("Only one ad per position");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Ads ad = new Ads();
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

                ad.updatead(id, DropDownList1.SelectedItem.Text.ToString(),  ImageFile1, TextBox1.Text);

                Response.Write("<script type=text/javascript>window.alert('Ad updated successfully');window.location='ads.aspx';</script>");

            }
            else
            {
                msg.Show("Upload proper image file");
            }


        }
        else
        {
            ad.updatead(id,DropDownList1.SelectedItem.Text.ToString(), TextBox1.Text);

            Response.Write("<script type=text/javascript>window.alert('Ad updated successfully');window.location='ads.aspx';</script>");

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

        Ads ad = new Ads();
        MessageBox msg = new MessageBox();

      

            ad.deletead(d);

            msg.Show("Ad deleted successfully");

            fillgrid();
      
    }
    public void fillgrid()
    {
        Ads ad = new Ads();
        MessageBox msg = new MessageBox();
        DataTable ds = ad.fillads();
        if (ds.Rows.Count == 0)
        {
            Label1.Visible = true;
         
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
        Ads ad = new Ads();
        MessageBox msg = new MessageBox();


        int id = Convert.ToInt32(Request.QueryString["id"].ToString());

        DataTable ds = ad.getadsbyid(id);
        TextBox1.Text = ds.Rows[0]["link"].ToString();
       string pos = Server.HtmlDecode(ds.Rows[0]["position"].ToString());
        Image1.ImageUrl = ds.Rows[0]["image"].ToString();

        for (int i = 0; i < DropDownList1.Items.Count; i++)
        {
            if (DropDownList1.Items[i].Text == pos)
            {
                DropDownList1.Items[i].Selected = true;
            }
        }


    }
}
