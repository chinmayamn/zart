<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" Inherits="admin_productfilter"  Codebehind="productfilter.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
$(function () {
 $('#Button1').click(function () {
 

         var arr =new Array();
         
         var text1=$('#tex1').val();
          var text2=$("#Label1").val();
         alert(text1);
         alert(text2);
         
        arr[0]=new items(text1,text2);
    alert(arr[0]);
       
         $.ajax({ type: "POST",
             url: "../WebService.asmx/save_filter",
             
          data: JSON.stringify({ item: text1, i:text2 }),
            
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             success: function (response) {
                 alert("saved");
             },
             error: function (msg) {
                 alert("error");
             }
          });
	

	
		 

  });


 });
 
 function items(item_id,item_rank) {
     this.item_id = item_id;  this.item_rank = item_rank;
   
 }
 
</script>


<ul class="navigation">
            	<li><a href="#"><img src="images/home.gif" width="13" alt="" /></a></li>
                <li><b>Product Filters</b></li>
            </ul>	
            
            <div class="right-nav">
        	<div class="in-right">
            	     <div class="cont" align="Center">
            	    
            	     <table>
            	      <tr>
            	        <td valign="top">
            	       
            	       
            	        <table>
            	     <tr>
            	        <td>
            	        Color :
            	        </td>
            	        <td>
                            <asp:TextBox ID="TextBox1" runat="server" ValidationGroup="v1"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Color required" Text="*" ControlToValidate="TextBox1" ValidationGroup="v1"></asp:RequiredFieldValidator>
                              </td>
            	     </tr>
            	     <tr>
            	        <td>
                           	        </td>
            	        <td>
            	        
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                ShowMessageBox="True" ShowSummary="False" ValidationGroup="v1" />
                            <asp:Button ID="Button1" runat="server" Text="Add Filter"  ValidationGroup="v1"
                                onclick="Button1_Click" />
                                
                                
                            <asp:Button ID="Button2" runat="server" Text="Update Filter" 
                                ValidationGroup="v1" onclick="Button2_Click" />
                            
            	        </td>
            	     </tr>
            	     </table>
            	        
            	        </td>
            	        
            	        
            	        <td valign="top">
            	        
            	        <table>
            	            <tr>
            	                <td>
            	                <asp:GridView ID="GridView1" runat="server" DataKeyNames="id" 
                                        AutoGenerateColumns="False" CellPadding="6" CellSpacing="3" 
                                        onrowdeleting="GridView1_RowDeleting">
                            <Columns>
                            <asp:BoundField HeaderText="Filter Name" DataField="filtername" ItemStyle-Width="300" 
                                    ItemStyle-HorizontalAlign="Center" ItemStyle-Height="25" >
<ItemStyle HorizontalAlign="Center" Height="25px" Width="300px"></ItemStyle>
                                </asp:BoundField>
                               
                                <asp:TemplateField HeaderText="Edit" ItemStyle-Width="75" 
                                    ItemStyle-HorizontalAlign="Center"  >
                                <ItemTemplate>
                                 <a href=productfilter.aspx?cid=<%#Eval("id")%> > Edit </a>
                                </ItemTemplate>
                                </asp:TemplateField>
                              
                                <asp:CommandField ShowDeleteButton="True" ItemStyle-Width="75" 
                               
                                    ItemStyle-HorizontalAlign="Center" />
                            </Columns>
                            </asp:GridView>
            	                </td>
            	            </tr>
            	            <tr>
            	                <td>
            	                 <asp:Label ID="Label1" runat="server" Text="No filter added till now"></asp:Label>
            	                </td>
            	            </tr>
            	        </table>
                            
                            
                           
            	        </td>
            	      </tr>
            	     </table>
            	      
            	      
            	      <br />
            	      <br />
            	      <br />
            	      
            	      
            	        	    
            	     <table>
            	      <tr>
            	        <td valign="top">
            	       
            	       
            	        <table>
            	     <tr><td>Filter :</td><td>


            	                          </td>
            	        <td>
                            <asp:DropDownList ID="ddlFilter" runat="server"></asp:DropDownList>
            	        Value :
            	        </td>
            	        <td>
                            <asp:TextBox ID="TextBox2" runat="server" ValidationGroup="v2"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Size required" Text="*" ControlToValidate="TextBox2" ValidationGroup="v2"></asp:RequiredFieldValidator>
                              </td>
            	     </tr>
            	     <tr>
            	        <td>
                           	        </td>
            	        <td>
            	        
                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                                ShowMessageBox="True" ShowSummary="False" ValidationGroup="v2" />
                            <asp:Button ID="Button3" runat="server" Text="Add Size Filter"  ValidationGroup="v2" OnClick="Button3_Click"
                               />
                                
                                
                            <asp:Button ID="Button4" runat="server" Text="Update Color Filter" 
                                ValidationGroup="v2" OnClick="Button4_Click" />
                            
            	        </td>
            	     </tr>
            	     </table>
            	        
            	        </td>
            	        
            	        
            	        <td valign="top">
            	        
            	        <table>
            	            <tr>
            	                <td>
            	                <asp:GridView ID="GridView2" runat="server" DataKeyNames="id" 
                                        AutoGenerateColumns="False" CellPadding="6" CellSpacing="3" 
                                 onrowdeleting="GridView2_RowDeleting"       >
                            <Columns>
                            <asp:BoundField HeaderText="Filter" DataField="filtervalue" ItemStyle-Width="300" 
                                    ItemStyle-HorizontalAlign="Center" ItemStyle-Height="25" >
<ItemStyle HorizontalAlign="Center" Height="25px" Width="300px"></ItemStyle>
                                </asp:BoundField>
                               
                                <asp:TemplateField HeaderText="Edit" ItemStyle-Width="75" 
                                    ItemStyle-HorizontalAlign="Center"  >
                                <ItemTemplate>
                                 <a href=productfilter.aspx?sid=<%#Eval("id")%> > Edit </a>
                                </ItemTemplate>
                                </asp:TemplateField>
                              
                                <asp:CommandField ShowDeleteButton="True" ItemStyle-Width="75" 
                               
                                    ItemStyle-HorizontalAlign="Center" />
                            </Columns>
                            </asp:GridView>
            	                </td>
            	            </tr>
            	            <tr>
            	                <td>
            	                 <asp:Label ID="Label2" runat="server" Text="No size filter added till now"></asp:Label>
            	                </td>
            	            </tr>
            	        </table>
                            
                            
                           
            	        </td>
            	      </tr>
            	     </table>
            	      
            	      
            	      
            	      
            	      
            	      
            	      
            	         </div>
            	       </div>
            	     </div>         
                
                
</asp:Content>

