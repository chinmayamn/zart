<%@ Page Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" Inherits="wishlist"  Codebehind="wishlist.aspx.cs" %>
<%@ Register Src="~/cart.ascx" TagName="cart" TagPrefix="ucl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      	<!-- Content	-->
        <div class="content">
        	<ul class="navi">
                <li><a href="index.aspx">Home</a></li>
                <li>My Wishlist</li>
            </ul>
            
            <!-- Main Login content	-->
            <div class="full-w">
        			
                <!-- Login Box	-->
                <div class="login-box">
                	
                    <div class="f-w">
                    	
                        <asp:Repeater ID="Repeater1" runat="server" 
                            onitemcommand="Repeater1_ItemCommand" 
                            onitemdatabound="Repeater1_ItemDataBound">
                        
                     <ItemTemplate>
                     <div class="my-wish">
	                        <div class="num"><%#Container.ItemIndex + 1 %> </div>
                            <div class="productimg">
                            	<div class="proimg">
                                	<img src=<%#Eval("image")%> id="i1" runat="Server"  alt="" class="wishpro" />
                                </div>
                            </div>
                            <div class="prosdets">
                            	<h4><%#Eval("pname") %> ( <span class="wish-price"><%#Eval("mrp")%></span> ) <span class="percent"><%#Eval("discount") %>% Off</span></h4>
                                <p><b>Brand </b>:<asp:Label ID="Label4" runat="server" Text=<%#Eval("brand") %>></asp:Label> </p>
                                <p><b>Color </b>: 
                                    <asp:Label ID="Label5" runat="server" Text=<%#Eval("color") %>></asp:Label></p>
                                <p><b>Quantity </b>:<asp:Label ID="Label6" runat="server" Text=<%#Eval("qty") %> ></asp:Label>  <a href=product-details.aspx?id=<%#Eval("id1")%> class="views" >View product details</a></p>
                            </div>
                            <div class="wish-total">
                            	<p><b>
                                    <asp:Label ID="Label2" runat="server" ></asp:Label>
                                    <asp:Label ID="Label3" runat="server" Text=<%#Eval("availability")%> Visible=false></asp:Label>
                                    <asp:Image ID="Image1" runat="server" />
                                    </b></p>
								<p><b>Size</b>:<asp:Label ID="Label7" runat="server" Text=<%#Eval("size") %> > </asp:Label></p>
								<p class="tot"><b>Total Price :   </b> <span class="wish-price"><%#Eval("actual") %></span></p>
                           
                                <asp:LinkButton class="buy-now" ID="LinkButton2" runat="server" CommandName="add" CommandArgument=<%#Eval("pid") %>>Buy Now<img src="images/arrow9.gif" alt="" /></asp:LinkButton>
                                
                               <asp:LinkButton ID="LinkButton1" runat="server" class="remove" CommandArgument=<%#Eval("id")%> CommandName="delete">Remove from My Wishlist</asp:LinkButton>
                            </div>
                        </div>
                     </ItemTemplate>
                        </asp:Repeater>
                        
                        <asp:Label ID="Label1" runat="server" Text="Currently no items in your wishlist"></asp:Label>
                        
                    	
                        
                        
                    </div>
                    
                </div>
                <!-- End of Login Box	-->        
                
                <!-- Right Shopping Cart	-->
                 <ucl:cart ID="Cart1" runat="server" />
                <!-- End of Right Shopping Cart	-->
            </div>
            <!-- End of Main Image content	-->
            
           
      </div>
        <!-- ENd of content	-->
</asp:Content>

