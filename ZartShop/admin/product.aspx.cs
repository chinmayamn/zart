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
public partial class admin_product : System.Web.UI.Page
{
    Filter filter = new Filter();
    Products product = new Products();
    Category category = new Category();
    protected void Page_Load(object sender, EventArgs e)
    {
      



        if (!Page.IsPostBack)
        { Button1.Visible = true;
        Button2.Visible = false;
        Image1.Visible = false;

            fillcategory();
            DropDownList2.Items.Insert(0, "Select");
            DropDownList3.Items.Insert(0, "Select");
            brands();
            colorfilter();
            sizefilter();

            if (Request.QueryString["id"] != null)
            {
                edit();
                Button2.Visible = true;
                Button1.Visible = false;
                Image1.Visible = true;
            }
        }
    }
    public void sizefilter()
    {
       
        MessageBox msg = new MessageBox();
        DataTable ds = filter.fillfilterbytype("size");
        if (ds.Rows.Count == 0)
        {

        }
        else
        {
            CheckBoxList2.DataSource = ds;

            CheckBoxList2.DataTextField = ds.Columns["filtervalue"].ToString();
            CheckBoxList2.DataValueField = ds.Columns["id"].ToString();
            CheckBoxList2.DataBind();

        }
    }


    public void colorfilter()
    {
        
        MessageBox msg = new MessageBox();
        DataTable ds = filter.fillfilterbytype("color");
        if (ds.Rows.Count == 0)
        {
            
        }
        else
        {
            CheckBoxList1.DataSource = ds;

            CheckBoxList1.DataTextField = ds.Columns["filtervalue"].ToString();
            CheckBoxList1.DataValueField = ds.Columns["id"].ToString();
            CheckBoxList1.DataBind();
      
        }
    }
    public void brands()
    {
        Brands ad = new Brands();
        MessageBox msg = new MessageBox();
        DataTable ds = ad.fillbrands();
        if (ds.Rows.Count == 0)
        {
            DropDownList5.Items.Clear();
            DropDownList5.Items.Insert(0, "Select");
        }
        else
        {
            DropDownList5.DataSource = ds;
            DropDownList5.DataTextField = ds.Columns["bname"].ToString();
            DropDownList5.DataValueField = ds.Columns["id"].ToString();
            DropDownList5.DataBind();
            DropDownList5.Items.Insert(0, "Select");
        }
    }
    public void fillcategory()
    {
        
        DataTable dt = category.fillcategory();
        if (dt.Rows.Count == 0)
        {
        }
        else
        {
            DropDownList1.DataSource = dt;
            DropDownList1.DataTextField = dt.Columns["category"].ToString();
            DropDownList1.DataValueField = dt.Columns["id"].ToString();
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "Select");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        admin ad = new admin();
        MessageBox msg = new MessageBox();
        string UniqueName = (DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString());
        string ImageFile1 = Label1.Text;

        string color = string.Empty;
        string size = string.Empty;

        for (int i = 0; i < CheckBoxList1.Items.Count; i++)
        {
            if (CheckBoxList1.Items[i].Selected == true)
            {
                color = color + CheckBoxList1.Items[i].Value.ToString() + ",";
            }

        }


        for (int j = 0; j < CheckBoxList2.Items.Count; j++)
        {
            if (CheckBoxList2.Items[j].Selected == true)
            {
                size = size + CheckBoxList2.Items[j].Value.ToString() + ",";
            }

        }


        if (DropDownList1.SelectedItem.Text == "Select")
        {
            msg.Show("Select category");
        }
        else
        {
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

                  

                }
                else
                {
                    msg.Show("Upload proper image file");
                }

            }

            string subcati = string.Empty;

            if (DropDownList2.SelectedItem.Text == "Select")
            {
                subcati = " ";
            }
            else
            {
                subcati = DropDownList2.SelectedItem.Value.ToString();
            }
            string subsubcati = string.Empty;
            if (DropDownList3.SelectedItem.Text == "Select")
            {
                subsubcati = " ";
            }
            else
            {
                subsubcati = DropDownList3.SelectedItem.Value.ToString();
            }

            int a, b, c, d;
            if (CheckBox1.Checked == true)
            {
                a = 1;
            }
            else
            {
                a = 0;
            }

