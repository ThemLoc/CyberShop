<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/WEB-INF/views/website/fragment/css.jsp" %>
    </head>
    <body>
        <%@include file="/WEB-INF/views/website/fragment/webHeader.jsp" %>
    <form:form id="form" method="POST" action="#" role="form" modelAttribute="customerForm">
        <div class="box-body">

            <form:hidden path="customerID"/>

            <div class="form-group">
                <label for="exampleInputEmail1">Username</label>
                <s:bind path="username">
                    <form:input type="text" class="form-control" disabled="" required="true" path="username" placeholder="Enter Username"/>
                </s:bind>

            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <s:bind path="password">
                    <form:input type="password"  class="form-control" path="password"   placeholder="password"/>
                </s:bind>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Fullname</label>
                <s:bind path="fullname">
                    <form:input type="text" class="form-control" path="fullname" required="true"  placeholder="fullname"/>
                </s:bind>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Phone</label>
                <s:bind path="phone">
                    <form:input type="text" pattern="\d*" maxlength="10" required="true" minlength="10" class="form-control" path="phone" placeholder="phone"/>
                </s:bind>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Email</label>
                <s:bind path="email">
                    <form:input type="email" class="form-control" required="true" path="email" placeholder="email"/>
                </s:bind>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Address</label>
                <s:bind path="address">
                    <form:input type="text" class="form-control" required="true" path="address" placeholder="address"/>
                </s:bind>
            </div>
            <div class="form-group">
                <label >Day of birth:   </label>
                <c:set var = "now" value = "<%= new java.util.Date()%>" />
                <s:bind path="dob">
                    <fmt:formatDate value="${dob}" pattern="dd/MM/yyyy" var="myDate" />
                    <form:input path="dob" type="text" value="${myDate}" />
                </s:bind>

            </div>
            <s:bind path="sex">
                <form:radiobutton path="sex" value="true"/>Male 
                <form:radiobutton path="sex" value="false"/>Female 
            </s:bind>
            <br/>

        </div>
        <div class="box-footer">
            <button type="submit" class="btn btn-primary">Xác nhận</button>
        </div>
    </form:form>
    <%@include file="/WEB-INF/views/website/fragment/webFooter.jsp" %>
</body>
</html>
