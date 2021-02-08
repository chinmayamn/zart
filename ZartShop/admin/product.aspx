<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" Inherits="admin_product"  Codebehind="product.aspx.cs" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<ul class="navigation">
            	<li><a href="#"><img src="images/home.gif" width="13" alt="" /></a></li>
                <li><b>Manage Products</b></li>
            </ul>	
            
            <div class="right-nav">
        	<div class="in-right">
            	             <div class="top-head">
                	<a href="product.aspx" class="select">Add Product</a>
                    <a href="view-product.aspx" >View Product</a>
                   
                </div>
                
                   
                <div class="cont" >


<br /><br /><br /><br />


<table>
<tr>
    <td width="200" >
        Category:
    </td>
    <td>
        <asp:DropDownList ID="DropDownList1" runat="server" ValidationGroup="v1" 
            AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ErrorMessage="Select category" ControlToValidate="DropDownList1" InitialValue="Select" 
            ValidationGroup="v1">*</asp:RequiredFieldValidator>
   
        Sub-Category:
   
       <asp:DropDownList ID="DropDownList2" runat="server" ValidationGroup="v1" 
            AutoPostBack="True" onselectedindexchanged="DropDownList2_SelectedIndexChanged">
        </asp:DropDownList>
  
        Sub-Sub-Category:
    
       <asp:DropDownList ID="DropDownList3" runat="server" ValidationGroup="v1">
        </asp:DropDownList>
    
    </td>
   
</tr>
<tr>
    <td>
       Name:
    </td>
    <td>
    <asp:TextBox ID="TextBox1" runat="server" ValidationGroup="v1"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ErrorMessage="Product name required" ControlToValidate="TextBox1" 
            ValidationGroup="v1">*</asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
    <td>
        Image:
    </td>
    <td>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Image ID="Image1" runat="server" Width="100" />
        
        <asp:Label ID="Label1" runat="server"  Visible=false></asp:Label>
    </td>
</tr>
<tr>
    <td>
        MRP:
    </td>
    <td>
      <asp:TextBox ID="TextBox2" runat="server" ValidationGroup="v1"></asp:TextBox>
    
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ErrorMessage="MRP required" ControlToValidate="TextBox2" ValidationGroup="v1">*</asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
    <td>
        Actual:
    </td>
    <td>
      <asp:TextBox ID="TextBox3" runat="server" ValidationGroup="v1"></asp:TextBox>
    
       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ErrorMessage="Actual price required" ControlToValidate="TextBox3" ValidationGroup="v1">*</asp:RequiredFieldValidator>

    </td>
</tr>
<tr>
    <td>
        Discount:
    </td>
    <td>
      <asp:TextBox ID="TextBox4" runat="server" ValidationGroup="v1"></asp:TextBox>
        </td>
</tr>
<tr>
    <td>
        Availability:
    </td>
    <td>
    
        <asp:DropDownList ID="DropDownList4" runat="server" ValidationGroup="v1">
        <asp:ListItem Text="Yes"></asp:ListItem>
        <asp:ListItem Text="No"></asp:ListItem>
        </asp:DropDownList>
    
    </td>
</tr>
<tr>
    <td>
        Brand:
    </td>
    <td>
       <asp:DropDownList ID="DropDownList5" runat="server" ValidationGroup="v1">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
            ErrorMessage="Select brand" ControlToValidate="DropDownList5" 
            InitialValue="Select" ValidationGroup="v1">*</asp:RequiredFieldValidator>
    
    </td>
</tr>
<tr>
    <td valign="top">
        Intro Text:
    </td>
    <td>
      <asp:TextBox ID="TextBox5" runat="server" ValidationGroup="v1" Columns="40" 
            Rows="6" TextMode="MultiLine"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
            ErrorMessage="Intro text required" ControlToValidate="TextBox5" 
            ValidationGroup="v1">*</asp:RequiredFieldValidator>
        
    </td>
</tr>
<tr>
    <td>
        Video:
    </td>
    <td>
      <asp:TextBox ID="TextBox6" runat="server" ValidationGroup="v1"></asp:TextBox>
    
    
    </td>
