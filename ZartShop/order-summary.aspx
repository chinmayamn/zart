<%@ Page Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" Inherits="order_summary"  Codebehind="order-summary.aspx.cs" %>

<script runat="server">

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

   
  	<!-- Content	-->
        <div class="content">
        
            
            <!-- Main Login content	-->
            <div class="full-w">
        			
                <!-- Login Box	-->
                <div class="login-box">
                	
                    <div class="navigating">
                    	<div class="navs"><span>1</span>	E mail login</div>
                    	<div class="navs"><span>2</span>	Shipping Address</div>
                    	<div class="navs selected"><span>3</span>	Order Summary</div>
                    	<div class="navs"><span>4</span> 	payment Options</div>
                    </div>
                    
                	<div class="main-items">
                    	<div class="top-items">
                        	<div class="itms">Items</div>
                            <div class="colors">Color</div>
                            <div class="sizes">Size</div>
                            <div class="qtys">Qty</div>
                            <div class="prics">Prices</div>
                                
                                        <div class="prics">Tax</div>
                            <div class="prics">Discount</div>
                            <div class="sub-total">Total</div>
                        </div>
                       
                        <asp:Repeater ID="Repeater1" runat="server"   onitemcommand="Repeater1_ItemCommand">
                        <ItemTemplate>
                        <div class="cent-items">
                        	<div class="itms">
                                <div class="prod-name">
                                	<%#Eval("productname") %>		<br />
                                 <%--   <asp:Literal ID="Literal5" runat="server" Visible=false Text=<%#Eval("id") %>></asp:Literal>
                               --%>     <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument=<%#Eval("productid")%> CommandName="Edit">Edit</asp:LinkButton>
                                     <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument=<%#Eval("productid")%> CommandName="Update" Visible=false>Update</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument=<%#Eval("productid")%> CommandName="remove">Remove</asp:LinkButton>
                                  
                                </div>
                            	<div class="order-img"><img src=<%#Eval("productimageurl") %> alt="" id="img1" runat="server" /></div>
                            </div>
                            <div class="colors">
                            
                                <asp:Literal ID="Literal3" runat="server" Text=<%#Eval("color")%>></asp:Literal>
                                <asp:DropDownList ID="DropDownList1" runat="server" Visible=false>
                                </asp:DropDownList>
                            
                            </div>
                            <div class="sizes">
                                <asp:Literal ID="Literal4" runat="server" Text=<%#Eval("size") %>></asp:Literal>
                             <asp:DropDownList ID="DropDownList2" runat="server" Visible=false>
                                </asp:DropDownList>
                            
                            </div>
                            <div class="qtys">
                                <div class="less-more">
                                	<a href="#">
                                	
                                	<asp:ImageButton ID="ImageButton1" runat="server" class="qc" ImageUrl="images/less.jpg" CommandArgument=<%#Eval("productid")%> CommandName="less"/>
                            
                   
                                	
                                	
                                	</a>
                                
                                    <asp:TextBox ID="TextBox1" Text=<%#Eval("quantity") %> runat="server" ReadOnly="true" class="qty-value"></asp:TextBox>
                               
                                	<a href="#">
                                	 <asp:ImageButton ID="ImageButton2" runat="server" class="qc" ImageUrl="images/more.jpg" CommandArgument=<%#Eval("productid")%> CommandName="more"/>
                       
                                	
                                	</div>
                               	</div>     
                            <div class="prics">
                            	<span class="rup"><%#Eval("price") %></span>
                            </div>
                            
                          
                             <div class="prics">
                            	<%#Eval("tax") %> %
                            </div>
                            
                             <div class="prics">
                            	<%#Eval("discount") %> %
                            </div>
                            
                            
                            <div class="sub-total">
                            	<span class="rup"><%#Eval("linetotal")%></span>
                            </div>
                        </div>
                        </ItemTemplate>
                        </asp:Repeater>
                    	
                    	
                        
                        <div class="order-total">
                        
                            <div style="float:left; font-weight:bold; color:#333;">
                            
                          
                                
                               
                              
                                <asp:Literal ID="Label2" runat="server" Text="You are eligible for free shipping"></asp:Literal>
                            </div>
                        Order Total : <span class="rup">
                            
                            
                            <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                            
                            
                            
                            </span></div>
                        
                    </div>
                    
                    <div class="e-mail">
                    
                    	
                        <asp:Button ID="Button1" runat="server" Text="Continue" class="continue" 
                            onclick="Button1_Click"/>
                        <asp:Button ID="Button2" runat="server" Text="Add Items" class="continue" 
                            onclick="Button2_Click" />
                        
                        <div class="free-ship1">
                            <div class="free">
                                <img src="images/free.jpg" alt="" />
                                <b>Free Shipping</b>
                                on orders above Rs.<asp:Literal ID="Literal1" runat="server"></asp:Literal>/-
                            </div>
                            <div class="free">
                                <img src="images/pay.jpg" alt="" />
                                <b>100% Secure Payment</b>
                                cash on delivery available
                            </div>
                        </div>
                    </div>
                    
                    
                    
                </div>
                <!-- End of Login Box	-->        
                
                <!-- Right Shopping Cart	-->
                <div class="shop-cart">
                	<h3>My Shopping Cart</h3>
                    <p style="color:#999; padding:0 0 0 10px; line-height:18px;">
                        
                        <asp:Literal ID="Label1" runat="server"></asp:Literal>
                    </p>
                       
                </div>
                <!-- End of Right Shopping Cart	-->
            </div>
            <!-- End of Main Image content	-->
            
           
      </div>
        <!-- ENd of content	-->
        
     </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

