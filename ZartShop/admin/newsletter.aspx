
<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" Inherits="admin_newsletter"  Codebehind="newsletter.aspx.cs" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<ul class="navigation">
            	<li><a href="#"><img src="images/home.gif" width="13" alt="" /></a></li>
                <li><b>Manage Newsletter</b></li>
            </ul>	
            
            <div class="right-nav">
        	<div class="in-right">
            	                
                <div class="cont" align="Center">
                
                <table>
                <tr>
                <td>
                Subject : <asp:TextBox ID="TextBox1" runat="server" Width="350" ValidationGroup="v1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Subject required" ControlToValidate="TextBox1" 
                        ValidationGroup="v1">*</asp:RequiredFieldValidator>
                </td>
                </tr>
                <tr>
                    <td>
                 <FCKeditorV2:FCKeditor ID="uc1" runat="server" Width=750 BasePath="~/fckeditor/" 
                Height="400px"> </FCKeditorV2:FCKeditor>
                    </td>
                </tr>
                <tr>
                    <Td>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            ShowMessageBox="True" ShowSummary="False" ValidationGroup="v1" />
                        <asp:Button ID="Button1" runat="server" Text="Send Newsletter" 
                            ValidationGroup="v1" onclick="Button1_Click" />
                    </Td>
                </tr>
                <tr>
                <td>
                <asp:Button ID="Button3" runat="server" Text="Select All" onclick="Button3_Click" CssClass="submit" />
    <asp:Button ID="Button4" runat="server" Text="Unselect All" onclick="Button4_Click" CssClass="submit"  />
   
                </td>
                </tr>
                <tr>
                    <td>
                     <asp:GridView ID="GridView1" runat="server" DataKeyNames="id"  PageIndex="75"
                        AutoGenerateColumns="False" AllowPaging="True" CellPadding="6" CellSpacing="3" 
                        onpageindexchanging="GridView1_PageIndexChanging" 
                        onrowdeleting="GridView1_RowDeleting">
                    <Columns>
                    <asp:TemplateField>
    <ItemTemplate>
        <asp:CheckBox ID="CheckBox1" runat="server" />
    </ItemTemplate>
    </asp:TemplateField>
                   
                        
                       <asp:TemplateField HeaderText="Email" ItemStyle-Height="25" 
                            ItemStyle-Width="400" ItemStyle-HorizontalAlign="Center"  >
                       <ItemTemplate>
                           <asp:Literal ID="Literal2" runat="server" Text=<%#Eval("email") %>></asp:Literal>
                       </ItemTemplate>
                       </asp:TemplateField>
                    <asp:BoundField HeaderText="Subscribed Date" DataField="date" ItemStyle-Height="25" 
                            ItemStyle-Width="150" ItemStyle-HorizontalAlign="Center">
<ItemStyle HorizontalAlign="Center" Height="25px" Width="150px"></ItemStyle>
                        </asp:BoundField>
                        <asp:CommandField ShowDeleteButton="True" ItemStyle-Width="100" ItemStyle-HorizontalAlign="Center" />
                    </Columns>
                    </asp:GridView>
                    <asp:Literal ID="Literal1" runat="server" Text="No one has subscribed to newsletter"></asp:Literal>
                
                    </td>
                </tr>
                </table>
                   
                     </div>
                
            </div>
        </div>
        
        
</asp:Content>

