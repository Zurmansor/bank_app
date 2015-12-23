<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<t:template>
    <H2 class="text-center"><spring:message code="title.payments"/></H2>
    <p>
        <a href="/payments/add" class="btn btn-success">
            <spring:message code="payment.add_payment"/>
        </a>
    </p>

    <table class="table table-bordered">
        <tr>
            <th>Sender account</th>
            <th>Recipient account</th>
            <th>Transaction Id</th>
            <th>Amount</th>
        </tr>
        <c:forEach items="${payments}" var="payment">
            <tr>
                <td>
                    ${payment.senderAccount.client.firstName} ${payment.senderAccount.client.lastName} - ${payment.senderAccount.number}
                </td>
                <td>
                    ${payment.recipientAccount.client.firstName} ${payment.recipientAccount.client.lastName} - ${payment.recipientAccount.number}
                </td>
                <td> ${payment.transactionId} </td>
                <td> ${payment.amount} </td>
            </tr>
        </c:forEach>
    </table>
</t:template>