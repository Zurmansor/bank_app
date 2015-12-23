<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<t:template>

    <div class="page-container">

    <form:form class="form-horizontal" method="post" action="add" commandName="payment" accept-charset="UTF-8">

        <H2 class="text-center"><spring:message code="payment.add_payment"/></H2>

        <div class="form-group">
            <label for="senderAccountId" class="col-sm-2 control-label"><spring:message code="payment.sender"/></label>
            <div class="col-sm-10">
                <form:select path="senderAccountId" type="text" class="form-control" id="senderAccountId">
                    <c:forEach items="${accounts}" var="account">
                        <form:option value="${account.id}">${account.client.firstName} ${account.client.lastName}
                            - ${account.number}
                            - ${account.balance}</form:option>
                    </c:forEach>
                </form:select>
            </div>
        </div>

        <div class="form-group">
            <label for="recipientAccountId" class="col-sm-2 control-label"><spring:message code="payment.recipient"/></label>
            <div class="col-sm-10">
                <form:select path="recipientAccountId" type="text" class="form-control" id="recipientAccountId">
                    <c:forEach items="${accounts}" var="account">
                        <form:option value="${account.id}">${account.client.firstName} ${account.client.lastName}
                            - ${account.number}
                            - ${account.balance}</form:option>
                    </c:forEach>
                </form:select>
            </div>
        </div>

        <div class="form-group">
            <label for="amount" class="col-sm-2 control-label"><spring:message code="registration.amount"/></label>
            <div class="col-sm-10">
                <form:input path="amount" type="text" class="form-control" id="amount" placeholder="${amount}"/>
            </div>
        </div>

        <form:errors class="text-danger bg-danger" path="amount"></form:errors>

        <spring:message code="payment.add_payment" var="add_payment"/>
        <input type="submit" class="btn btn-success center-block"  value="${add_payment}" />

    </form:form>
</t:template>
