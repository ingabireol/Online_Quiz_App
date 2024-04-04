<%--
  Created by IntelliJ IDEA.
  User: ingab
  Date: 4/4/2024
  Time: 8:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quiz APP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<nav class="nav navbar-dark bg-dark navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="/user/home">Quiz App</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav nav-fill">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/user/home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/quiz/available">Available Quiz</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/user/quiz/done">Done Quiz</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">My Progress</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<section class="bg-danger">
    <h2>I am User ${user.id}</h2>
    <div class="container-fluid justify-content-end">
        <h2 class="">You  are welcome to Quiz App</h2>
        <p>Here we give you a good experience for growing into your dreams</p>
        <button class="rounded-pill bg-dark">
            <a href="/quiz/available/">Get Started</a>
        </button>
    </div>

</section>
<footer class="bg-success" style="text-align: center;padding: 3% 2% 5%;">
    <p>&copy; Ingabire Olivier 2024 </p>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
