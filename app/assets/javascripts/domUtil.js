	// use this till can figure out how to create a checkbox in dojo
	function createCheckbox(name, id, classname) {
	  return createInputElement("checkbox", name, id, classname, 0, 0, "", "", "");
	}	
	
	function createDiv(styleAttributes) {
		var div = dojo.create("div");
		dojo.attr(div, {style: styleAttributes});
		return div;
	}

	function createInputElement(type, name, id, classname, size, maxlength, value, required, vtype) {
	var element = null;

	  try {
		var arg = "<Input ";
		arg += 'type="' + type + '" ';
		arg += 'name="' + name + '" ';
		arg += 'id="' + id + '" ';
		arg += 'class="' + classname + '" ';
		arg += 'size="' + size + '" ';
		arg += 'maxlength="' + maxlength + '" ';
		arg += 'value="' + value + '" ';
		arg += 'required="' + required + '" ';
		arg += 'vtype="' + vtype + '" ';
		arg += " />";

		element = document.createElement(arg);
	  }
	  catch(err) {
		element = document.createElement('input');
		element.setAttribute('type', type);
		element.setAttribute('name', name);
		element.setAttribute('id', id);
		element.setAttribute('class', classname);
		element.setAttribute('size', size);
		element.setAttribute('maxlength', maxlength);
		element.setAttribute('value', value);
		element.setAttribute('required', required);
		element.setAttribute('vtype', vtype);
	  }
	  return element;
	}
	
	// table elements	
	function createTableRow(tableRef, className) {
	  var newRow = tableRef.insertRow(-1);
	  newRow.className = className;
	  return newRow;
	}

	function createTextCell(tableRow, className, text, width) {
	  var newCell = tableRow.insertCell(tableRow.cells.length);
	  newCell.className=className;
	  newCell.style.width = width;
	  newCell.appendChild(document.createTextNode(text));
	  return newCell;
	}

	function createElementCell(tableRow, className, element, width) {
	  var newCell = tableRow.insertCell(tableRow.cells.length);
	  newCell.className=className;
	  newCell.style.width = width;
	  newCell.appendChild(element);
	  return newCell;
	}	