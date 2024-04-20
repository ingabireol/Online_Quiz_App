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
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .navbar {
            padding: 1rem;
            background-color: #343a40;
            border-bottom: 1px solid #e9ecef;
        }

        .navbar-brand {
            font-size: 1.5rem;
            font-weight: bold;
            color: #fff;
        }

        .navbar-nav {
            margin-left: auto;
        }

        .nav-link {
            color: #fff;
            padding: 0.5rem 1rem;
            transition: all 0.3s ease-in-out;
        }

        .nav-link:hover {
            background-color: #6c757d;
            border-radius: 0.25rem;
        }

        .section-header {
            text-align: center;
            padding: 3% 0;
            background-color: #f8f9fa;
            border-bottom: 1px solid #e9ecef;
        }

        .section-header h2 {
            font-size: 2.5rem;
            font-weight: bold;
            color: #343a40;
        }

        .section-header p {
            font-size: 1.2rem;
            color: #6c757d;
        }

        .get-started-button {
            display: inline-block;
            margin-top: 2rem;
            background-color: #343a40;
            color: #fff;
            padding: 0.75rem 2rem;
            border-radius: 0.25rem;
            transition: all 0.3s ease-in-out;
        }

        .get-started-button:hover {
            background-color: #6c757d;
            cursor: pointer;
        }

        footer {
            background-color: #212529;
            color: #fff;
            padding: 1.5rem;
            text-align: center;
            position: absolute;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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
                    <a class="nav-link" href="/logout">Log Out</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<section class="section-header">
    <h2>I am User ${user.id}</h2>
    <div class="container-fluid justify-content-end">
        <h2 class="">You  are welcome to Quiz App</h2>
        <p>Here we give you a good experience for growing into your dreams</p>
        <a class="" href="/quiz/available/">
        <button class="get-started-button rounded-pill">
            Get Started
        </button></a>
    </div>
</section>
<footer>
    <p>&copy; Ingabire Olivier 2024 </p>
</footer>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>