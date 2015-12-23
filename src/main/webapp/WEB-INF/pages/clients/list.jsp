<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<t:template>
    <H2 class="text-center"><spring:message code="title.clients"/></H2>
    <p>
        <a href="/clients/add" class="btn btn-success">
            <spring:message code="client.add_client"/>
        </a>
    </p>

    <table class="table table-bordered">
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Accounts</th>
            <th>Balance</th>
        </tr>
        <c:forEach items="${clients}" var="client">
            <tr>
                <td><a href="/clients/show/${client.id}">${client.firstName}</a></td>
                <td><a href="/clients/show/${client.id}">${client.lastName}</a></td>
                <td>${client.email}</td>
                <td>${client.phone}</td>
                <td>${client.accounts.size()}</td>
                <td>${client.balance}</td>
            </tr>
        </c:forEach>
    </table>


</t:template>
