<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	
	
<!DOCTYPE html>
<html>
<head>
<title>Book Library: Delete Book</title>
<link rel="stylesheet" href="./css/bookCSS.css" type="text/css"/>
<script src="delete.js" type="text/javascript"></script>
</head>
<body>
<h1>Delete Book</h1>

<div class="deleteForm">
  <form id="deleteForm">
    <div class="form-group">
      <label for="exampleInputID">Enter book ID</label>
       <input name="id" type="text" class="form-control" id="exampleInputId" placeholder="Book ID" required>
    </div>
  
    <div class="form-check">
      <input type="checkbox" class="form-check-input" id="exampleCheck1">
      <label class="form-check-label" for="exampleCheck1">Confirm you want to delete this</label>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>


<script>
  document.getElementById("deleteForm").addEventListener("submit", function(event) {
    event.preventDefault(); // Prevent the default form submission

    var bookId = document.getElementById("exampleInputId").value;
    var confirmDelete = document.getElementById("exampleCheck1").checked;

    if (confirmDelete) {
      var address = "http://localhost:8080/BookLibraryProjectREST/bookapis/" + bookId;
      ajaxDelete(address, "result"); // Make the AJAX DELETE request
    } else {
      alert("Please confirm the deletion.");
    }
  });

  function ajaxDelete(address, resultRegion) {
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
      if (request.readyState === 4) {
        if (request.status === 200) {
          // Deletion successful
          htmlInsert(resultRegion, "Book deleted successfully.");
        } else {
          // Delete failed
          htmlInsert(resultRegion, "Error deleting book.");
        }
      }
    };
    request.open("DELETE", address, true);
    request.setRequestHeader("Accept", "application/json");
    request.send(null);
  }

  function htmlInsert(id, htmlData) {
    document.getElementById(id).innerHTML = htmlData;
  }
</script>



</body>
</html>
	
	
