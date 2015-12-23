<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<t:template>

    <div class="page-container">

    <H2 class="text-center"><spring:message code="account.show_account"/></H2>

    <div>
        <table class="table table-bordered">
            <tr>
                <td>
                    <span><spring:message code="account.owner"/>:</span>
                </td>
                <td>
                    <a href="/clients/show/${account.client.id}">
                        ${account.client.firstName} ${account.client.lastName}
                    </a>
                </td>
            </tr>
            <tr>
                <td>
                    <span><spring:message code="account.number"/>:</span>
                </td>
                <td><span>${account.number}</span></td>
            </tr>
            <tr>
                <td>
                    <span><spring:message code="registration.balance"/>:</span>
                </td>
                <td><span>${account.balance}</span></td>
            </tr>
            <tr>
                <td>
                    <span><spring:message code="account.active"/>:</span>
                </td>
                <td><span>${account.active}</span></td>
            </tr>
            <tr>
                <td>
                    <span><spring:message code="account.payments"/>:</span>
                </td>
                <td>
                    <table class="table table-bordered">
                        <c:forEach items="${payments}" var="payment">
                            <tr>
                                <c:if test="${payment.senderAccountId eq account.id}">
                                    <td align="center">&uarr;</td>
                                    <td>${payment.recipientAccount.client.firstName} ${payment.recipientAccount.client.lastName}</td>
                                </c:if>
                                <c:if test="${payment.recipientAccountId eq account.id}">
                                    <td align="center">&darr;</td>
                                    <td>${payment.senderAccount.client.firstName} ${payment.senderAccount.client.lastName}</td>
                                </c:if>
                                <td>${payment.transactionId}</td>
                                <td>${payment.amount}</td>
                            </tr>

                        </c:forEach>
                    </table>
                </td>
            </tr>

        </table>
    </div>

</t:template>
