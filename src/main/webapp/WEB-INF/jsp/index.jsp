<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <script>
        alert(${message});
    </script>
    <title>Admin Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
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
                    <a class="nav-link" href="/questions/create">Create Question</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/quiz/create">Create Quiz</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/questions/all">View Questions</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/quiz/all" aria-disabled="true">View All Quiz</a>
                </li>
                <li class="nav-item" style="position: absolute;right: 0">${user.username}</li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <h2 class="alert-success text-center mt-5">${message}</h2>
    <div class="row justify-content-center mt-5">
        <div class="col-md-6 text-center">
            <h2>Welcome, ${user.username}!</h2>
            <p class="lead">Feel free to explore different pages of your app.</p>
        </div>
    </div>
</div>

<footer class="footer mt-5">
    <div class="container text-center">
        <p>&copy; Ingabire Olivier</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9gybB5IXNxFwWQfE7u8Lj+XJHAxKlXiG/8rsrtpb6PEdzD828Ii" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-ZjK88f5VNt5Wh/vP+XU+X6KPq5EwCm6eZxgP/J6Xqd