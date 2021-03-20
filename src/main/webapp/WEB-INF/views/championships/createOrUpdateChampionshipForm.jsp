<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>




<h2>Crear un torneo</h2>

<form:form action="/championships/add" method="POST" modelAttribute="championship">
	<div>
		<label for="startDate">Fecha Inicio:</label><br> <br> 
		<input type="text" id="startDate" name="startDate"><br> <br> 
		<label for="finishDate">Fecha Fin:</label><br> <br> 
		<input type="text" id="finishDate" name="finishDate"><br> <br> 
			<label for="city">Ciudad:</label><br>
		<br> <input type="text" id="city" name="city"><br> <br>
		<label for="description">Description:</label><br> <br> <input
			type="text" id="description" name="description"><br> <br>
		<input type="submit" value="Enviar">
	</div>
</form:form>