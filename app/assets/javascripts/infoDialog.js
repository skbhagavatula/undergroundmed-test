var infoDialog = null;

function createInfoDialog() {

  infoDialog = $("#infoDlg")
      .dialog({
        autoOpen: false,
        modal: true,
        show: true,
        hide: true,
        width: 500,
        buttons: { "Close": function() { $(this).dialog("close"); } }
      });
}

function showinfoDialog(msg, title) {
  if(infoDialog != null) {
    var htmlMsg =  "<p>"+msg+"</p>";

    infoDialog.html(htmlMsg);
    $('#infoDlg').dialog('option', 'title', title);
    $('#infoDlg').dialog('open');
  }
}

