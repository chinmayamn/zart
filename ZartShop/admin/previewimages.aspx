<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" Inherits="admin_previewimages"  Codebehind="previewimages.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<ul class="navigation">
            	<li><a href="#"><img src="images/home.gif" width="13" alt="" /></a></li>
                <li><b>Product Preview Image</b></li>
            </ul>	
            
            <div class="right-nav">
        	<div class="in-right">
            	     <div class="cont" align="Center">
            	     
            	                     
 <table cellpadding="6" cellspacing="3">
        <tr>
        
          <td>
              Image:
          
          </td>
          <td>
              <asp:FileUpload ID="FileUpload1" runat="server" />
          </td>
        </tr>
      
        <tr>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="v1" />
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Add Preview Image"  ValidationGroup="v1"
                    onclick="Button1_Click" />
            </td>
        </tr>
    </table>
    <br />
    
    <br />
    <table>
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" DataKeyNames="id" 
                AutoGenerateColumns="False" AllowPaging="True" CellPadding="6" CellSpacing="4" 
                onpageindexchanging="GridView1_PageIndexChanging" 
                onrowdeleting="GridView1_RowDeleting" PageSize="30">
            <Columns>
            <asp:BoundField HeaderText="Product" DataField="pname" ItemStyle-Width="400" ItemStyle-HorizontalAlign="Center" />
            <asp:TemplateField HeaderText="Image" ItemStyle-Width="200">
            <ItemTemplate>
             <asp:Image ID="Image1" runat="server" width="200" ImageUrl=<%#Eval("image") %> >
                </asp:Image>
            </ItemTemplate>
            </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ItemStyle-Width="100" ItemStyle-HorizontalAlign="Center"  />
               
            </Columns>
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="No preview image for this product"></asp:Label>
        </td>
    </tr>
    </table>
            	     
            	     </div>
            	     </div>
            	     </div>         
                
                
                
                
</asp:Content>

