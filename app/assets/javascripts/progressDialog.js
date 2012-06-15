var progressDialog = null;

function createProgressDialog() {

//   progressDialog = $('<div></div>')
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
    var imgsrc = "<img " + "alt='here'" + " src=" + "'/assets/progress.gif'"  + "/>" ;
    var htmlMsg =  "<p>"+msg+"</p>";

    progressDialog.html(htmlMsg);
//    $("#imgArea").innerHTML =  imgsrc;
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

