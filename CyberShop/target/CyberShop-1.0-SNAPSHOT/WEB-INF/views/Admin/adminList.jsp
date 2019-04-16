<%-- 
    Document   : admin
    Created on : Apr 15, 2019, 1:39:28 PM
    Author     : ngthe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<<<<<<< HEAD
       <h1>List Admin!</h1>
        <c:if test="${not empty msg}">
            ${msg}
        </c:if>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Full name</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Sex</th>
                    <th>Status</th>
                    <th>Day of birth</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listAdmin}" var="a" >
                    <tr>
                        <td>${a.adminID}</td>
                        <td>${a.username}</td>
                        <td>${a.role}</td>
                        <td>${a.fullname}</td>
                        <td>${a.phone}</td>
                        <td>${a.email}</td>
                        <td>${a.address}</td>
                        <td>${a.sex}</td>
                        <td>${a.status}</td>
                        <td>${a.dob}</td>
                    </tr>
                </c:forEach>


            </tbody>
        </table>

=======
        <h1>Hello World!
        ${listAdmin}
        </h1>
>>>>>>> 3d45ac934ac572e64b6ee234da5dc63cd1ea1501
    </body>
</html>
