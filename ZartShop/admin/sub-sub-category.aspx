<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" Inherits="admin_sub_sub_category"  Codebehind="sub-sub-category.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<ul class="navigation">
            	<li><a href="#"><img src="images/home.gif" width="13" alt="" /></a></li>
                <li><b>Manage Sub-Sub-Categories</b></li>
            </ul>	
            
            <div class="right-nav">
        	<div class="in-right">
            	                <div class="top-head">
                	<a href=category.aspx >Category</a>
                    <a href="sub-category.aspx" >Sub-Category</a>
                     <a href="sub-sub-category.aspx" class="select" >Sub-Sub-Category</a>
                </div>
                   
                <div class="cont" align="Center">
                   
<table>
<tr>
<td>
Category:
</td>
<td>
  <asp:DropDownList ID="DropDownList3" runat="server" Width="300" 
        ValidationGroup="v3" AutoPostBack="True" 
        onselectedindexchanged="DropDownList3_SelectedIndexChanged" >
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ErrorMessage="Select Category" InitialValue="Select" ControlToValidate="DropDownList3" 
                ValidationGroup="v3">*</asp:RequiredFieldValidator>
</td>
</tr>
    <tr>
        <td>
            Sub-Category:
        </td>
        <td>
            <asp:DropDownList ID="DropDownList2" runat="server" Width="300" ValidationGroup="v3" >
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ErrorMessage="Select Sub-Category" InitialValue="Select" ControlToValidate="DropDownList2" 
                ValidationGroup="v3">*</asp:RequiredFieldValidator>
        </td>
        </tr>
            <tr>
        <td>
            Sub-Sub-Category:
        </td>
        <td>
            <asp:TextBox ID="TextBox3" runat="server" Width="300" ValidationGroup="v3" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ErrorMessage="Sub-Sub-Category required"  ControlToValidate="TextBox3" 
                ValidationGroup="v3">*</asp:RequiredFieldValidator>
        </td>
        </tr>
        <tr>
            <td>
             <asp:ValidationSummary ID="ValidationSummary3" runat="server" ValidationGroup="v3" ShowMessageBox="True" ShowSummary="False" />
     
            </td>
            <td>
                <asp:Button ID="Button5" runat="server" Text="Create" ValidationGroup="v32" 
                    onclick="Button5_Click" />
                <asp:Button ID="Button6" runat="server" onclick="Button6_Click" Text="Update" 
                    ValidationGroup="v3" />
            </td>
        </tr>
      
   
</table>
<br />
<br />
<br />
<table>
    <tr>
        <td>
            <asp:GridView ID="GridView3" runat="server" DataKeyNames="id"  PageSize="50"
                AutoGenerateColumns="False" AllowPaging="True" 
                onpageindexchanging="GridView3_PageIndexChanging" 
                onrowdeleting="GridView3_RowDeleting" CellPadding="6" CellSpacing="3"> 
                <Columns>
                  <asp:BoundField HeaderText="Category" DataField="Category2" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="350" ItemStyle-Height="25" />
          
                 <asp:BoundField HeaderText="Sub-Category" DataField="Category1" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="350" ItemStyle-Height="25" />
          
                   <asp:BoundField HeaderText="Sub-Sub-Category" DataField="Category" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="350" ItemStyle-Height="25" />
          
           
            
            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="75" ItemStyle-Height="25"  >
                <ItemTemplate>
                     <a href="sub-sub-category.aspx?ssid=<%# Eval("id") %>"> 
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
            <asp:Label ID="Label4" runat="server" ></asp:Label>
        </td>
    </tr>
</table>
                      
               
                           </div>
                                </div>
               </div>
                      
                      
                      
                      
                
                             
</asp:Content>

