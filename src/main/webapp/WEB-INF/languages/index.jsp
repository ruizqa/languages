<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Languages</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/styles.css"/>
</head>
<body>
   <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-1 fixed-top">
       <div class="container">
         <a class="navbar-brand">Languages Core Assignment</a>
       </div>
   </nav>
	<section class="py-5"></section>	
	<section>
		<div class="container">
		<div class="col-lg-6 offset-lg-3">
			<h1>All Languages</h1>
			<table class="table table-striped table-hover">
			    <thead class="table-dark">
			        <tr>
			            <th>Name</th>
			            <th>Creator</th>
			            <th>Version</th>
			            <th>Action</th>
			        </tr>
			    </thead>
			    <tbody>
			        <c:forEach items="${languages}" var="lang">
			        <tr>
			            <td><a href="/languages/${lang.id}"><c:out value="${lang.name}"/></a></td>
			            <td><c:out value="${lang.creator}"/></td>
			            <td><c:out value="${lang.currentVersion}"/></td>
			            <td>
			            	<div class="d-flex flex-row justify-evenly">
				            	<form action="/languages/${lang.id}" method="post">
								    <input type="hidden" name="_method" value="delete">
								    <input class="text-decoration-underline text-primary border-0 bg-transparent" type="submit" value="Delete">
								</form>
								
				            	<a class="text-decoration-underline text-primary" href="/languages/${lang.id}/edit">Edit</a>
			            	</div>
			            </td>
			        </tr>
			        </c:forEach>
			    </tbody>
			</table>	
		
			</div>
		</div>
	</section>
	
	<section>
		<div class="container">
			<div class="col-lg-6 offset-lg-3">
				<form:form action="/languages" method="post" modelAttribute="language" class="col">
			    <div class="form-group my-2">
			        <form:label path="name" class="form-label">Name</form:label>
			    </div>
			    <div class="form-group my-2">    
			        <form:errors path="name"/>
			        <form:input path="name" class="form-control"/>
			    </div>
			    <div class="form-group my-2">
			        <form:label path="creator" class="form-label">Creator</form:label>
			    </div>
			    
			    <div class="form-group my-2">
			        <form:errors path="creator"/>
			        <form:textarea path="creator" class="form-control"/>
			    </div>
			    
			    <div class="form-group my-2">
			        <form:label path="currentVersion" class="form-label">Version</form:label>
			    </div>
			    <div class="form-group my-2">    
			        <form:errors path="currentVersion"/>
			        <form:input path="currentVersion" class="form-control"/>
			    </div>
			    <div class="text-center">    
			    	<input class="btn btn-primary text-center my-2" type="submit" value="Submit"/>
			    </div>
			</form:form>
			</div>
		</div>
	</section>
</body>
</html>