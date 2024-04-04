<%@ page import="com.olim.model.Quiz" %>
<%@ page import="com.olim.model.Question" %>
<%@ page import="java.util.List" %>
<!-- src/main/webapp/WEB-INF/jsp/index.jsp -->
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="true" language="java" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <%
        Quiz quiz = (Quiz) session.getAttribute("quiz");
        List<Question> questionList = quiz.getQuestionList();
//        System.out.println(questionList);
        session.setAttribute("questions", questionList);
        int i = 0;
        System.out.println(session.getId());
    %>
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

    section {

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

<section class="row m-auto">
    <div class="col-lg-6 form-question card border border-3">
        <h2 id="quiz_name"> <%=questionList.get(0).getName()%> </h2>
        <form action="">
            <div class="form-check">
                <input class="form-check-input" value="<%= questionList.get(0).getOption1()%>" type="radio"
                       name="answer" id="option1">
                <label class="form-check-label" for="option1">
                    <%= questionList.get(i).getOption1()%>
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" value="<%= questionList.get(0).getOption2()%>" type="radio"
                       name="answer" id="option2">
                <label class="form-check-label" for="option2">
                    <%= questionList.get(i).getOption2()%>
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" value="<%= questionList.get(0).getOption3()%>" type="radio"
                       name="answer" id="option3">
                <label class="form-check-label" for="option3">
                    <%= questionList.get(i).getOption3()%>
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" value="<%= questionList.get(0).getOption4()%>"
                       name="answer" id="option4">
                <label class="form-check-label" for="option4">
                    <%= questionList.get(0).getOption4()%>
                </label>
            </div>
            <button onclick="nextQuestion()" type="button" class="btn p-2 btn-primary">Next Question</button>

        </form>
    </div>

    <div class="col-md-6 card available-questions">

        <div><h3>Helloo my geee</h3></div>
        <button onclick="sendQuestions()" type="button" class="btn p-2 m-auto fixed-bottom btn-success">Submit Quiz
        </button>
    </div>


</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script>
    let i = 0;
    let answers = [];

    function nextQuestion() {
        let answer = document.querySelector('input[name="answer"]:checked').value;
        answers.push(answer);
        console.log(answer);
        i++;
        document.getElementById('option1').checked = false;
        document.getElementById('option2').checked = false;
        document.getElementById('option3').checked = false;
        document.getElementById('option4').checked = false;
        displayQuestion(i);
    }

    function displayQuestion(index) {
        // Use AJAX or Fetch API to request the next question from the server
        fetch(`/quiz/question?index=`+index)
            .then(response => response.json())
            .then(data => {
                // Update the HTML to display the next question

                document.getElementById("quiz_name").innerText = data.name;
                document.getElementById('option1').value = data.option1;
                document.getElementById('option2').value = data.option2;
                document.getElementById('option3').value = data.option3;
                document.getElementById('option4').value = data.option4;
                document.querySelector('label[for="option1"]').innerText = data.option1;
                document.querySelector('label[for="option2"]').innerText = data.option2;
                document.querySelector('label[for="option3"]').innerText = data.option3;
                document.querySelector('label[for="option4"]').innerHTML = data.option4;

                // Update other options similarly
            })
            .catch(error => {
                alert("Questions are over");
            });
    }

    <%--let questionList = <%= questionList%>;--%>
    // console.log(questionList);
    let quizTitle;
    let formDataList = [];
    // let i = 0;

    function sendQuestions() {

        fetch("/quiz/do/save", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(answers)
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                return response.text();

            })
            .then(data => {
                console.log(data); // Log the response from the server
                window.location.href = "/quiz/marks";
            })
            .catch(error => {
                console.error('There was an error!', error);
            });
    }
</script>
</body>
</html>