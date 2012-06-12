function setText(element, text) {
    if (element.innerText != undefined) {
        element.innerText = text;
    }
    else {
        element.textContent = text;
    }
}

function encodeHtml(buffer) {
    if (buffer) {
        buffer += "";
        return buffer.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
    }

    return "";
}

function encodeAmpersand(buffer) {
    if (buffer) {
        buffer += "";
        return buffer.replace(/&/g, "%26");
    }

    return "";
}

function linebreaksForHtml(buffer) {
    if (buffer) {
        buffer += "";
        return buffer.replace(/\r?\n/g, "<br>");
    }

    return "";
}

function getXMLTagValue(xmlData, tagName) {
  var value = "";

  try {
    if(xmlData.getElementsByTagName(tagName)[0].firstChild != null)
      value = xmlData.getElementsByTagName(tagName)[0].firstChild.nodeValue;
  }
  catch (e) {
    alert("Problem parsing xml tag: " + tagName + "\n" + e.description);
  }

  return value;
}

function navigateToLiveLink(url) {
    window.open("liveLink.htm?url="+url,"","resizable=yes,scrollbars=yes,status=yes,location=yes,menubar=yes,toolbar=yes,width=800,height=500");
}

function getCheckedCount(element) {
    var counter = 0;
    var boxes = document.getElementsByName(element);
    for (var i = 0; i < boxes.length; i++)
    {
        if (boxes[i].checked)
            counter++;
    }
    return counter;
}
  function getRadioButtonSelectedCount(formName) {
    var fields = document[formName].getElementsByTagName("INPUT");
    var count = 0;

    for (var i = 0; i < fields.length; i++) {
        if (fields[i].type =='radio') {
            if (fields[i].checked == true) {
                count++;
            }
        }
    }

    return count;
  }

  function getRadioButtonValue(formName) {
    var fields = document[formName].getElementsByTagName("INPUT");
    var value = null;

    for (var i = 0; i < fields.length; i++) {
        if (fields[i].type =='radio') {
            if (fields[i].checked == true) {
                return fields[i].value;
            }
        }
    }

    return value;
  }

  function getRadioButtonValueForElement(formName, elementname) {
    var form = document[formName];
    var fields = form.elements[elementname];
    var value = null;

    for (var i = 0; i < fields.length; i++) {
      if (fields[i].checked == true) {
          return fields[i].value;
      }
    }

    return value;
  }

  function setRadioButtonValue(formName, value) {
    var fields = document[formName].getElementsByTagName("INPUT");

    for (var i = 0; i < fields.length; i++) {
        if (fields[i].type =='radio') {
            if (fields[i].value == value) {
                fields[i].checked = true;
                return;
            }
        }
    }
  }

  function isDayPast(value) {
    var valid = true;
    var selectedDate = new Date(value[0], value[1]-1,value[2]);
    var now = new Date();

    // this zero's out hr/min/sec so comparison is same since selected date doesn't have times.
    now = new Date(now.getFullYear(), now.getMonth(), now.getDate());

    if (selectedDate < now)
      valid = false;

    return valid;
  }
    
function clearInputValues(formName) {
  var fields = document[formName].getElementsByTagName("INPUT");

  for (var i = 0; i < fields.length; i++) {
     fields[i].value = "";
  }
}

function removeSpaces(value) {
  var newValue = value.replace(/\s/g, "");
  return newValue;
}

function ltrim(str){
  return str.replace(/^\s+/, '');
  }

  function rtrim(str) {
      return str.replace(/\s+$/, '');
  }

  function alltrim(str) {
      return str.replace(/^\s+|\s+$/g, '');
  }

function setSelectedOption(elementId, option) {
    var select = document.getElementById(elementId);

    for (i = 0; i < select.options.length; i++) {
        if (select.options[i].value == option) {
            select.options[i].selected = "true";
            break;
        }
    }
}

function replaceAllNonNumbers(value) {
 return value.replace(/[^0-9]/g, "");
 }


