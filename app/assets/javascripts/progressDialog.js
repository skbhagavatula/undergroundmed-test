var progressDialog = null;

function createProgressDialog() {

//   progressDialog = $('<div></div>')
  progressDialog = $("#progressDlg")
    .dialog({
      autoOpen: false,
      modal: true,
      hide: "slide"
    });
  $(".ui-dialog-titlebar").hide();
}

function showProgressDialog(msg) {
  if(progressDialog != null) {
//    var imgsrc = "<img src='"+ "/assets/progress.gif"  + "'/>" ;
    var htmlMsg =  "<p>"+msg+"</p>";

    progressDialog.html(htmlMsg);
    progressDialog.dialog('open');
  }
}

function hideProgressDialog() {
  if(progressDialog != null)
    progressDialog.dialog("close");
}