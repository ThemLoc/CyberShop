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
        <br/>
        <h1 style="text-align: center">Thông tin cá nhân</h1>
        <br/>
        <div style="margin-left: 7%;margin-bottom: 7%;margin-right: 7%">
            <c:if test="${not empty customerForm}">
                <form:form id="form" method="POST" action="${pageContext.request.contextPath}/website/customer/save" role="form" modelAttribute="customerForm">
                <div class="box-body">

                    <form:hidden path="customerID"/>

                    <div class="form-group col-md-6">
                        <label for="exampleInputEmail1">Username</label>
                        <s:bind path="username">
                            <form:input type="text" class="form-control" readonly="true" required="true" path="username" placeholder="Enter Username"/>
                        </s:bind>

                    </div>
                    <div class="form-group col-md-6">
                        <label for="exampleInputPassword1">Password</label>
                        <s:bind path="password">
                            <form:input type="password" required="true" class="form-control" path="password"  placeholder="password"/>
                        </s:bind>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="exampleInputPassword1">Fullname</label>
                        <s:bind path="fullname">
                            <form:input type="text" class="form-control" path="fullname" required="true"  placeholder="fullname"/>
                        </s:bind>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="exampleInputPassword1">Phone</label>
                        <s:bind path="phone">
                            <form:input type="text" pattern="\d*" maxlength="10" required="true" minlength="10" class="form-control" path="phone" placeholder="phone"/>
                        </s:bind>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="exampleInputPassword1">Email</label>
                        <s:bind path="email">
                            <form:input type="email" class="form-control" required="true" path="email" placeholder="email"/>
                        </s:bind>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="exampleInputPassword1">Address</label>
                        <s:bind path="address">
                            <form:input type="text" class="form-control" required="true" path="address" placeholder="address"/>
                        </s:bind>
                    </div>
                    <div class="form-group col-md-6">
                        <label >Day of birth:   </label>
                        <c:set var = "now" value = "<%= new java.util.Date()%>" />
                        <s:bind path="dob">
                            <fmt:formatDate value="${dob}" pattern="dd/MM/yyyy" var="myDate" />
                            <form:input path="dob" type="text" value="${myDate}" />
                        </s:bind>

                    </div><br/>
                    <div class="form-group col-md-6">
                        <s:bind path="sex">
                            <form:radiobutton path="sex" value="true"/>Male 
                            <form:radiobutton path="sex" value="false"/>Female 
                        </s:bind>
                    </div>
                    <br/>

                </div>
                <div class="box-footer text-right">
                    <button type="submit" class="btn btn-primary">Xác nhận</button>
                </div>
            </form:form>
            </c:if>
        </div>
        <%@include file="/WEB-INF/views/website/fragment/webFooter.jsp" %>
    </body>
</html>
