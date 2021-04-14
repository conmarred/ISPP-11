<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="playtogether" tagdir="/WEB-INF/tags"%>
 
<playtogether:layout pageName="championships">
<body>
<div class="cardtitle">
<h1><strong>Partidos del torneo</strong></h1>
<br/>
</div>
<div class="cardlist">
<c:if test="${noUser}">
	<p>No se encontró al usuario deseado.</p>
</c:if>
<c:if test="${noTeam}">
	<p>¡No perteneces a este equipo!</p>
</c:if>
<table id="matchTable" class="table">
        <thead>
            <tr class="rowtable">
                <th style="width: 10%;">Fecha y hora</th>
                <th style="width: 10%;">Primer equipo</th>
                <th style="width: 15%;">Puntos 1º equipo (Anotados por 1º equipo)</th>
                <th style="width: 15%;">Puntos 2º equipo (Anotados por 1º equipo)</th>
                <th style="width: 10%;">Segundo equipo</th>
                <th style="width: 15%;">Puntos 1º equipo (Anotados por 2º equipo)</th>
                <th style="width: 15%;">Puntos 2º equipo (Anotados por 2º equipo)</th>

            </tr>
        </thead>
        <tbody>
            <c:forEach items="${matches}" var="match">
                <tr class="rowtable">
                    <td><c:out value="${match.dateTime}" /></td>
                    <td><c:out value="${match.team1.name}" /></td>
                    <td><c:out value="${match.puntos1}" /></td>
                    <td><c:out value="${match.puntos2}" /></td>
                    <td><c:out value="${match.team2.name}" /></td>
                    <td><c:out value="${match.puntos3}" /></td>
                 	<td><c:out value="${match.puntos4}" /></td>
                 	<td><spring:url value="/sports/{deporte}/championships/{championshipId}/match/{matchId}/date"
                            var="date2Url">
                            <spring:param name="championshipId" value="${championship}" />
                            <spring:param name="deporte" value="${deporte}" />
                            <spring:param name="matchId" value="${match.id}" />
                        </spring:url>
                        <div class="botoncitores1"> <a href="${fn:escapeXml(date2Url)}">Añadir fecha realización</a></div>
                        
                       
                        </td>
                        </tr>
                        <tr>
                        <td>
                        <c:if test="${match.dateTime != null}">
                     <td><spring:url value="/sports/{deporte}/championships/{championshipId}/match/{matchId}/result/{team}"
                            var="result2Url">
                            <spring:param name="championshipId" value="${championship}" />
                            <spring:param name="deporte" value="${deporte}" />
                            <spring:param name="matchId" value="${match.id}" />
                            <spring:param name="team" value="team1" />
                        </spring:url>
                        <div class="botoncitores1"> <a href="${fn:escapeXml(result2Url)}">Añadir resultados de Equipo 1</a></div>
                        
                        <spring:url value="/sports/{deporte}/championships/{championshipId}/match/{matchId}/result/{team}"
                            var="result2Url">
                            <spring:param name="championshipId" value="${championship}" />
                            <spring:param name="deporte" value="${deporte}" />
                            <spring:param name="matchId" value="${match.id}" />
							<spring:param name="team" value="team2" />
                        </spring:url>
                        <div class="botoncitores2"> <a href="${fn:escapeXml(result2Url)}">Añadir resultados de Equipo 2</a></div>
                        </td>
                        </c:if>
                        </tr>
                        <tr>
                        <td>
	                        <div>
		                        <c:if test="${match.puntos1 != null && match.puntos2 != null && match.puntos3 != null
								&& match.puntos4 != null && match.puntos1 == match.puntos3 && match.puntos2 == match.puntos4}">
		                			<c:choose>
										<c:when test="${match.puntos1 > match.puntos2 && match.puntos3 > match.puntos4}">
											<p> ¡Equipo 1 ganador! </p>
										</c:when>
										<c:when test="${match.puntos1 < match.puntos2 && match.puntos3 < match.puntos4 }">
											<p> ¡Equipo 2 ganador! </p>
										</c:when>
										<c:when test="${match.puntos1 == match.puntos2 && match.puntos3 == match.puntos4 }">
											<p> ¡El resultado del partido no debe ser empate! </p>
										</c:when>
									</c:choose>
								</c:if>
								<c:if test="${match.puntos1 != match.puntos3 || match.puntos2 != match.puntos4}">
                					<p> ¡Los resultados no coinciden! </p>
                				</c:if>
							</div>
						</td>
                        </tr>
				
            </c:forEach>
        </tbody>

    </table>
    </div>
    <spring:url value="/sports/{deporte}/championships/{championshipId}/match/generate1" var="dateUrl">
	                         <spring:param name="deporte" value="${deporte}"/>
	                         <spring:param name="championshipId" value="${championship}" />
	                     </spring:url>
	                     <div class="botoncitocrear">
	<a id="createMatch"  href="${fn:escapeXml(dateUrl)}">Generar primera ronda partidos</a></div>
	<spring:url value="/sports/{deporte}/championships/{championshipId}/match/generate2" var="dateUrl">
	                         <spring:param name="deporte" value="${deporte}"/>
	                         <spring:param name="championshipId" value="${championship}" />
	                     </spring:url>
	                     <div class="botoncitocrear">
	<a id="createMatch"  href="${fn:escapeXml(dateUrl)}">Generar segunda ronda partidos</a></div>
