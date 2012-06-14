var infoDialog = null;

function createInfoDialog() {

  infoDialog = $("#infoDlg")
      .dialog({
        autoOpen: false,
        modal: true,
        hide: "slide",
        width: 500,
        buttons: { "Cancel": function() { $(this).dialog("close"); } }
      });
}

function showinfoDialog(msg, title) {
  if(infoDialog != null) {
    var htmlMsg =  "<p>"+msg+"</p>";

    infoDialog.html(htmlMsg);
    $('#infoDlg').dialog('option', 'title', title);
    infoDialog.dialog('open');
  }
}

