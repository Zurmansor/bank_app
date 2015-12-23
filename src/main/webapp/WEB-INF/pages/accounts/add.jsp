<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<t:template>

    <div class="page-container">

    <form:form class="form-horizontal" method="post" action="add" commandName="account" accept-charset="UTF-8">

        <H2 class="text-center"><spring:message code="account.add_account"/></H2>

        <div class="form-group">
            <spring:message code="registration.first_name" var="client_id"/>
            <label for="clientId" class="col-sm-2 control-label">${client_id}</label>
            <div class="col-sm-10">
                <form:select path="clientId" type="text" class="form-control" id="clientId">
                    <c:forEach items="${clients}" var="client">
                        <form:option value="${client.id}">${client.firstName} ${client.lastName}</form:option>
                    </c:forEach>
                </form:select>
            </div>
        </div>

        <div class="form-group">
            <spring:message code="registration.balance" var="balance"/>
            <label for="balance" class="col-sm-2 control-label">${balance}</label>
            <div class="col-sm-10">
                <form:input path="balance" type="text" class="form-control" id="balance" placeholder="${balance}"/>
            </div>
        </div>

        <form:errors class="text-danger bg-danger" path="balance"></form:errors>



        <spring:message code="account.add_account" var="add_account"/>
        <input type="submit" class="btn btn-success center-block"  value="${add_account}" />



    </form:form>

</t:template>
