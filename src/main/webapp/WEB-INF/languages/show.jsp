<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Language</title>
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
                    <a href="/languages/${language.id}/edit" class="nav-link">Edit</a>
                  </li>
                </ul>
              </div>
          </div>
   </nav>
	<section class="py-5"></section>	


<section>
	<div class="container">
		<div class="col-lg-6 offset-lg-3">
			<h1><c:out value="${language.name}"/></h1>
			<p>Creator: <c:out value="${language.creator}"/></p>
			<p>Version: <c:out value="${language.currentVersion}"/></p>
			<div class="d-flex flex-row justify-evenly">
				<a href="/languages/${language.id}/edit">Edit</a>
				<form action="/languages/${language.id}" method="post">
				    <input type="hidden" name="_method" value="delete">
				    <input class="text-decoration-underline text-primary border-0 bg-transparent" type="submit" value="Delete">
				</form>
			</div>
		</div>
	</div>
</section>  



</body>
</html>