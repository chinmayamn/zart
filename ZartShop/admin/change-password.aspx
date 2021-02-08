<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" Inherits="admin_change_password"  Codebehind="change-password.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<ul class="navigation">
            	<li><a href="#"><img src="images/home.gif" width="13" alt="" /></a></li>
                <li><b> Change Password </b></li>
            </ul>	
            
            <div class="right-nav">
        	<div class="in-right">
            	                
                <div class="cont" align="Center">
                
                

  <table  cellpadding="6" cellspacing="3"  >
                	
                    	<tr>
                    	<td>
                    	Password:
                            
                    	</td>
                    	<td>
                            <asp:TextBox ID="TextBox1" runat="server" ValidationGroup="v1" TextMode="Password"></asp:TextBox>
                       
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Password required" ControlToValidate="TextBox1" 
                        ValidationGroup="v1">*</asp:RequiredFieldValidator>
                         </td>
                    	</tr>
                    
            <tr>
            <td></td>
            <td >
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="v1" ShowMessageBox="True" ShowSummary="False" />
                <asp:Button ID="Button1" runat="server" Text="Change Password" ValidationGroup="v1" onclick="Button1_Click" 
                     />
            </td>
          
            </tr>

                    	</table>
                    	
                    	        </div>
                
            </div>
        </div>
        
</asp:Content>

