<%@ Control Language="C#" AutoEventWireup="true" Inherits="cart" Codebehind="cart.ascx.cs" %>
<%-- <%@ Register TagPrefix="mp" TagName="MyMP" Src="~/user.master" %>
--%>
<%@ Reference VirtualPath="user.master" %>
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
<div class="shop-cart">
                	<h3>My Shopping Cart</h3>
                    <p class="items">
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal> Item(s) in the Cart</p>
                    <p class="free-ship">
                   
                        <asp:Literal ID="Literal2" runat="server" Text="You are eligible for FREE Shipping" ></asp:Literal>
                    
                    </p>
                    
                    <!--<div class="no-cart"><img src="images/shop-now.jpg" width="149" alt="" /></div>-->
                    
                    <div id="test2" class="flexcroll">
                
                        <asp:Repeater ID="Repeater1" runat="server" 
                            onitemcommand="Repeater1_ItemCommand">
                        <ItemTemplate>
                        <div class="cart-pro">
                    	<div class="sp-pro"><div class="shop-pro"><img src=<%#Eval("productImageUrl")%> alt=""  id="i1" runat="server"/></div></div>
                        <h5><%#Eval("productname") %></h5>
                        <div class="qtya">Qty</div>
                        
                        
                        
                            <asp:ImageButton ID="ImageButton1" runat="server" class="qc" ImageUrl="images/less.jpg" CommandArgument=<%#Eval("productid")%> CommandName="less"/>
                            
                        
                     
                  
                        
                            <asp:TextBox ID="TextBox1" runat="server" Text=<%#Eval("quantity")%> class="qty-value" ReadOnly="True"></asp:TextBox>
                     
                        
                                              
                         <asp:ImageButton ID="ImageButton2" runat="server" class="qc" ImageUrl="images/more.jpg" CommandArgument=<%#Eval("productid")%> CommandName="more"/>
                           
                      
                        <div class="cart-pr">Rs.<%#Eval("price")%></div>
                    </div>
                
                        </ItemTemplate>
                        </asp:Repeater>
                	
                	
                
                    <div class="clear"></div>
                    
                </div>
                
                <p class="total">Total : Rs.<asp:Literal ID="Literal3" runat="server"></asp:Literal></p>
                
              
    <asp:Button ID="Button1" runat="server" Text="Check Out" class="check-out" 
                            onclick="Button1_Click"  />
                </div>
                
                    </ContentTemplate>
                </asp:UpdatePanel>
              