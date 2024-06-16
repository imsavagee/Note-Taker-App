<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="All_JS_CSS.jsp"%>

<head>
<meta charset="UTF-8">
<title>Add Notes</title>
</head>
<body>

	<div class="container-fluid m-0 p-0 ">
		<%@include file="Navbar.jsp"%>
		<h1 class="text-center">Add notes Here</h1>
		<br>
		<!--This is form  -->
		<form action="SaveNoteServlet" method="post" class="m-3">
			<div class="mb-3">
				<label for="title" class="form-label">Title
					</label>
					 <input type="text" required class="form-control" name="title"
					id="title" placeholder="Please enter your title here">
			</div>
			<div class="mb-3">
				<label for="content" class="form-label"> Notes
		</label>
				<textarea required class="form-control" id="content"
					rows="3" placeholder="Write your notes here" name="content"></textarea>
			</div>
			<div  class="text-center container">
				<button type="submit" class="btn btn-primary">Add</button>
			
			</div>
			
		</form>

	</div>

</body>
</html>