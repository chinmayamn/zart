<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" Inherits="admin_website_settings" Codebehind="website-settings.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <ul class="navigation">
            	<li><a href="#"><img src="images/home.gif" width="13" alt="" /></a></li>
                <li><b> Website Settings </b></li>
            </ul>	
            
            <div class="right-nav">
        	<div class="in-right">
            	                
                <div class="cont" align="Center">
 <table   cellpadding="6" cellspacing="3" align="center" style="margin:0px auto;">
                	
                    	<tr>
                    	<td>
                    	    Website-Title:
                    	</td>
                    	<td>
                            <asp:TextBox ID="TextBox1" runat="server" ValidationGroup="v1" width="250"
                                ></asp:TextBox>
                       
                    	</td>
                    	<td> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Website title required" ControlToValidate="TextBox1" 
                        ValidationGroup="v1">*</asp:RequiredFieldValidator>
                         </td>
                    	</tr>
                    	<tr>
                    	<td>
                    	    Keywords:
                    	</td>
                    	<td>
                            <asp:TextBox ID="TextBox2" runat="server" ValidationGroup="v1" 
                                TextMode="MultiLine" Rows="3" Columns="29"></asp:TextBox>
                       
                    	</td>
                    	<td> <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Keywords required" ControlToValidate="TextBox2" 
                        ValidationGroup="v1">*</asp:RequiredFieldValidator>
                         </td>
                    	</tr>
          
          	<tr>
                    	<td>
                    	    Description:
                    	</td>
                    	<td>
                            <asp:TextBox ID="TextBox3" runat="server" ValidationGroup="v1" 
                                TextMode="MultiLine" Rows="3" Columns="29"></asp:TextBox>
                       
                    	</td>
                    	<td> <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="Description required" ControlToValidate="TextBox3" 
                        ValidationGroup="v1">*</asp:RequiredFieldValidator>
                         </td>
                    	</tr>
          
          
            <tr>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" ValidationGroup="v1" />
            </td>
            <td >
                <asp:Button ID="Button1" runat="server" Text="Update Settings" ValidationGroup="v1" 
                  onclick="Button1_Click" />
            </td>
            <td>
            </td>
            </tr>

                    	</table>
                    	        </div>
                
            </div>
        </div>
        
   
</asp:Content>

