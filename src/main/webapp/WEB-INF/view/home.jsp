<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<head>
	<title> Home Page</title>
</head>
<body>
	<h2> Home Page</h2>
	<hr>
	<p>
        User: <security:authentication property="principal.username" />
        <br><br>
        Role(s): <security:authentication property="principal.authorities" />
    </p>
    <hr>
	<p>
	    Welcome to the home page!
	</p>
	<hr>

	<security:authorize access="hasRole('MANAGER')">
	    <p>
	        <a href="leaders">Leadership Meeting</a>
	        (only for Managers)
	    </p>
	  </security:authorize>
	  <security:authorize access="hasRole('ADMIN')">
	    <p>
	        <a href="systems">Admins Meeting</a>
	        (only for Admins)
	   </p>
	  </security:authorize>
    <br>
	<form:form action="${pageContext.request.contextPath}/logout"
    							   method="POST">
    	<input type="submit" value="Logout" />
    </form:form>
</body>
</html>