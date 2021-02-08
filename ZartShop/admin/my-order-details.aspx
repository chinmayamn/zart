<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" Inherits="admin_my_order_details"  Codebehind="my-order-details.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<ul class="navigation">
            	<li><a href="#"><img src="images/home.gif" width="13" alt="" /></a></li>
                <li><b>Order Details</b></li>
            </ul>	
            
            <div class="right-nav">
        	<div class="in-right">
            	                
                <div class="cont" >
                    <!-- Main Login content	-->
            <div class="full-w">
        			
                    
                <!-- Login Box	-->
                <div class="login-box">
                	
                    <h2>My Orders Details</h2>
                 
                     <div class="order">
                        
                            <div class="order-det">
                            
                            
                                <h6>Order Detail
                                
                                <span style="float:right">Status : <asp:Literal ID="Literal4" runat="server"></asp:Literal></span>
                                </h6>
                                
                                <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                  <p><b>Order ID :</b> <%#Eval("id")%>	<br />    <b>Date Added :</b> <%#Eval("date")%></p>
                                <p><b>Payment Method :</b> <%#Eval("paymentmethod")%>	<br /> <b>Shipping :</b> <%#Eval("shipping") %></p>
                        
                                </ItemTemplate>
                                </asp:Repeater>
                                  </div>
                            <div class="order-det">
                                <p><b>Payment Address :</b><br />
                                    <asp:Literal ID="Literal6" runat="server"></asp:Literal>
                                </p>
                                <p><b>Shipping Address :</b><br />
                                 
                                    <asp:Literal ID="Literal5" runat="server"></asp:Literal>
                                 </p>
                            </div>
                            
                            <div class="products-list">
                                
                                <div class="single-pro pro-title">
                                    <span class="name">Product Name</span>
                                    <span class="model">Product</span>
                                    <span class="quantity">Qty</span>
                                    <span class="pro-rate">Price</span>
                                 
                                    <span class="pro-rate">Tax</span>
                                      <span class="pro-rate">Discount</span>
                                    <span class="pro-total">Total</span>
                                    <div class="clear"></div>
                                </div>
                                
                                <asp:Repeater ID="Repeater2" runat="server">
                                <ItemTemplate>
                                <div class="single-pro light height">
                                    <span class="name"><%#Eval("pname") %>
                                    
                                     <br /><br />
                                    Color : <%#Eval("color") %>
                                    <br /><br />
                                    Size : <%#Eval("size") %>
                                    
                                    
                                    </span>
                                    <span class="model"><asp:Image runat="server" id="i1" width=80 ImageUrl=<%#Eval("pimage") %>></asp:Image></span>
                                    <span class="quantity"><%#Eval("quantity")%></span>
                                    <span class="pro-rate">Rs. <%#Eval("price") %></span>
                                   
                                      <span class="pro-rate">Rs. <%#Eval("tax") %></span>
                                       <span class="pro-rate"><%#Eval("discount")%> %</span>
                                    <span class="pro-total">Rs. <%#Eval("linetotal") %></span>
                                    <div class="clear"></div>
                                </div>
                             
                              
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                                   <div class="single-pro dark height">
                                   <span class="name"><%#Eval("pname") %>
                                    <br /><br />
                                    Color : <%#Eval("color") %>
                                    <br /><br />
                                    Size : <%#Eval("size") %>
                                    
                                   
                                   </span>
                                    <span class="model"><asp:Image runat="server" id="i1" width=80 ImageUrl=<%#Eval("pimage") %>></asp:Image></span>
                                    <span class="quantity"><%#Eval("quantity")%></span>
                                    <span class="pro-rate">Rs. <%#Eval("price") %></span>
                                   
                                      <span class="pro-rate">Rs. <%#Eval("tax") %></span>
                                       <span class="pro-rate"><%#Eval("discount")%> %</span>
                                    <span class="pro-total">Rs. <%#Eval("linetotal") %></span>
                                    <div class="clear"></div>
                                </div>
                                
                                </AlternatingItemTemplate>
                                </asp:Repeater>
                                
                                <div class="single-pro dark">	
                                    <span class="sub-rate">Total</span>
                                    <span class="pro-total">Rs. <asp:Literal ID="Literal3" runat="server"></asp:Literal></span>
                                </div>
                                
                            </div>
                              <div class="order-det">
                           <h6>  Order Summary</h6>
                               <div class="products-list">
                                
                                 <asp:GridView ID="Repeater3" runat="server" AutoGenerateColumns="False"   
               DataKeyNames="id"
                HeaderStyle-Font-Bold="true" 
                HorizontalAlign="Center" CellPadding="6"  Width="100%"
                CellSpacing="4" onrowdeleting="Repeater3_RowDeleting" BorderColor="White" >
                                     <RowStyle BackColor="WhiteSmoke" BorderColor="White" BorderWidth="1px" 
                                         ForeColor="Black" />
            <Columns>
            <asp:TemplateField HeaderText="Date Added" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="25">
            <ItemTemplate>
            <%#Eval("createddate")%>
            
            </ItemTemplate>

