
function saveContact() {

  // validate have email and it's valid
  // if not, show a message and return
     if(validateContact())   {
      submitContact();
     }
}

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

  $.ajax({
    url: "save_contact",
    type: "POST",
    dataType: 'json',
    data:  { video: makeVideo,
                review: reviewVideo,
                addToList: addToList,
                comments: encodeURIComponent(encodeHtml(comments)),
                name: encodeURIComponent(encodeHtml(name)),
                email: encodeURIComponent(encodeHtml(email)) },
    success: function(data, status, xhr) {
      showMsg(data) ;
    },
    error: function(xhr, status, error) {
      showMsg(error);
    }
  });
}

function showMsg(msg) {
  hideProgressDialog();
  alert(msg);
}

function validateContact() {
  var validate = true;

  var email =  $("#email").attr("value") ;

  if(email == undefined || email.length == 0)  {
    alert("Please enter your email address");
    return false;
  }

   // got the regex from: http://www.marketingtechblog.com/javascript-regex-emailaddress/
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!filter.test(email)) {
      alert('Please provide a valid email address');
      return false;
    }

  return validate;
}
