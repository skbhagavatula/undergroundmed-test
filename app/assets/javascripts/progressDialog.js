var progressDialog = null;

function createProgressDialog() {

  progressDialog = $("#progressDlg")
    .dialog({
      autoOpen: false,
      modal: true,
      show: true,
      hide: true,
      title: "Please wait...."
    });
  $(".ui-dialog-titlebar-close").hide();
}

function showProgressDialog(msg) {
  if(progressDialog != null) {
    $("#progressText").text(msg) ;
//    $("#progressImg").attr("src", "/images/progress.gif") ;
    progressDialog.dialog('open');
  }
}

function hideProgressDialog() {
  if(progressDialog != null)
    progressDialog.dialog("close");
}

function showMsg(msg) {
  hideProgressDialog();
  alert(msg);
}

