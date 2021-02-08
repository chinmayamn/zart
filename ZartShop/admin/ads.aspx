<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" Inherits="admin_ads"  Codebehind="ads.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<ul class="navigation">
            	<li><a href="#"><img src="images/home.gif" width="13" alt="" /></a></li>
                <li><b>Manage Ads</b></li>
            </ul>	
            
            <div class="right-nav">
        	<div class="in-right">
            	                
                <div class="cont" align="Center">
                		        
<table cellpadding="6" cellspacing="3">
  <tr>
        
          <td>
             Position:
          
          </td>
          <td>
              <asp:DropDownList ID="DropDownList1" runat="server" ValidationGroup="v1">
              <asp:ListItem Text="Select"></asp:ListItem>
              <asp:ListItem Text="Top-Right"></asp:ListItem>
              <asp:ListItem Text="Left-1"></asp:ListItem>
               <asp:ListItem Text="Left-2"></asp:ListItem>
              </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Select Position" ControlToValidate="DropDownList1" InitialValue="Select" 
                ValidationGroup="v1">*</asp:RequiredFieldValidator>
          </td>
        </tr>
        <tr>
        
          <td>
              Image:
          
          </td>
          <td>
              <asp:FileUpload ID="FileUpload1" runat="server" />
              <asp:Image ID="Image1" runat="server" width="200"/>
          </td>
        </tr>
        <tr>
        
          <td>
           Links:
          
          </td>
          <td>
              <asp:TextBox ID="TextBox1" runat="server" ValidationGroup="v1" Width="350"></asp:TextBox>
                
          </td>
        </tr>
        <tr>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="v1" />
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Add Ad"  ValidationGroup="v1"
                    onclick="Button1_Click" />
                     <asp:Button ID="Button2" runat="server" Text="Update Ad"  ValidationGroup="v1"
                    onclick="Button2_Click" />
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
            <asp:BoundField HeaderText="Position" DataField="position" ItemStyle-Width="100" ItemStyle-HorizontalAlign="Center" />
            <asp:TemplateField HeaderText="Image" ItemStyle-Width="200">
            <ItemTemplate>
             <asp:Image ID="Image2" runat="server" width="200" ImageUrl=<%#Eval("image") %> >
                </asp:Image>
            </ItemTemplate>
            </asp:TemplateField>
              <asp:BoundField HeaderText="Link" DataField="link" ItemStyle-Width="150" ItemStyle-HorizontalAlign="Center" />
            
              <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="75" ItemStyle-Height="25"  >
                <ItemTemplate>
                     <a href="ads.aspx?id=<%# Eval("id") %>"> 
                         <asp:Label ID="Label3" runat="server" Text="Edit"></asp:Label>
                     </a>
                </ItemTemplate>
            </asp:TemplateField>
            
            
             
                <asp:CommandField ShowDeleteButton="True" ItemStyle-Width="75" ItemStyle-HorizontalAlign="Center" />
               
            </Columns>
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="No ads added till now"></asp:Label>
        </td>
    </tr>
    </table>
                </div>
                
            </div>
        </div>
        
        
        

</asp:Content>

