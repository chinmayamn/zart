<%@ Page Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" Inherits="product_details"  Codebehind="product-details.aspx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
    <%@ Register Assembly="Media-Player-ASP.NET-Control" Namespace="Media_Player_ASP.NET_Control"
    TagPrefix="cc1" %>
    <%@ Register Src="~/cart.ascx" TagName="cart" TagPrefix="ucl"  %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
 
		<script src="selectable/jquery-1.8.0.js"></script>
	<script src="selectable/ui/jquery.ui.core.js"></script>
	<script src="selectable/ui/jquery.ui.widget.js"></script>
	<script src="selectable/ui/jquery.ui.mouse.js"></script>
	<script src="selectable/ui/jquery.ui.selectable.js"></script>
	
	<link rel="stylesheet" href="selectable/jquery.ui.selectable.css">
		
  <style>
	#selectable { float:left;}
	#selectable .ui-selecting { background: #FECA40; }
	#selectable .ui-selected { background: #F39814; color: white; }
	#selectable { list-style-type: none; margin: 0; padding: 0;  display:block;padding:0 6px; line-height:20px; text-align:center; margin:0 3px 3px 0;}
		</style>
  	<script>
	$(function() {
		$( "#selectable" ).selectable({
    selecting: function (event, ui) {
        $(event.target).children('.ui-selecting').not(':first').removeClass('ui-selecting');
    }
});
});
	</script>
	
<script src="SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>

