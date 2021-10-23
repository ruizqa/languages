<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Languages</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
   <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-1 fixed-top">
       <div class="container">
         <a class="navbar-brand">Languages Core Assignment</a>
         <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navmenu"
              >
                <span class="navbar-toggler-icon"></span>
              </button>
      
              <div class="collapse navbar-collapse" id="navmenu">
                <ul class="navbar-nav ms-auto">
                  <li class="nav-item">
                    <a href="/languages" class="nav-link">Dashboard</a>
                  </li>
                  <li class="nav-item">
                 	<form action="/languages/${language.id}" method="post" class="nav-link">
					    <input type="hidden" name="_method" value="delete">
					    <input class="text-decoration-underline text-primary border-0 bg-transparent" type="submit" value="Delete">
					</form>
                  </li>
                </ul>
              </div>
       </div>
   </nav>
	<section class="py-5"></section>
	
	<section>
		<div class="container">
			<div class="col-lg-6 offset-lg-3">
				<h1>Edit Language</h1>
				<form:form action="/languages/${language.id}" method="post" modelAttribute="language">
				    <input type="hidden" name="_method" value="put">
				    <p>
				        <form:label path="name">Name</form:label>
				        <form:errors path="name"/>
				        <form:input path="name"/>
				    </p>
				    <p>
				        <form:label path="creator">Creator</form:label>
				        <form:errors path="creator"/>
				        <form:textarea path="creator"/>
				    </p>
				    <p>
				        <form:label path="currentVersion">Version</form:label>
				        <form:errors path="currentVersion"/>
				        <form:input path="currentVersion"/>
				    </p>
				    <div class="text-center">    
				    	<input class="btn btn-primary" type="submit" value="Submit"/>
				    </div>
				</form:form>
			
			
			</div>
		</div>
	</section>

</body>
</html>