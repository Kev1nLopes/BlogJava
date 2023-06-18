<%@	attribute name="id" required="true"	%>
<%@	attribute name="place" required="true"	%>
<%@ attribute name="type" required="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%-- Não conseguii usar expression languagem por conta de não ser possível usar o comando  < % @ page isELIgnored="false" %>, tive que usar scriptlet mesmo --%>


<c:if test="${type=='text'}">

    <div  class="d-flex flex-column align-items-center justify-content-center w-100" >
        <label for="${id}" class="align-self-start">${id}</label>
        <input class="inputForm" id="${id}" placeholder="${place}" type="${type}" name="${id}" />
    </div>

</c:if>

<c:if test="${type=='date'}">
    <div  class="d-flex flex-column align-items-center justify-content-center w-100" >
        <label for="${id}" class="align-self-start">${id}</label>
        <input class="inputForm" id="${id}" placeholder="${place}" type="${type}" name="${id}" />
    </div>

</c:if>





