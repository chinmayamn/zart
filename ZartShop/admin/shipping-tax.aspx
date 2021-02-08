<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" Inherits="admin_shipping_tax"  Codebehind="shipping-tax.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<ul class="navigation">
            	<li><a href="#"><img src="images/home.gif" width="13" alt="" /></a></li>
                <li><b>Default Shipping & Tax </b></li>
            </ul>	
            
            <div class="right-nav">
        	<div class="in-right">
            	                
                <div class="cont" align="Center">
 <table   cellpadding="6" cellspacing="3" align="center" style="margin:0px auto;">
                	
                    	<tr>
                    	<td>
                    	  Shipping (Rs) :
                    	</td>
                    	<td>
                            <asp:TextBox ID="TextBox1" runat="server" ValidationGroup="v1" width="250"
                                ></asp:TextBox>
                       
                    	</td>
                    	<td> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Free-Shipping price required" ControlToValidate="TextBox1" 
                        ValidationGroup="v1">*</asp:RequiredFieldValidator>
                        
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="^\d+$" 
                                    ErrorMessage="Invalid price" ControlToValidate="TextBox1" 
                                    ValidationGroup="v1">*</asp:RegularExpressionValidator>
                                    
                                    
                         </td>
                    	</tr>
                    	     	<tr>
                    	<td>
                    	 Tax (%) :
                    	</td>
                    	<td>
                            <asp:TextBox ID="TextBox2" runat="server" ValidationGroup="v1" width="250"
                                ></asp:TextBox>
                       
                    	</td>
                    	<td> <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Tax percentage required" ControlToValidate="TextBox1" 
                        ValidationGroup="v1">*</asp:RequiredFieldValidator>
                        
                          <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="^\d+$" 
                                    ErrorMessage="Invalid price" ControlToValidate="TextBox1" 
                                    ValidationGroup="v1">*</asp:RegularExpressionValidator>
                                    
                          --%>          
                         </td>
                    	</tr>
                
          
            <tr>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" ValidationGroup="v1" />
            </td>
            <td >
                <asp:Button ID="Button1" runat="server" Text="Save Shipping & Tax" ValidationGroup="v1" 
                  onclick="Button1_Click" />
                 
            </td>
            <td>
            </td>
            </tr>

                    	</table>
                    	<br />
<br />
<br />
<table>
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" DataKeyNames="shipping" 
                AutoGenerateColumns="False" AllowPaging="True" 
              
                onrowdeleting="GridView1_RowDeleting" CellPadding="6" CellSpacing="3"> 
                <Columns>
               
            
          <asp:BoundField  HeaderText="Shipping (Rs)" DataField="shipping" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="125" ItemStyle-Height="25"/>
            <asp:BoundField  HeaderText="Tax (%)" DataField="tax" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="125" ItemStyle-Height="25"/>
        
      <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="75" ItemStyle-Height="25" >
        <ItemTemplate>
        <a href=shipping-tax.aspx?id=<%#Eval("shipping")%> > Edit </a>
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

