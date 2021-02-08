<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" Inherits="admin_Settings"  Codebehind="Settings.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
$(function () {
 $('#save').click(function () {
 
// var liIds = $('#sortable2 li').map(function(i,n) {
//    return $(n).attr('id');
//}).get().join(',');
//alert(liIds);
             var arrr = new Array(); //Declare array
         var CD = 0;
         var arr = new Array(); //Declare array
         var C = 0;
         var item = new items();//Declare javascript object of items
         //loop to fill array of items data in list
          $('#sortable1 li').each(function (index) {
             arrr[CD] = new items(this.id, CD);
             CD++;
         });
         
         $('#sortable2 li').each(function (index) {
             arr[C] = new items(this.id, C);
             C++;
         });
         
         if(C<=7)
         {
         
         C=0;
          $.ajax({ type: "POST",
             url: "../WebService.asmx/save_categorysort1",
             data: JSON.stringify({ items: arrr }),
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             success: function (response) {
               //  alert("saved");
             },
             error: function (msg) {
               //  alert("error");
             }
          });
		
		 
        // alert(arr);
         //Call web service function and send to it the array as parameter to save new order
         $.ajax({ type: "POST",
             url: "../WebService.asmx/save_categorysort",
             data: JSON.stringify({ items: arr }),
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             success: function (response) {
                 alert("saved");
             },
             error: function (msg) {
                 alert("error");
             }
          });
	
	}
	else
	{C=0;
	alert("Only 6 items are allowed for top menu");
	}
		 	 });

  });

function items(item_id,item_rank) {
     this.item_id = item_id;  this.item_rank = item_rank;
   
 }
 
</script>
<style type="text/css">
	#sortable1, #sortable2, #sortable3 { list-style-type: none; margin: 0; padding: 0; float: left; margin-right: 10px; background: #eee; padding: 5px; width: 143px;}
	#sortable1 li, #sortable2 li, #sortable3 li { margin: 5px; padding: 5px; font-size: 1.2em; width: 120px; }
	</style>
	<div class="demo">
	<ul id="sortable1" class='droptrue'>
	
	All Category
        <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
        <li class="ui-state-default" id=<%#Eval("id")%>><%#Eval("category") %></li>
        </ItemTemplate>
        </asp:Repeater>
	
 <li class="ui-state-default" style=" visibility:hidden">Cannot be dropped..</li>

	
</ul>

<ul id="sortable2" class='dropfalse'>
Home Menu Category
 <asp:Repeater ID="Repeater2" runat="server">
        <ItemTemplate>
       <li class="ui-state-default" id=<%#Eval("id")%>><%#Eval("category") %></li>
        </ItemTemplate>
        </asp:Repeater>
	 <li class="ui-state-highlight" style=" visibility:hidden">Cannot be dropped..</li>

	
</ul>
<input type="button" value="Save" id="save" />
	</div>
</asp:Content>

