<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:setDataSource var="webappDataSource"
                   driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/imbashop"
                   user="root" password="" />

<sql:query dataSource="${webappDataSource}"
           sql="select id,pname from products" var="result" />

<table width="100%" border="1">
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td>${row.id}</td>
            <td>${row.pname}</td>
            <td>
                <img width="200" height="200" src="${pageContext.servletContext.contextPath }/AdminPhotoServlet?id=${row.id}" />
            </td>
        </tr>
    </c:forEach>
</table>