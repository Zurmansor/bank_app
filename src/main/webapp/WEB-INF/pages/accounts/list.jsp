<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<t:template>
    <H2 class="text-center"><spring:message code="title.accounts"/></H2>
    <p>
        <a href="/accounts/add" class="btn btn-success">
            <spring:message code="account.add_account"/>
        </a>
    </p>

    <c:if test="${not empty maxAccount}">
        <div class="alert alert-info">
            <span>Max balance: </span>
            <span>${maxAccount.client.firstName} ${maxAccount.client.lastName} - ${maxAccount.balance}</span>
        </div>
    </c:if>

    <table class="table table-bordered">
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Number</th>
            <th>Balance</th>
        </tr>
        <c:forEach items="${accounts}" var="account">
            <tr>
                <td><a href="/clients/show/${account.client.id}">${account.client.firstName}</a></td>
                <td><a href="/clients/show/${account.client.id}">${account. client.lastName}</a></td>
                <td><a href="/accounts/show/${account.id}">${account.number}</a></td>
                <td>${account.balance}</td>
            </tr>
        </c:forEach>
    </table>
</t:template>
