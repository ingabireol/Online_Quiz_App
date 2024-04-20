<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quiz App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<section id="title">

    <div class="container-fluid">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="/user/home">Quiz App</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/user/home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/quiz/available">Available Quiz</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">My progress</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</section>
<h2 style="text-align: center;">Choose Any quiz You want</h2>
<c:forEach items="${availableQuiz}" var="quiz" varStatus="loop">
    <c:if test="${loop.index % 2 == 0}">
        <div class="row">
    </c:if>
    <div class="col-md-6">
        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title bg-info">${quiz.title}</h5>
                <h6 class="card-subtitle mb-2 text-body-secondary">qwerty</h6>
                <p class="card-text">Take this quiz and test your self in this area.</p>
                <a href="/quiz/do/${quiz.id}" class="card-link">Take quiz</a>
            </div>
        </div>
    </div>
    <c:if test="${loop.index % 2 != 0 or loop.last}">
        </div>
    </c:if>
</c:forEach>
<h2>${user.id} is doing the quiz</h2>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
