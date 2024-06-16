<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Notes:Note Taker</title>

<%@ include file="All_JS_CSS.jsp"%>

</head>
<body>

	<div class="container-fluid m-0 p-0">
		<%@include file="Navbar.jsp"%>
		<div class="container m-3 ">
			<h1 class="text-uppercase">All Notes:</h1>

			<div class="row">
				<div class="col-12">

					<%
					Session s = FactoryProvider.getFactory().openSession();
					Query q = s.createQuery("from Note");
					List<Note> list = q.list();
					for (Note note : list) {
						 		out.println(note.getID()+" : "+note.getTitle()+" : " + note.getContent()+"<br>");
						 
					%>
					<div class="card text-center flex " style="width: 90vw;">
						<div class="card-body">
							<h4 class="card-title mb-3">
								Title:
								<%=note.getTitle()%>
							</h4>
							<h6 class="card-subtitle mb-3 text-body-secondary">
								ID:
								<%=note.getID()%>
							</h6>
							<h6 class="card-subtitle mb-3 text-body-secondary" >Date : <%=note.getAddedDate() %></h6>
							<p class="card-text ">
								Content:
								<%=note.getContent()%>
							</p>
							<a class="btn btn-primary" href="#">Edit</a>
						
							<a class="btn btn-danger" href="deleteServlet?note_id=<%=note.getID() %>">Delete</a>
						</div>
					</div>
					<br>
					<%
					}
					s.close();
					%>


				</div>
			</div>





		</div>
	</div>
</body>
</html>