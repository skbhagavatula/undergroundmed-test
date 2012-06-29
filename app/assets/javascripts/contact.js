
function submitContact()    {
  showProgressDialog("Saving your selections...");

  var makeVideo =   false;
  var reviewVideo =  false;
  var addToList = false;

  if($("#makeVideo").attr("checked"))
    makeVideo = true;

  if ($("#reviewVideo").attr("checked"))
    reviewVideo = true;

  if ($("#addToList").attr("checked"))
    addToList = true;

  var comments =   $("#comments").attr("value") ;
  var name =  $("#name").attr("value") ;
  var email =  $("#email").attr("value") ;

  // for debugging
//  var encodedEmail = encodeURIComponent(encodeHtml(email));
//  var encodedString = xor_str(encodedEmail);

  $.ajax({
    url: "show_videos/save_contact",
    type: "POST",
    dataType: 'json',
    data:  { video: makeVideo,
                review: reviewVideo,
                addToList: addToList,
                comments: encodeURIComponent(encodeHtml(comments)),
                name: xor_str(encodeURIComponent(encodeHtml(name))),
                email: xor_str(encodeURIComponent(encodeHtml(email))) },
    success: function(data, status, xhr) {
      showSaveMsg(data[0], "Saved") ;
    },
    error: function(xhr, status, error) {
      showMsg(error);
    }
  });
}

function validateContact() {
  var validate = true;

  var email =  $("#email").attr("value") ;

  if(email == undefined || email.length == 0)  {
    alert("Please enter your email address");
    return false;
  }

   /*
   Very simple email validation to validate pattern: anystring@anystring.anystring
   Most regex that I found only validated english characters. Normal international chars
   were reported as invalid.
    */
    var filter = /\S+@\S+\.\S+/;
    if (!filter.test(email)) {
      alert('Please provide a valid email address');
      return false;
    }

  return validate;
}

var contactDialog = null;

function createContactDialog() {

  contactDialog = $("#contactDlg")
      .dialog({
        autoOpen: false,
        modal: true,
        show: true,
        hide: true,
        width: 500,
        title: "Get Involved",
        buttons: { "I'd like to help": doValidate , "Cancel": function() { $(this).dialog("close"); } }
      });
}

var doValidate = function () {
  if (validateContact()) {
    $("#contactDlg").dialog("close");
    submitContact();
  }
  else return false ;
}

function showContactDialog() {
  if(contactDialog != null) {
    $('#contactDlg').dialog('open');
  }
}

function hideContactDialog() {
  if(contactDialog != null) {
    $('#contactDlg').dialog('close');
  }
}

function showSaveMsg( msg, title) {
  hideProgressDialog();
  showinfoDialog(msg, title);
}

function xor_str(value) {

  var to_enc = value;

  var result ="";

  for(i=0;i<to_enc.length;++i)  {
    result+=String.fromCharCode(xor_key^to_enc.charCodeAt(i));
  }

  return result;
}
