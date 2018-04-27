<template id="catalogtp">
  <table class="catalog">
    <tr>
      <td>
	<div class="flapscontainer">
	  <div style="display:inline;"></div>
	  <script>
	    thisNode.addEventListener("refreshChildrenView", function() {
	      if (this.children==0){
		var element=this.addChild(new NodeMale());
		element.myTp=document.getElementById("nochildrentp").content;
		element.myContainer=this.childContainer;
		element.refreshView();
	      }
	    });
	    thisNode.addEventListener("addNewNode", function(newnodeadded) {
	      newnodeadded.getMyDomNodes()[0].querySelector("a").click();
	    });
	    //When admin delete a node si estaba seleccionado seleccionamos otro y si era el último borramos lo de la parte central
	    thisNode.addEventListener("deleteNode", function(nodedeleted) {
	      if (nodedeleted.selected) {
		if (this.children.length>0 && this.children[0].properties.id) {
		  this.children[0].getMyDomNodes()[0].querySelector("a").click();
		}
	      }
	      if (this.children.length==1 && !this.children[0].properties.id) {
		//remove products in case we just remove all subcategories flaps
		var myContainer=thisElement.parentElement.nextElementSibling;
		myContainer.innerHTML="";
	      }
	    });
	    //showing flaps (after the listeners to refreshChildrenView are added) after refreshing first time we choose the first tab
	    thisNode.refreshChildrenView(thisElement, thisElement.parentElement.querySelector("template").content, function(){
	      if (this.children.length>0) this.children[0].getMyDomNodes()[0].querySelector("a").click();
	    });
	  </script>
	  <template id="flaptp">
	    <table class="flap" style="position:relative;">
	      <tr>
		<td class="tl"></td>
		<td class="t"></td>
		<td class="tr"></td>
	      </tr>
	      <tr>
		<td class="ml"></td>
		<td class="m">
		  <div class="adminlauncher adminsinglelauncher">
		    <a href=""></a>
		    <script>
		      thisElement.textContent=thisNode.properties.cname || websectionsroot.getRelationship({name: "websections_domelements"}).getChild({name: "emptyvallabel"}).properties.innerHTML;
		      thisElement.onclick=function() {
			thisNode.setActive();
			var myform=document.getElementById("formgeneric").cloneNode(true);
			thisNode.setView(myform);
			myform.elements.parameters.value=JSON.stringify({action:"load my tree"});
			thisNode.loadfromhttp(myform, function(){
			  var items=thisNode.getRelationship({name:"itemcategories_items"});
			  items.addEventListener("refreshChildrenView", function() {
			    if (this.children==0){
			      var element=this.addChild(new NodeMale());
			      element.myTp=document.getElementById("nochildrentp").content;
			      element.myContainer=this.childContainer;
			      element.refreshView();
			    }
			  });
			  //lets search for the table that will contain the products
			  var mypointer=thisElement;
			  while (!(mypointer.tagName=="DIV" && mypointer.className=="flapscontainer")) {
			    mypointer=mypointer.parentElement;
			  }
			  var myContainer=mypointer.nextElementSibling;
			  items.childContainer=myContainer;
			  items.childTp=myContainer.nextElementSibling.content;
			  items.refreshChildrenView();
			});
			return false;
		      };
		    </script>
		    <div class="bttopadmn"></div>
		    <div class="btrightnarrow"></div>
		      <script>
		      if (webuser.isWebAdmin()) {
			var admnlauncher=new NodeMale();
			admnlauncher.editpropertyname="cname";
			admnlauncher.editelement=thisElement.parentElement.firstElementChild;
			admnlauncher.butadminposition="horizontal";
			admnlauncher.includeeditbutton=true;
			admnlauncher.myNode=thisNode;
			admnlauncher.refreshView(thisElement,document.getElementById("butopentp"));
		      }
		    </script>
		  </div>
		</td>
		<td class="mr"></td>
	      </tr>
	    </table>
	  </template>
	</div>
	
	<table class="product">
	</table>
	<template>
	  <tr>
	    <td class="product" style="position:relative">
	      <div class="adminlauncher" style="width:100%;">
		<div style="
		position: absolute;
		right: 0px;
		bottom:0px;
		">
		</div>
		<script>
		if (webuser.isWebAdmin()) {
		  var admnlauncher=new NodeMale();
		  admnlauncher.butadminposition="vertical";
		  admnlauncher.includeeditbutton=false;
		  admnlauncher.myNode=thisNode;
		  admnlauncher.refreshView(thisElement,document.getElementById("lnadmnbutstp"));
		}
	      </script>
	      <table style="width:100%;position:relative;">
		<tr>
		  <td class="productimg">
		    <div class="adminsinglelauncher">
		      <img class="productimg">
		      <script>
		      var img=thisNode.properties.image || "noimg.png";
		      thisElement.src="catalog/images/small/" + img;
		      </script>
		      <div class="btinside"></div>
		      <script>
			if (webuser.isWebAdmin()) {
			  var launcher=new NodeMale();
			  launcher.editpropertyname="name";
			  launcher.editelement=thisElement.parentElement.firstElementChild;
			  launcher.myNode=thisNode;
			  launcher.myContainer=thisElement;
			  launcher.myTp="includes/templates/buteditimg.php";
			  launcher.refreshView(thisElement, "includes/templates/buteditimg.php");
			}
		      </script>
		    </div>
		  </td>
		  <td style="width:100%">
		    <table class="textproduct">
		      <tr>
			<td>
			  <div class="adminsinglelauncher">
			    <h3 data-js='
			      thisElement.textContent=thisNode.properties.name || websectionsroot.getRelationship({name: "websections_domelements"}).getChild({name: "emptyvallabel"}).properties.innerHTML;
			    '></h3>
			    <div class="btrightedit">
			    </div>
			    <script>
			      if (webuser.isWebAdmin()) {
				var launcher=new NodeMale();
				launcher.editpropertyname="name";
				launcher.editelement=thisElement.parentElement.firstElementChild;
				launcher.myNode=thisNode;
				launcher.myContainer=thisElement;
				launcher.myTp=document.getElementById("butedittp").content;
				launcher.refreshView();
			      }
			    </script>
			  </div>
			  <div>
			    <div class="adminsinglelauncher">
			      <div style="margin-bottom:1em;" data-js='
				thisElement.innerHTML=thisNode.properties.descriptionshort || websectionsroot.getRelationship({name: "websections_domelements"}).getChild({name: "emptyvallabel"}).properties.innerHTML;
			      '></div>
			      <div class="btrightedit">
			      </div>
			      <script>
				if (webuser.isWebAdmin()) {
				  var launcher=new NodeMale();
				  launcher.editpropertyname="descriptionshort";
				  launcher.editelement=thisElement.parentElement.firstElementChild;
				  launcher.myNode=thisNode;
				  launcher.myContainer=thisElement;
				  launcher.myTp=document.getElementById("butedittp").content;
				  launcher.refreshView();
				}
			      </script>
			    </div>
			  </div>
			</td>
		      </tr>
		      <tr>
			<td>
			  <table class="addtocart">
			    <tr>
			      <td style="position:relative;">
				<div class="adminsinglelauncher">
				  <div style="padding-right:1em;">
				    <span data-js='
					thisElement.textContent=thisNode.properties.price || websectionsroot.getRelationship({name: "websections_domelements"}).getChild({name: "emptyvallabel"}).properties.innerHTML;
				      '>
				    </span>
				    <span> &euro;</span>
				      <div class="btrightedit">
				    </div>
				    <script>
				      if (webuser.isWebAdmin()) {
					var launcher=new NodeMale();
					launcher.editpropertyname="price";
					launcher.editelement=thisElement.parentElement.firstElementChild;
					launcher.myNode=thisNode;
					launcher.myContainer=thisElement;
					launcher.myTp=document.getElementById("butedittp").content;
					launcher.refreshView();
				      }
				    </script>
				  </div>
				</div>
			      </td>
			      <td>
				<a href="" title="" class="btn">
				  <img src="includes/css/images/cart.png"/>
				</a>
				<script>
				  var additemnode=websectionsroot.getRelationship({"name":"websections"}).getChild({"name":"middle"}).getRelationship({"name":"websections_domelements"}).getChild({"name":"addcarttt"});
				  thisElement.title=additemnode.properties.innerHTML;
				  thisElement.onclick=function(){
				    mycart.additem(thisNode);
				    return false;
				  }
				</script>
			      </td>
			    </tr>
			  </table>
			</td>
		      </tr>
		    </table>
		  </td>
		</tr>
	      </table>
	      </div>
	    </td>
	  </tr>
	</template>
      </td>
    </tr>
  </table>
</template>