<ItemStyle HorizontalAlign="Center" Height="25px"></ItemStyle>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Customer Notified" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="25">
            <ItemTemplate>
            <%#Eval("notified")%>
            
            </ItemTemplate>

<ItemStyle HorizontalAlign="Center" Height="25px"></ItemStyle>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="25">
            <ItemTemplate>
            <%#Eval("status")%>
            
            </ItemTemplate>

<ItemStyle HorizontalAlign="Center" Height="25px"></ItemStyle>
            </asp:TemplateField>
            
             <asp:TemplateField HeaderText="Comments"  ItemStyle-Height="25">
            <ItemTemplate>
            <%#Eval("comments")%>
            
            </ItemTemplate>

<ItemStyle Height="25px"></ItemStyle>
            </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ItemStyle-HorizontalAlign="Center" 
                    ItemStyle-Width="75px">
<ItemStyle HorizontalAlign="Center" Width="75px"></ItemStyle>
                </asp:CommandField>
            </Columns>
 <HeaderStyle BackColor="#CFCFCF" ForeColor="Black" />
                                     <AlternatingRowStyle BackColor="#E3E3E3" BorderColor="White" BorderWidth="1px" 
                                         ForeColor="Black" />
            </asp:GridView>
                              
                                
                                   <asp:Literal ID="Literal1" runat="server" Text="No summary added till now"></asp:Literal>
                                </div>
                                
                                </div>
                                
                            <table align="center">
      <tr> 
        <td><br><b >Comments</b></td> 
      </tr> 
      <tr> 
        <td align="left"><img src="images/pixel_trans.gif" border="0" alt="" width="1" height="5"></td> 
      </tr> 
      <tr> <td >
          <asp:TextBox ID="txtcomment" runat="server" Height="100px" TextMode="MultiLine" Width="500px"></asp:TextBox>
      
      </td> 
      </tr> 
      <tr> 
        <td align="left"><img src="images/pixel_trans.gif" border="0" alt="" width="1" height="10"></td> 
      </tr> 
      <tr> 
        <td align="left"><table border="0" cellspacing="0" cellpadding="2"> 
          <tr> 
            <td align="left"><table border="0" cellspacing="0" cellpadding="2" > 
              <tr> 
                <td ><b>Status:</b> 
                
                
                    <asp:DropDownList ID="ddlstatus" runat="server">
                    <asp:ListItem Text="Pending">
                   
                    </asp:ListItem>
                    
                    <asp:ListItem Text="Processing">
                   
                    </asp:ListItem>
                    
                    <asp:ListItem Text="Delivered">
                    
                    </asp:ListItem>
                    </asp:DropDownList>
                
                
                </td> 
              </tr> 
              <tr> 
                <td ><b>Notify Customer:</b>
                
                    <asp:CheckBox ID="CheckBox_notify" runat="server" Checked="true"/>
                    
                 </td> 
                <td ><b>Append Comments:</b>&nbsp;
                    <asp:CheckBox ID="Check_comment" runat="server"  Checked="true"/></td> 
              </tr> 
              <tr> 
                <td colspan="2">&nbsp;
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit"  />
                </td> 
                <td >&nbsp;</td> 
              </tr> 
            </table></td> 
            
          </tr> 
        </table>
</table>
                        
                    </div>
                    
                    
                    
                </div>
                <!-- End of Login Box	-->        
                
              
            </div>
            <!-- End of Main Image content	-->
                       </div>
                
            </div>
        </div>
        
</asp:Content>