            if (CheckBox2.Checked == true)
            {
                b = 1;
            }
            else
            {
                b = 0;
            }

            if (CheckBox3.Checked == true)
            {
                c = 1;
            }
            else
            {
                c = 0;
            }

            if (CheckBox4.Checked == true)
            {
                d = 1;
            }
            else
            {
                d = 0;
            }

          product.updateproduct(Convert.ToInt32(Request.QueryString["id"]),DropDownList1.SelectedItem.Value.ToString(), subcati,subsubcati, TextBox1.Text, ImageFile1, TextBox2.Text, TextBox3.Text, TextBox4.Text, DropDownList4.SelectedItem.Text.ToString(), DropDownList5.SelectedItem.Value.ToString(), TextBox5.Text, TextBox6.Text, Server.HtmlEncode(FCKeditor1.Value), Server.HtmlEncode(FCKeditor2.Value), DropDownList6.SelectedItem.Text.ToString(), color, size,a ,b, c, d,TextBox8.Text);
          Response.Write("<script type=text/javascript>window.alert('Product updated successfully');window.location='view-product.aspx';</script>");


        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        admin ad = new admin();
        MessageBox msg = new MessageBox();
        string UniqueName = (DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString());
        string ImageFile1 = string.Empty;

        string color = string.Empty;
        string size = string.Empty;

        for (int i = 0; i < CheckBoxList1.Items.Count; i++)
        {
            if (CheckBoxList1.Items[i].Selected == true)
            {
                color = color + CheckBoxList1.Items[i].Value.ToString()+  ",";
            }

        }


        for (int j = 0; j < CheckBoxList2.Items.Count; j++)
        {
            if (CheckBoxList2.Items[j].Selected == true)
            {
                size = size + CheckBoxList2.Items[j].Value.ToString() + ",";
            }

        }

        string subcati=string.Empty;

        if (DropDownList2.SelectedItem.Text == "Select")
        {
            subcati = " ";
        }
        else
        {
            subcati = DropDownList2.SelectedItem.Value.ToString();
        }
        string subsubcati=string.Empty;
          if (DropDownList3.SelectedItem.Text == "Select")
        {
           subsubcati = " ";
        }
        else
        {
            subsubcati = DropDownList3.SelectedItem.Value.ToString();
        }


          int a, b, c, d;
          if (CheckBox1.Checked == true)
          {
              a = 1;
          }
          else
          {
              a = 0;
          }

          if (CheckBox2.Checked == true)
          {
              b = 1;
          }
          else
          {
              b = 0;
          }

          if (CheckBox3.Checked == true)
          {
              c = 1;
          }
          else
          {
              c = 0;
          }

          if (CheckBox4.Checked == true)
          {
              d = 1;
          }
          else
          {
              d = 0;
          }

