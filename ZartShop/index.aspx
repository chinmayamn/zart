<%@ Page Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" Inherits="index"  Codebehind="index.aspx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<style type="text/css">
    .mains
    {
    	padding-left:12px; float:left;
    }
.ratingEmpty
{
background: url(images/star.png) no-repeat -11px 0px ;
width:11px;
height:11px;margin-top:0px;
}
.ratingFilled
{
background: url(images/star.png) no-repeat 0px 0px;
width:11px;
height:11px; 
margin-top:0px;
}
.ratingSaved
{
background: url(images/star.png) no-repeat;
width:16px;
height:14px;
}
</style>

<!-- Banner script	-->
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/jquery-ui.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="banner/jquery.mSimpleSlidebox.css" type="text/css" />
<script src="banner/jquery.mSimpleSlidebox.js" type="text/javascript"></script>
<!-- End of Banner script	-->

 	<!-- Content	-->
        <div class="content">
        	
            <!-- Banner Nav	-->
            <div class="banner-nav">
                	<script type="text/javascript">
					$(document).ready(function(){
						$("#slidebox_1").mSlidebox({
							controlsPosition:{
								buttonsPosition:"outside",
								thumbsPosition:"outside"
							}
						});
					});
					</script>
            	<div class="banner">
                	<div id="slidebox_1" class="slidebox">
                        <ul>
                        
                            <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                            <li><img src=<%#Eval("images") %> alt="" id="img1" runat="server" />
                            <b class="ban-text"><%#Eval("text") %></b></li>
                           
                            
                            
                            </ItemTemplate>
                            </asp:Repeater>
                                 </ul>
                    </div>
                </div>
                
                <div class="ban-right">
                
                    <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>
                    <img  src=<%#Eval("image")%> style="width:100%" height="271" alt="" id="img2" runat="server"/>
               
                    </ItemTemplate>
                    </asp:Repeater>
                	 </div>
                
            </div>
            <!-- End of Banner Nav	-->
            
            <!-- Pros	-->
            <div class="pros">
            	
                <div class="ad">
                	<a href="#"><img src="images/ad1.jpg" width="228" height="269" alt=""  id="img3" runat="server" /></a>
                </div>
                
                <div class="homepro-list">
                	
                    <div class="pro-heading">
                    	<h1 class="pro-hline">New arrivals</h1>
                        <a href="new-arrivals.aspx" class="viewall">View All</a>
                    </div>
                    
                    <div class="p-new">
                    
                    <asp:Repeater ID="Repeater3" runat="server" onitemcommand="Repeater3_ItemCommand" >
                        <ItemTemplate>
                        <div class="pro-new">
                        	<h2><a href=product-details.aspx?id=<%#Eval("id")%>><%#Eval("pname") %></a> </h2>
                            <em><%#Eval("discount") %> %<br />Off</em>
                            <div class="proimg">
                            	<a href=product-details.aspx?id=<%#Eval("id")%>><img src=<%#Eval("image") %>  alt="" id="i1" runat="server"/></a>
                            </div>
                            
                            
                            <div class="pro-dets">
                                <asp:Label ID="Label1" runat="server" Text=<%#Eval("stext")%> ></asp:Label> 
                            
                            </div>
                            
                            <div class="prices">
                            	<p><del>Rs.<%#Eval("mrp") %></del>	<br />	
                                    Rs.<%#Eval("actual") %></p>
                                
                             
                                     <asp:LinkButton ID="LinkButton1" runat="server" class="add-cart" CommandName="add" CommandArgument=<%#Eval("id")%>>Add to Cart</asp:LinkButton>
                                
                          
                               
                                <div class="stars">
                                	
                                    <cc1:Rating ID="Rating1" runat="server" CssClass="mains" ReadOnly="true" StarCssClass="ratingEmpty" WaitingStarCssClass="ratingSaved" EmptyStarCssClass="ratingEmpty" FilledStarCssClass="ratingFilled"   CurrentRating='<%# Convert.ToInt16( Eval("rating")) %>'>
                                    </cc1:Rating>
                                 
                                 
                                                     </div>
                                
                            </div>
                        </div>
                        </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    
                </div>
                
            </div>
            <!-- End of Pros	-->
            
            <!-- second pros	-->
            <div class="pros">
            	
                <div class="ad">
                	<a href="#"><img src="images/ad2.jpg" width="228" height="262" alt="" id="img4" runat="server" /></a>
                </div>
                
                <div class="homepro-list">
                	
                    <div class="pro-heading">
                    	<h1 class="pro-hline">Entertainment gadgets</h1>
                        <a href="entertainment-gadgets.aspx"  class="viewall">View All</a>
                    </div>
                    
                    <div class="gadgets">
                    
                    
                        <asp:Repeater ID="Repeater4" runat="server" onitemcommand="Repeater4_ItemCommand">
                        <ItemTemplate>
                        <div class="gadgs">
                        	<h2><a href=product-details.aspx?id=<%#Eval("id")%>><%#Eval("pname")%></a></h2>
                            <h3>Upto <%#Eval("discount") %>% Off</h3>
                            <div class="gimgs"><div class="gimgg"><a href=product-details.aspx?id=<%#Eval("id")%>><img src=<%#Eval("image")%> alt="" id="i2" runat="server" /></a></div></div>
                           
                             <asp:LinkButton ID="LinkButton2" runat="server" class="yel" CommandName="add" CommandArgument=<%#Eval("id")%>>Add to Cart</asp:LinkButton>
                                
                        </div>
                
                        </ItemTemplate>
                        </asp:Repeater>
                    	
                    </div>
                    
               	</div>
         	</div>
            <!-- End of Second pros	-->
            
            <!-- Third Pros	-->
            <div class="hot-offers">
            	<div class="pro-heading">
                    <h1 class="pro-hline">Hot offers</h1>
                    <a href="hot-offers.aspx" class="viewall">View All</a>
                </div>
                
                <div class="hot-pros">
                
                
                
                    <asp:Repeater ID="Repeater5" runat="server">
                    
                    
                    <ItemTemplate>
                    
                    <div class="hotprs">
                    	<div class="hotimgs"><div class="hotsimg"><a href=product-details.aspx?id=<%#Eval("id")%>><img src=<%#Eval("image")%> alt="" id="i3" runat="server"/></a></div></div>
                        <h4><a href=product-details.aspx?id=<%#Eval("id")%>><%#Eval("pname") %></a></h4>
                        <p><del>Rs.<%#Eval("mrp") %></del> <b>Rs.<%#Eval("actual")%></b></p>
                    </div>
          
                    
                    </ItemTemplate>
                    </asp:Repeater>
                	
                </div>
                
            </div>
            <!-- End of Third Pros	-->
            
            <!-- Fourth Pros	-->
            <div class="hot-offers">
            	<div class="pro-heading">
                    <h1 class="pro-hline">Zartshop exclusive</h1>
                    <a href="exclusive.aspx" class="viewall">View All</a>
                </div>
                
                <div class="hot-pros">
                
                    <asp:Repeater ID="Repeater6" runat="server">
                    <ItemTemplate>
                    <div class="hotprs">
                    	<div class="hotimgs"><div class="hotsimg"><a href=product-details.aspx?id=<%#Eval("id")%> > <img src=<%#Eval("image")%> alt="" id="i4" runat="server"/></a></div></div>
                        <h4><a href=product-details.aspx?id=<%#Eval("id")%>><%#Eval("pname") %></a></h4>
                        <p><del>Rs.<%#Eval("mrp") %></del> <b>Rs.<%#Eval("actual")%></b></p>
                    </div>
          
                	
                    </ItemTemplate>
                    </asp:Repeater>
                	
                </div>
                
        <div class="clear"></div>
            </div>
            <!-- End of Fourth Pros	-->
            
            
        </div>
        <!-- ENd of content	-->
</asp:Content>

