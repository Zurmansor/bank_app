<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<t:template>

    <div class="page-container">


        <H2 class="text-center"><spring:message code="client.show_client"/></H2>

        <div>
            <table class="table">
                <tr>
                    <td>
                        <span><spring:message code="registration.first_name"/>:</span>
                    </td>
                    <td><span>${client.firstName}</span></td>
                </tr>
                <tr>
                    <td>
                        <span><spring:message code="registration.last_name"/>:</span>
                    </td>
                    <td><span>${client.lastName}</span></td>
                </tr>
                <tr>
                    <td>
                        <span><spring:message code="registration.email"/>:</span>
                    </td>
                    <td><span>${client.email}</span></td>
                </tr>
                <tr>
                    <td>
                        <span><spring:message code="registration.address"/>:</span>
                    </td>
                    <td><span>${client.address}</span></td>
                </tr>
                <tr>
                    <td>
                        <span><spring:message code="registration.phone"/>:</span>
                    </td>
                    <td><span>${client.phone}</span></td>
                </tr>
                <tr>
                    <td>
                        <span><spring:message code="registration.balance"/>:</span>
                    </td>
                    <td><span>${client.balance}</span></td>
                </tr>
                <tr>
                    <td>
                        <span><spring:message code="title.accounts"/> (${client.accounts.size()}):</span>
                    </td>
                    <td>
                        <c:forEach items="${client.accounts}" var="account">
                            <div>${account.number}:
                             ${account.balance}</div>
                        </c:forEach>
                    </td>
                </tr>
            </table>
        </div>

</t:template>