        if(DropDownList1.SelectedItem.Text=="Select")
        {
            msg.Show("Select category");
        }
        else
        {
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


               
                product.addproduct(DropDownList1.SelectedItem.Value.ToString(), subcati,  subsubcati,TextBox1.Text, ImageFile1, TextBox2.Text, TextBox3.Text, TextBox4.Text,DropDownList4.SelectedItem.Text.ToString(), DropDownList5.SelectedItem.Value.ToString(), TextBox5.Text, TextBox6.Text, Server.HtmlEncode(FCKeditor1.Value), Server.HtmlEncode(FCKeditor2.Value), DropDownList6.SelectedItem.Text.ToString(), color, size ,a , b, c, d, TextBox8.Text);
                msg.Show("Product added successfully");
              

            }
            else
            {
                msg.Show("Upload proper image file");
            }

        }
        else
        {
            msg.Show("Product image required");
        }
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        MessageBox msg = new MessageBox();
        if (DropDownList1.SelectedItem.Text == "Select")
        {
            msg.Show("Select category");
        }
        else
        {
            DataTable dt = category.getsubcategorybycategory(Convert.ToInt32(DropDownList1.SelectedItem.Value));
            if (dt.Rows.Count == 0)
            {
                DropDownList2.Items.Clear();
                DropDownList2.Items.Insert(0, "Select");
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
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        if (DropDownList2.SelectedItem.Text == "Select")
        {
        }
        else
        {
            DataTable dt = category.getsubsubcategorybysubcategory(Convert.ToInt32(DropDownList2.SelectedItem.Value));
            if (dt.Rows.Count == 0)
            {
                DropDownList3.Items.Clear();
                DropDownList3.Items.Insert(0, "Select");
            }
            else
            {
                DropDownList3.DataSource = dt;
                DropDownList3.DataTextField = dt.Columns["category"].ToString();
                DropDownList3.DataValueField = dt.Columns["id"].ToString();
                DropDownList3.DataBind();
                DropDownList3.Items.Insert(0, "Select");
            }
        }
    }

    public void edit()
    {
        admin ad = new admin();
        int id = Convert.ToInt32(Request.QueryString["id"]);
        DataTable dt = ad.getproductsbyid(id);
        TextBox1.Text = dt.Rows[0]["pname"].ToString();
        TextBox2.Text = dt.Rows[0]["mrp"].ToString();
        TextBox3.Text = dt.Rows[0]["actual"].ToString();
        TextBox4.Text = dt.Rows[0]["discount"].ToString();
        string avail = dt.Rows[0]["availability"].ToString();

        for (int i = 0; i < DropDownList4.Items.Count; i++)
        {
            if (DropDownList4.Items[i].Text == avail)
            {
                DropDownList4.Items[i].Selected = true;
            }
        }

        TextBox5.Text = dt.Rows[0]["stext"].ToString();

        string brand = dt.Rows[0]["brand"].ToString();

        string aa = dt.Rows[0]["newarrival"].ToString();
        string ba = dt.Rows[0]["entertainment"].ToString();
        string ca = dt.Rows[0]["hotoffers"].ToString();
        string da = dt.Rows[0]["exclusive"].ToString();

        if (aa == "1")
        {
            CheckBox1.Checked = true;
        }
        else
        {
            CheckBox1.Checked = false;
        }
        if (ba == "1")
        {
            CheckBox2.Checked = true;
        }
        else
        {
            CheckBox2.Checked = false;
        }
        if (ca == "1")
        {
            CheckBox3.Checked = true;
        }
        else
        {
            CheckBox3.Checked = false;
        }
        if (da == "1")
        {
            CheckBox4.Checked = true;
        }
        else
        {
            CheckBox4.Checked = false;
        }

        for (int a = 0; a < DropDownList5.Items.Count; a++)
        {
            if (DropDownList5.Items[a].Value == brand)
            {
                DropDownList5.Items[a].Selected = true;
            }
        }


        TextBox6.Text = dt.Rows[0]["video"].ToString();

        FCKeditor1.Value = Server.HtmlDecode(dt.Rows[0]["reviews"].ToString());
        FCKeditor2.Value = Server.HtmlDecode(dt.Rows[0]["details"].ToString());

        string rating = dt.Rows[0]["rating"].ToString();

        for (int z = 0; z < DropDownList6.Items.Count; z++)
        {
            if (DropDownList6.Items[z].Value == rating)
            {
                DropDownList6.Items[z].Selected = true;
            }
            
            }

        string color = dt.Rows[0]["color"].ToString();
        string size = dt.Rows[0]["size"].ToString();

        string[] temp1 = color.Split(',');
        string[] temp2 = size.Split(',');

        int t1=temp1.Count();
        int t2=temp2.Count();

        for (int zz = 0; zz < t1; zz++)
        {
                  for (int b = 0; b < CheckBoxList1.Items.Count; b++)
                {
                    if (CheckBoxList1.Items[b].Value == temp1[zz])
                    {
                        CheckBoxList1.Items[b].Selected = true;
                    }
                }

         }

        for (int yy = 0; yy < t2; yy++)
        {
            for (int c = 0; c < CheckBoxList2.Items.Count; c++)
            {
                if (CheckBoxList2.Items[c].Value == temp2[yy])
                {
                    CheckBoxList2.Items[c].Selected = true;
                }
            }
        }
        string cid = dt.Rows[0]["cid"].ToString();
        for (int cc = 0; cc < DropDownList1.Items.Count; cc++)
        {
            if (DropDownList1.Items[cc].Value == cid)
            {
                DropDownList1.Items[cc].Selected = true;
            }
        }

        Image1.ImageUrl = dt.Rows[0]["image"].ToString();
        Label1.Text = dt.Rows[0]["image"].ToString();

    
        TextBox8.Text = dt.Rows[0]["tax"].ToString();
            
    }
   
}