<link href="SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />

        <div class="content">
        
        	<ul class="navi">
        	     <asp:Repeater ID="Repeater3" runat="server">
                    
                     <ItemTemplate>
                     
                     <li><a href=index.aspx>Home</a></li>
                	<li><a href=products.aspx?cid=<%#Eval("id")%>><%#Eval("category") %></a> </li>
                	<li><a href=products.aspx?sid=<%#Eval("id1")%>><%#Eval("category1") %></a> </li>
                   	<li><a href=products.aspx?ssid=<%#Eval("id2")%>><%#Eval("category2") %></a>  </li>
                     </ItemTemplate>
                    </asp:Repeater>
            </ul>	
            
            <!-- Main Image content	-->
            <div class="full-w">
                <!-- Image Preview	-->
                <div class="pro-preview">
                	<div id="thumbs">
                	
                        <asp:Repeater ID="Repeater1" runat="server">
                        
                        <ItemTemplate>
                        
                        <div class="th-img">
                        <img src=<%#Eval("image")%> id="i1" runat="server" alt="" />
                        
                        </div>
                        
                        
                        <div class="gap"></div>
                        </ItemTemplate>
                        </asp:Repeater>
                        
                      
                    </div>
                    
                    <div class="img-view">
                        <div class="big-view">
                            <img class="largeImage" id="i2" runat="server"  alt="" />
                        </div>
					</div>
					<script type="text/javascript">
						$('#thumbs').delegate('img','mouseover', function(){
							$('.largeImage').attr('src',$(this).attr('src').replace('thumb','large'));
						});
                	</script>
                    <div class="pro-name">
                    	<h2>
                            
                            
                            <asp:Literal ID="lblproduct" runat="server"></asp:Literal>
                            
                            </h2>
                        <h5>View Large</h5>
                    </div>	
                </div>
                <!-- End of Image preview	-->
                
                <!-- Product Details	-->
                <div class="pro-details">
                	<div class="brand">
                    	<p><b>Brand : </b>
                            
                            
                            <asp:Literal ID="lblbrand" runat="server"></asp:Literal>
                            
                            </p>
                        <div class="stars">
                           <cc1:Rating ID="Rating1" runat="server" CssClass="mains" ReadOnly="true" StarCssClass="ratingEmpty" WaitingStarCssClass="ratingSaved" EmptyStarCssClass="ratingEmpty" FilledStarCssClass="ratingFilled"   CurrentRating='<%# Convert.ToInt16( Eval("rating")) %>'>
                                    </cc1:Rating>
                        </div>
                    </div>
                    <div class="pricing">
                    	<div class="main-price">
                           
                            
                            
                            <asp:Literal ID="lblactual" runat="server" ></asp:Literal>
                        </div>
                        <div class="non-price">
                        	<p><span>MRP</span><em><del>
                        	
                        	<asp:Label ID="lblmrp" runat="server" Font-Strikeout="True"></asp:Label>
                        	
                        	</del></em></p>
							<p><span>You Save</span><em>
							
							<asp:Literal ID="lbldiscount" runat="server"></asp:Literal>
							
							
							
							<asp:Literal ID="lbloff" runat="server"></asp:Literal>
							
							</em></p>
                        </div>
                    </div>
                    <div class="avail">
                    	<div class="ava">
                        	<div class="attr">Availability :</div>
                            <div class="valu">In Stock <img id="i1" runat="server" width="13"  height="13" alt="" /></div>
                        </div>    
                    	<div class="ava">
                        	<div class="attr">Colors :</div>
                            <div class="valu">
                            
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                
                                </asp:DropDownList>
                            	 
                            </div>
                        </div>    
                    	<div class="ava">
                        	<div class="attr">Qty :</div>
                            <div class="valu">
                            
                          
                                <asp:TextBox ID="TextBox1" runat="server" class="qty" ValidationGroup="v1" Text="1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Quantity required" ControlToValidate="TextBox1" ValidationGroup="v1" Text="*"></asp:RequiredFieldValidator> 
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                    ShowMessageBox="True" ShowSummary="False" ValidationGroup="v1" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="^\d+$" 
                                    ErrorMessage="Invalid quantity" ControlToValidate="TextBox1" 
                                    ValidationGroup="v1">*</asp:RegularExpressionValidator>
                          
                            </div>
                        </div>    
                    	<div class="ava">
                        	<div class="attr">Size :</div>
                            <div class="valu">
                            	<div  class="size">
                            	
                            	
                                  
                                  <asp:Literal ID="Label1" runat="server" Visible=false></asp:Literal>
                                
                                  
                              
                                    <asp:Repeater ID="Repeater2" runat="server"  onitemcommand="Repeater2_ItemCommand">
                                        
                                      
                                    <ItemTemplate>
                              
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument=<%#Eval("size") %> CommandName="size">   <%#Eval("size") %> </asp:LinkButton>
                                                                   
                                    
                                     
                                    </ItemTemplate>
                                   
                                    </asp:Repeater>
                                	   
                                
                                </div>
                            </div>
                        </div>
                        <div class="ava">
                        	<div class="attr">
                            
                                
                              
                                <asp:Button ID="Button1" runat="server" Text="Add to Cart" class="add-cart"  ValidationGroup="v1"
                                    onclick="Button1_Click"/>
                        	
                        	
                        	</div>
                            <div class="valu">
                          
                                <asp:LinkButton  class="wishlist" ID="LinkButton2" runat="server" 
                                    onclick="LinkButton2_Click">Add to Wishlist</asp:LinkButton>
                            
                            </div>
                        </div>
                    </div>
                    
                </div>
                <!-- End of Product Details	-->
                
                <!-- Right Shopping Cart	-->
             
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode=Conditional>
                <ContentTemplate>
                
              
             
                   <ucl:cart ID="cart1" runat="server" />
           </ContentTemplate>
                </asp:UpdatePanel>
             
                <!-- End of Right Shopping Cart	-->
            </div>
            <!-- End of Main Image content	-->
            
            <!-- Reviews and Similar products	-->
            <div class="full-w">
            	
                <!-- Reviews Tab	-->
                <div class="reviews-tabs">                
                  <div id="TabbedPanels1" class="TabbedPanels">
                    <ul class="TabbedPanelsTabGroup">
                      <li class="TabbedPanelsTab">Product Details</li>
                      <li class="TabbedPanelsTab">Reviews</li>
                     <%--  <li class="TabbedPanelsTab">Video</li>--%>
                    </ul>
                    <div class="TabbedPanelsContentGroup">
                      <div class="TabbedPanelsContent">
                      
                          
                          
                          
                          <asp:Literal ID="lbldetails" runat="server"></asp:Literal>
                      </div>
                      <div class="TabbedPanelsContent">
                      
                      
                      
                      <asp:Literal ID="lblreviews" runat="server"></asp:Literal>
                      
                      </div>
                   <%--  <div class="TabbedPanelsContent">
                     
                     <div align="center">
                     
                   
                      <asp:Literal id="Literal1" runat="server"></asp:Literal>  </div>
                     </div>
                   --%>
                    </div>
                   
                  </div>
                </div>
                <!-- End of Reviews	Tab	-->
                
                <!-- Similar Products	-->
                <div class="similar">
                	<h3>Similar Products</h3>
                	
                    <asp:Repeater ID="Repeater4" runat="server">
                    <ItemTemplate>
                    <a href=product-details.aspx?id=<%#Eval("id") %> class="simil">
                    	<span class="sim-img"><em><img src=<%#Eval("image")%> width="57"  id="i1" runat="server" alt="" /></em></span>
                        <span class="sim-h"><%#Eval("pname") %></span>
                        <del>Rs.<%#Eval("mrp") %></del>
                        <span class="sim-pri">Rs.<%#Eval("actual") %></span>
                    </a>
                   
                    </ItemTemplate>
                    </asp:Repeater>
                    
                </div>
                <!-- End of Similar Products	-->
                
            </div>	
            <!-- End of Reviews and Similar Products	-->
            
            <!-- You may like this	-->
            <div class="you-like">
            	<h4>You May Like This</h4>
            	
                <asp:Repeater ID="Repeater5" runat="server">
                <ItemTemplate>
                <a href=product-details.aspx?id=<%#Eval("id") %>>
                	<span class="like-img"><em><img src=<%#Eval("image")%> width="36"  id="i3" runat="server" /></em></span>
                    <span class="like-head"><%#Eval("pname") %></span>
                    <span class="like-price">Price :    <del>Rs.<%#Eval("mrp") %></del>     <em>Rs.<%#Eval("actual") %></em></span>
                </a>
               
                </ItemTemplate>
                </asp:Repeater>
                
            </div>
            <!-- End of You may like this	-->
            
            
            
            
      </div>
        <!-- ENd of content	-->
        <script type="text/javascript">
<!--
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
//-->
</script>
</asp:Content>

