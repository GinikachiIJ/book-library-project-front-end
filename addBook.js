var request;

function getRequestObject() {
  if (window.XMLHttpRequest) {
    return new XMLHttpRequest();
  } else if (window.ActiveXObject) {
    return new ActiveXObject("Microsoft.XMLHTTP");
  } else {
    return null;
  }
}

function showResponseText(request, resultRegion) {
  if (request.readyState === 4 && request.status === 200) {
    htmlInsert(resultRegion, request.responseText);
  }
}

function ajaxResult(address, resultRegion) {
  var request = getRequestObject();
  request.onreadystatechange = function() {
    if (request.readyState === 4 && request.status === 200) {
      var books = JSON.parse(request.responseText);
      convert(books);
    }
    showResponseText(request, resultRegion);
  };
  request.open("POST", address, true);
  request.setRequestHeader("Accept", "application/json");
  request.send(null);
}

function convert(books) {
  // Use the parsed 'books' array as needed
  console.log(books);

  // Perform further processing or display in HTML table
}

function htmlInsert(id, htmlData) {
  document.getElementById(id).innerHTML = htmlData;
}

