<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" Inherits="admin_sub_category"  Codebehind="sub-category.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                <ul class="navigation">
            	<li><a href="#"><img src="images/home.gif" width="13" alt="" /></a></li>
                <li><b>Manage Sub-Categories</b></li>
            </ul>	
            
            <div class="right-nav">
        	<div class="in-right">
            	                <div class="top-head">
                	<a href=category.aspx >Category</a>
                    <a href="sub-category.aspx" class="select">Sub-Category</a>
                     <a href="sub-sub-category.aspx"  >Sub-Sub-Category</a>
                </div>
                   
                <div class="cont" align="Center">
                
                
                
<table>
    <tr>
        <td>
            Category:
        </td>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server" Width="300" ValidationGroup="v2" >
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="Select Category" InitialValue="Select" ControlToValidate="DropDownList1" 
                ValidationGroup="v2">*</asp:RequiredFieldValidator>
        </td>
        </tr>
            <tr>
        <td>
            Sub-Category:
        </td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server" Width="300" ValidationGroup="v2" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ErrorMessage="Sub-Category required"  ControlToValidate="TextBox2" 
                ValidationGroup="v2">*</asp:RequiredFieldValidator>
        </td>
        </tr>
        <tr>
            <td>
             <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="v2" ShowMessageBox="True" ShowSummary="False" />
     
            </td>
            <td>
                <asp:Button ID="Button3" runat="server" Text="Create" ValidationGroup="v2" 
                    onclick="Button3_Click" />
                <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="Update" 
                    ValidationGroup="v2" />
            </td>
        </tr>
      
   
</table>
<br />
<br />
<br />
<table>
    <tr>
        <td>
            <asp:GridView ID="GridView2" runat="server" DataKeyNames="id" 
                AutoGenerateColumns="False" AllowPaging="True" 
                onpageindexchanging="GridView2_PageIndexChanging" 
                onrowdeleting="GridView2_RowDeleting" CellPadding="6" CellSpacing="3"> 
                <Columns>
                 <asp:BoundField HeaderText="Category" DataField="Category1" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="350" ItemStyle-Height="25" />
          
                   <asp:BoundField HeaderText="Sub-Category" DataField="Category" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="350" ItemStyle-Height="25" />
          
           
            
            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="75" ItemStyle-Height="25"  >
                <ItemTemplate>
                     <a href="sub-category.aspx?sid=<%# Eval("id") %>"> 
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
            <asp:Label ID="Label2" runat="server" ></asp:Label>
        </td>
    </tr>
</table>
                      
                      
</div>
</div>
</div>

</asp:Content>

