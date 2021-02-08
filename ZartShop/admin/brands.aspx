<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" Inherits="admin_brands"  Codebehind="brands.aspx.cs" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<ul class="navigation">
            	<li><a href="#"><img src="images/home.gif" width="13" alt="" /></a></li>
                <li><b>Manage Brands</b></li>
            </ul>	
            
            <div class="right-nav">
        	<div class="in-right">
            	                
                <div class="cont" align="Center">


<table>
    <tr>
        <td>
           Name:
        </td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server"  ValidationGroup="v1" Width="300"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Category name required" ControlToValidate="TextBox1" 
                ValidationGroup="v1">*</asp:RequiredFieldValidator>
        </td>
        </tr>
            <tr>
        <td>
           Image:
        </td>
        <td>
            <asp:FileUpload ID="FileUpload1" runat="server" /><asp:Image ID="Image1" runat="server" width="200"/>
        </td>
        </tr>
            <tr>
        <td>
            Details:
        </td>
        <td>
      
    <FCKeditorV2:FCKeditor ID="uc1" runat="server" Width=700 BasePath="~/fckeditor/" 
                Height="400px"> </FCKeditorV2:FCKeditor>
    
        </td>
        </tr>
        <tr>
            <td>
             <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="v1" ShowMessageBox="True" ShowSummary="False" />
     
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Create" ValidationGroup="v1" 
                    onclick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Update" 
                    ValidationGroup="v1" />
            </td>
        </tr>
      
   
</table>
<br />
<br />
<br />
<table>
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" DataKeyNames="id" 
                AutoGenerateColumns="False" AllowPaging="True" 
                onpageindexchanging="GridView1_PageIndexChanging" 
                onrowdeleting="GridView1_RowDeleting" CellPadding="6" CellSpacing="3"> 
                <Columns>
                   <asp:BoundField HeaderText="Brand Name" DataField="bname" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="200" ItemStyle-Height="25" />
          
          <asp:TemplateField HeaderText="Image">
          <ItemTemplate>
              <asp:Image ID="Image2" runat="server" Width="200" ImageUrl=<%#Eval("bimage") %> />
          </ItemTemplate>
          </asp:TemplateField>
           
              <asp:TemplateField HeaderText="Description" ItemStyle-Width="550"> 
          <ItemTemplate>
              <asp:Label ID="Label2" runat="server" Text=<%#Server.HtmlDecode(Eval("bdetails").ToString()) %>></asp:Label>
          </ItemTemplate>
          </asp:TemplateField>
          
          
            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="75" ItemStyle-Height="25"  >
                <ItemTemplate>
                     <a href="brands.aspx?id=<%# Eval("id") %>"> 
                         <asp:Label ID="Label3" runat="server" Text="Edit"></asp:Label>
                     </a>
                </ItemTemplate>
            </asp:TemplateField>
                      <asp:CommandField ShowDeleteButton="True" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="75" ItemStyle-Height="25"  />
                </Columns>
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" ></asp:Label>
        </td>
    </tr>
</table>

  </div>
                
            </div>
        </div>
</asp:Content>

