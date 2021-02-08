<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" Inherits="admin_banner"  Codebehind="banner.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<ul class="navigation">
            	<li><a href="#"><img src="images/home.gif" width="13" alt="" /></a></li>
                <li><b>Manage Banner</b></li>
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
             Text:
          
          </td>
          <td>
              <asp:TextBox ID="TextBox1" runat="server" ValidationGroup="v1" Width="350"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Text required" ValidationGroup="v1" ControlToValidate="TextBox1" Text="*"></asp:RequiredFieldValidator>
              
          </td>
        </tr>
        <tr>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="v1" />
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Upload Photo"  ValidationGroup="v1"
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
            <asp:TemplateField HeaderText="Image" ItemStyle-Width="200">
            <ItemTemplate>
             <asp:Image ID="Image1" runat="server" width="200" ImageUrl=<%#Eval("images") %> >
                </asp:Image>
            </ItemTemplate>
            </asp:TemplateField>
               <asp:BoundField HeaderText="Text" DataField="text" ItemStyle-Width="300" ItemStyle-HorizontalAlign="Center"  />
                <asp:CommandField ShowDeleteButton="True" ItemStyle-Width="100" ItemStyle-HorizontalAlign="Center"  />
               
            </Columns>
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="No banner images added till now"></asp:Label>
        </td>
    </tr>
    </table>
    
      </div>
                
            </div>
        </div>
        
        
</asp:Content>

