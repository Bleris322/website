//Some functions that will be applied to dom elements
function activeedition(thisNode, field){
  if (this.allowedHTML) var myproperty="innerHTML";
  else var myproperty="textContent";
  //field contains the previous value
  //removing the initial value for null values
  if (this[myproperty]!=thisNode.properties[field.name]) {
    if (thisNode.properties[field.name]) this[myproperty]=thisNode.properties[field.name];
    else this[myproperty]=null;
  }
  field.setAttribute("value",this[myproperty]);
  this.setAttribute("contenteditable","true");
  this.className+=" contenteditableactive";
  this.focus();
  this.onblur=function() {
    this.setAttribute("contenteditable","false");
    this.className=this.className.replace(/ contenteditableactive/g,'');
    //empty values are not allowed
    if (this[myproperty]=="") {
       this[myproperty]=field.value || websectionsroot.getRelationship({name: "websections_domelements"}).getChild({name: "emptyvallabel"}).properties.innerHTML;
      return false;
    }
    else if (field.value != this[myproperty]) { //just when content change and not void
      field.setAttribute("value",this[myproperty]);
      thisParent=thisNode.parentNode;
      var myresult=new NodeMale();
      var thisElement=this;
      myresult.loadfromhttp(field.form, function(){
        var myelement=new NodeMale();
        myelement.properties.id=thisNode.properties.id;
        myelement.properties[field.name]=field.value;
        thisParent.updateChild(myelement);
	thisNode.dispatchEvent("propertychange", [field.name]);
      });
    }
  };
}

function setSelected() {
  this.className+=" selected";
};
function setUnselected() {
  this.className=this.className.replace(/ selected/g,'');
};
function closesttagname(tagname){
  //if !myreturn.parentElement.tagName => document fragment
  var myreturn=this;
  while(myreturn && myreturn.parentElement.tagName && myreturn.parentElement.tagName!=tagname) {
    myreturn=myreturn.parentElement;
  }
  return myreturn.parentElement;
};