</tr>
<tr>
    <td>
        Reviews:
    </td>
    <td>
        <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Width=700 BasePath="~/fckeditor/" 
                Height="400px"> </FCKeditorV2:FCKeditor>
    
    </td>
</tr>
<tr>
    <td>
        Details:
    </td>
    <td>
    
        <FCKeditorV2:FCKeditor ID="FCKeditor2" runat="server" Width=700 BasePath="~/fckeditor/" 
                Height="400px"> </FCKeditorV2:FCKeditor>
    </td>
</tr>
<tr>
<td>
Rating:
</td>
<td>
    <asp:DropDownList ID="DropDownList6" runat="server">
    <asp:ListItem  Text="Select"></asp:ListItem>
     <asp:ListItem  Text="1"></asp:ListItem>
      <asp:ListItem  Text="2"></asp:ListItem>
       <asp:ListItem  Text="3"></asp:ListItem>
        <asp:ListItem  Text="4"></asp:ListItem>
         <asp:ListItem  Text="5"></asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
        ErrorMessage="Select rating " ControlToValidate="DropDownList6" 
        InitialValue="Select" ValidationGroup="v1">*</asp:RequiredFieldValidator>
</td>
</tr>
<tr>
    <td>
    Colors:
    </td>
    <td>
      
        <asp:CheckBoxList ID="CheckBoxList1" runat="server"  CellPadding="6" CellSpacing="3" RepeatDirection="Horizontal" RepeatColumns="5">
        </asp:CheckBoxList>
    
    </td>
</tr>
<tr>
    <td>
   Size:
    </td>
    <td>
      
        <asp:CheckBoxList ID="CheckBoxList2" runat="server"  CellPadding="6" CellSpacing="3" RepeatDirection="Horizontal" RepeatColumns="5">
        </asp:CheckBoxList>
    
    </td>
</tr>


<tr>
    <td>
    Home Page :
    <Home Page :
    </td>
    <td>
        <asp:CheckBox ID="CheckBox1" runat="server"  Text="New Arrival" />
          <asp:CheckBox ID="CheckBox2" runat="server"  Text="Entertainment Gadgets"/>
            <asp:CheckBox ID="CheckBox3" runat="server"  Text="Hot Offers"/>
              <asp:CheckBox ID="CheckBox4" runat="server" Text="Zart Exclusive" />
        
        
    </td>
</tr>
<%--<tr>
    <td>
    
    </td>
    <td>
        <asp:CheckBox ID="CheckBox5" Text="Get Default Shipping & Tax" runat="server" 
            AutoPostBack="True" oncheckedchanged="CheckBox5_CheckedChanged" />
    </td>
</tr>
<tr>
<td>
  Shipping :  
</td>
    <td>
             <asp:TextBox ID="TextBox7" runat="server" ValidationGroup="v1"></asp:TextBox>
   <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ErrorMessage="Free-Shipping price required" ControlToValidate="TextBox7" 
                        ValidationGroup="v1">*</asp:RequiredFieldValidator>
                        
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="^\d+$" 
                                    ErrorMessage="Invalid price" ControlToValidate="TextBox7" 
                                    ValidationGroup="v1">*</asp:RegularExpressionValidator>
                                    
                               
    </td>
</tr>--%>
<tr>
    <td>
    Tax :
    </td>
    <td>
        <asp:TextBox ID="TextBox8" runat="server" ValidationGroup="v1"></asp:TextBox>
  
  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ErrorMessage="Tax percentage required" ControlToValidate="TextBox8" 
                        ValidationGroup="v1">*</asp:RequiredFieldValidator>
                        
                        <%--   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="^\d+$" 
                                    ErrorMessage="Invalid price" ControlToValidate="TextBox8" 
                                    ValidationGroup="v1">*</asp:RegularExpressionValidator>
                      --%>             
  
    </td>
</tr>
<tr>
    <td>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            ShowMessageBox="True" ShowSummary="False" ValidationGroup="v1" />
    </td>
    <td>
        <asp:Button ID="Button1" runat="server" Text="Add" onclick="Button1_Click"  ValidationGroup="v1"/>
        <asp:Button ID="Button2" runat="server" Text="Update" onclick="Button2_Click" ValidationGroup="v1" />
    </td>
</tr>
</table>



 </div>
                
            </div>
        </div>
</asp:Content>

