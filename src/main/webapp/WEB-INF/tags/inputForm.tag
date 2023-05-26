<%@	attribute name="id" required="true"	%>
<%@	attribute name="place" required="true"	%>
<%@ attribute name="type" required="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%-- Não conseguii usar expression languagem por conta de não ser possível usar o comando  < % @ page isELIgnored="false" %>, tive que usar scriptlet mesmo --%>


<c:if test="${type=='text'}">
<<<<<<< HEAD
    <div style="display: flex; flex-direction: column; max-width: 300px; min-width: 150px; width: 100%" class="align-items-center justify-content-center" >
        <label for="${id}" class="align-self-start">${id}</label>
        <input class="inputForm" id="${id}" placeholder="${place}" type="${type}" name="${id}" />
    </div>

</c:if>

<c:if test="${type=='date'}">
    <div style="display: flex; flex-direction: column; max-width: 300px; min-width: 150px; width: 100%" class="align-items-center justify-content-center" >
        <label for="${id}" class="align-self-start">${id}</label>
        <input class="inputForm" id="${id}" placeholder="${place}" type="${type}" name="${id}" />
    </div>

=======
    <label for="${id}">${id}</label>
    <input class="inputForm" id="${id}" placeholder="${place}" type="${type}" name="${place}" />
>>>>>>> 3da768a712f55e030cce49049070d16ab1da814e
</c:if>






<script>
    document.querySelector("dataNascimento")
</script>