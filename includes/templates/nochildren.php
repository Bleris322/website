<template id="nochildrentp">
  <div style="text-align:center;" class="adminlauncherfix"></div>
  <script>
    if (webuser.isWebAdmin()) {
      var admnlauncher=new NodeMale();
      admnlauncher.myNode=thisNode;
      admnlauncher.buttons=[{
	template: document.getElementById("butaddnewnodetp"),
      }];
      admnlauncher.refreshView(thisElement, document.getElementById("admnbutstp"));
    }
    else {
      thisElement.innerHTML='';
    }
  </script>
</template>