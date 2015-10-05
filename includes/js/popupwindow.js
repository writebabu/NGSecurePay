var panel_names = new Array();
	panel_names[0] = "edit_my_links"
	panel_names[1] = "transfer_edit"

	
	for (i=0;i<panel_names.length;i++)
{
  var panels = new Object();
  YAHOO.util.Event.onDOMReady(function () {
    for (var index in panel_names) {
      var panel_name = panel_names[index];
      var panel_width = '450px';
      if (panel_name == 'edit_page' || panel_name == 'edit_my_links') panel_width = '450px';
      var panel = new YAHOO.widget.Panel(panel_name+'_panel', {
        width:panel_width,
        fixedcenter: true,
        constraintoviewport: true,
        underlay:'none',
        close:true,
        visible:false,
        modal:true} );
      panels[panel_name] = panel;
      panel.render();
    }
  });
  function hide_panels() {
    for (var index in panel_names) {
        var panel_name = panel_names[index];


        document.getElementById(panel_name + '_panel').style.display = "none";
        alert(panel_name);
      panels[panel_name].hide();
    }
}

  function show_panel(panel_name) {
      alert("Wrkng1");
    hide_panels();
    document.getElementById(panel_name+'_panel').style.display = "block";
    panels[panel_name].show();
    document.getElementById(panel_name+'_panel_confirm_button').focus();
  }
	}