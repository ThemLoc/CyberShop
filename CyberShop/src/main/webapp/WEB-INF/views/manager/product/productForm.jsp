<%-- 
    Document   : productForm
    Created on : Apr 16, 2019, 9:21:07 AM
    Author     : chungnguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello Form!</h1>
        ${product}
                ${product.imagesCollection}

    </body>
</html>
//                                html += "<img src='${pageContext.request.contextPath}/resources/image/img_product/" + result['imagesCollection'][i]['urlImage'] + "' style='width: 100% ; height:400px;vertical-align: middle;'>";
