<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" Inherits="admin_view_product"  Codebehind="view-product.aspx.cs" %>

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
                	<a href="product.aspx" >Add Product</a>
                    <a href="view-product.aspx" class="select" >View Product</a>
                   
                </div>
                
                   
                <div class="cont" align="Center">


<br /><br /><br /><br />
<table cellpadding="6"  cellspacing="3">
    <tr>
        
        <td>
            <asp:GridView ID="GridView1" runat="server" DataKeyNames="id" 
                AutoGenerateColumns="False" AllowPaging="True" CellPadding="6" CellSpacing="3" 
                onpageindexchanging="GridView1_PageIndexChanging" 
                onrowdeleting="GridView1_RowDeleting" PageSize="50">
            <Columns>
         <%--   <asp:BoundField HeaderText="Category" DataField="category" ItemStyle-Width="150"  ItemStyle-HorizontalAlign="Center"  ItemStyle-Height="25"  />
            <asp:BoundField HeaderText="Sub-Category" DataField="category1" ItemStyle-Width="150"  ItemStyle-HorizontalAlign="Center"  ItemStyle-Height="25"  />
            <asp:BoundField HeaderText="Sub-Sub-Category" DataField="category2" ItemStyle-Width="150"  ItemStyle-HorizontalAlign="Center"  ItemStyle-Height="25"  />
            
       --%>     <asp:BoundField HeaderText="Product Name" DataField="pname" ItemStyle-Width="150"  ItemStyle-HorizontalAlign="Center"  ItemStyle-Height="25"  />
            <asp:TemplateField HeaderText="Product Image">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" Width="100" ImageUrl=<%#Eval("image") %> />
            </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Edit" ItemStyle-Width="50"  ItemStyle-HorizontalAlign="Center"  ItemStyle-Height="25" >
            <ItemTemplate>
            <a href=product.aspx?id=<%#Eval("id")%>>Edit</a>
            
            <br/><br />
            <a href=previewimages.aspx?id=<%#Eval("id")%>>Preview</a>
           
            
            </ItemTemplate>
            </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ItemStyle-Width="50"  ItemStyle-HorizontalAlign="Center"  ItemStyle-Height="25" />
            </Columns>
            </asp:GridView>
        </td>
    </tr>
    
      <tr>
       
        <td>
            <asp:Label ID="Label1" runat="server" Text="No products added till now" ></asp:Label>
        </td>
    </tr>
    
    

</table>



</div>
</div>
</div>
</asp:Content>

