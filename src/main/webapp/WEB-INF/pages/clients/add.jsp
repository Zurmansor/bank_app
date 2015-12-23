<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<t:template>

    <div class="page-container">

    <form:form class="form-horizontal" method="post" action="add" commandName="client" accept-charset="UTF-8">

        <H2 class="text-center"><spring:message code="client.add_client"/></H2>

        <div class="form-group">
            <spring:message code="registration.first_name" var="first_name"/>
            <label for="firstName" class="col-sm-2 control-label">${first_name}</label>
            <div class="col-sm-10">
                <form:input path="firstName" type="text" class="form-control" id="firstName" placeholder="${first_name}"/>
            </div>
        </div>

        <form:errors class="text-danger bg-danger" path="firstName"></form:errors>

        <div class="form-group">
            <spring:message code="registration.last_name" var="last_name"/>
            <label for="lastName" class="col-sm-2 control-label">${last_name}</label>
            <div class="col-sm-10">
                <form:input path="lastName" type="text" class="form-control" id="lastName" placeholder="${last_name}"/>
            </div>
        </div>

        <form:errors class="text-danger bg-danger" path="lastName"></form:errors>

        <div class="form-group">
            <spring:message code="registration.email" var="email"/>
            <label for="email" class="col-sm-2 control-label">${email}</label>
            <div class="col-sm-10">
                <form:input path="email" type="email" class="form-control" id="email" placeholder="${email}"/>
            </div>
        </div>

        <form:errors class="text-danger bg-danger" path="email"></form:errors>

        <div class="form-group">
            <spring:message code="registration.phone" var="phone"/>
            <label for="phone" class="col-sm-2 control-label">${phone}</label>
            <div class="col-sm-10">
                <form:input path="phone" type="text" class="form-control" id="phone" placeholder="${phone}"/>
            </div>
        </div>

        <form:errors class="text-danger bg-danger" path="phone"></form:errors>

        <div class="form-group">
            <spring:message code="registration.address" var="address"/>
            <label for="address" class="col-sm-2 control-label">${address}</label>
            <div class="col-sm-10">
                <form:textarea path="address" type="text" class="form-control" rows="4" id="address" placeholder="${address}"/>
            </div>
        </div>

        <spring:message code="client.add_client" var="add_client"/>
        <input type="submit" class="btn btn-success center-block"  value="${add_client}" />



    </form:form>

</t:template>
