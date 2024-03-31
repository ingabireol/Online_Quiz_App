<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>

<div class="container-md">
    <% int i = 0;%>

    <c:forEach var="question" items="${questions}">
        <% if (i % 3 == 0) { %>
        <div class="row">
            <%}%>
            <div class="card col-md-4 col-sm-12 m-1 px-1">

                <div class="card-body">
                    <h5 class="card-title"> ${question.id}</h5>
                    <p class="card-text">${question.name}</p>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">${question.option1}</li>
                    <li class="list-group-item">${question.option2}</li>
                    <li class="list-group-item">${question.option3}</li>
                    <li class="list-group-item">${question.option4}</li>
                    <li class="list-group-item bg-success">${question.answer}</li>
                    <li class="list-group-item card-footer">${question.category}</li>
                </ul>
                <div class="card-body">
                    <a href="#" class="card-link">Edit</a>
                    <a href="#" class="card-link">Delete</a>
                </div>
            </div>
                <%--            <%System.out.println();%>--%>
            <% if (i % 3 == 0 && i != 0) { %>
        </div>
        <% } %>
        <%i++;%>
    </c:forEach>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</div>

</body>
</html>