<c:if test="${championshipObj.maxTeams>4}">
	<spring:url value="/sports/{deporte}/championships/{championshipId}/match/generate3" var="dateUrl">
	                         <spring:param name="deporte" value="${deporte}"/>
	                         <spring:param name="championshipId" value="${championship}" />
	                     </spring:url>
	                     <div class="botoncitocrear">
	<a id="createMatch"  href="${fn:escapeXml(dateUrl)}">Generar tercera ronda partidos</a></div>
	<c:if test="${championshipObj.maxTeams>8}">
	<spring:url value="/sports/{deporte}/championships/{championshipId}/match/generate4" var="dateUrl">
	                         <spring:param name="deporte" value="${deporte}"/>
	                         <spring:param name="championshipId" value="${championship}" />
	                     </spring:url>
	                     <div class="botoncitocrear">
	<a id="createMatch"  href="${fn:escapeXml(dateUrl)}">Generar cuarta ronda partidos</a></div>
			</c:if>
	</c:if>
	<div class="form-group">

	<c:if test="${noParticipa}">
	<p>¡No participas en el torneo para poder crear partidos!</p>
</c:if>
	<c:if test="${noParticipaDate}">
	<p>¡No participas en el partido para añadir una fecha de realización!</p>
</c:if>
	<c:if test="${faltaEquipos}">
	<p>¡Faltan equipos por unirse para generar la primera ronda de partidos!</p>
</c:if>
	<c:if test="${yagenerado}">
	<p>¡La primera ronda ya está generada!</p>
</c:if>
	<c:if test="${noprimera}">
	<p>¡Aún no se ha generado la primera ronda!</p>
</c:if>
	<c:if test="${faltaresultados}">
	<p>¡No se puede generar una ronda sin los resultados de la anterior!</p>
</c:if>

	<c:if test="${nocoinc}">
	<p>¡No se puede generar una ronda sin que los resultados de todos los partidos coincidan!</p>
</c:if>

	<c:if test="${yagenerada2}">
	<p>¡La segunda ronda ya está generada!</p>
</c:if>

	<c:if test="${nosegunda}">
	<p>¡Aún no se ha generado la segunda ronda!</p>
</c:if>
	<c:if test="${notercera}">
	<p>¡Aún no se ha generado la tercera ronda!</p>
</c:if>
			
			
						<button class="botonMeeting" style="display:block; font-size: 0.8em; width: 17%; " onclick="location.href='/sports/${deporte}/championships/${championship}';" type="button">
							<b>Volver a torneo</b>
						</button>
					</div>
</body>
</html>
</playtogether:layout>