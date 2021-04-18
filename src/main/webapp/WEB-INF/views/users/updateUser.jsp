<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="playtogether" tagdir="/WEB-INF/tags"%>

<playtogether:layout pageName="registroPlaytogether">
	<jsp:body>
	<div class="thirteen">
	<h1>
		Editar el usuario <c:out value="${usuario.user.username}" />
	</h1>
	</div>
	<div class="crearMeeting">
	<form:form modelAttribute="usuario" class="form-horizontal"
				id="add-usuario-form">
		
			<playtogether:inputField label="Nombre" name="name" />
			<playtogether:inputField label="Correo" name="correo" />
			<playtogether:inputField label="Telefono" name="phone" />
			
			<playtogether:inputField label="*Contraseņa" name="user.password" />
	
			<playtogether:inputField label="Fecha Nacimiento" name="birthdate"
				 />
					<div class="ocultar">
			<playtogether:inputField label="Usuario" name="user" />
				</div>
		<div class="form-group">
			<button class="botonMeeting" type="submit">
			<b>Modificar</b>
			</button>
		</div>
		<div class="form-group">
						<button class="botonMeeting" style="font-size: 0.8em; margin-left: 22.72em; " onclick="location.href='/myprofile/${usuario.id}';" type="button">
							<b>Volver a perfil</b>
						</button>
					</div>
		<br>
			
			</form:form>
		</div>
	
	 </jsp:body>
</playtogether:layout>