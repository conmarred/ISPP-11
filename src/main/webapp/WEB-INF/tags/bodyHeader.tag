<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="playtogether" tagdir="/WEB-INF/tags" %>

<%@ attribute name="menuName" required="true" rtexprvalue="true"
              description="" %>

<playtogether:menu name="${menuName}"/>
