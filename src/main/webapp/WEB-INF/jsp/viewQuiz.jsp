<!-- src/main/webapp/WEB-INF/jsp/index.jsp -->
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <title>Document</title>
</head>
<style>
    .form-question {
        padding: 2rem 2rem 0 4rem;
        text-align: justify;
        max-width: 50%;
    }

</style>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">MyApp</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="questions/create">Create Question</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="questions/all">View Questions</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="/quiz/create" aria-disabled="true">Create Quiz</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="/quiz/all" aria-disabled="true">View all Quiz</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<section>
<div class="card-title">All Quiz</div>
    <div class="alert-info">${deleteMessage}</div>
<table>
<thead>
<tr>
    <th>Quiz Id</th>
    <th>Quiz Title</th>
    <th>Creation Date</th>
    <th>Creator</th>
    <th>Edit</th>
    <th>delete</th>
</tr>
</thead>
<tbody>
<c:forEach var="q" items="${quizList}">
    <tr>
    <td>${q.id}</td>
    <td>${q.title}</td>
    <td>${q.createDate}</td>
    <td>${q.user.username}</td>
    <td><a href="/edit/${q.id}">Edit</a></td>
    <td><a href="/quiz/delete/${q.id}">Delete</a></td>

    </tr>
</c:forEach>
    </tbody>
    </table>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"></script>
    </body>
    </html>
