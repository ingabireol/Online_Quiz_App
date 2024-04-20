<!-- src/main/webapp/WEB-INF/jsp/index.jsp -->
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="true" language="java" %>

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
    section{

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
    <div class="row m-auto w-100">
        <label for="quizTitle" class="form-label">Quiz Title</label>
        <input type="text" class="form-control" id="quizTitle" required>
        <div class="mb-3">
            <label for="duration" class="form-label">Duration</label>
            <input type="text" class="form-control" id="duration" required>
        </div>
    <div class="col-md-8 col-sm-12 form-question card">
        <h2>In put Question</h2>
        <form action="">
            <div class="mb-3">
                <label for="title" class="form-label">Title</label>
                <input type="text" class="form-control" id="title" required>
            </div>

            <div class="mb-3">
                <label for="option1" class="form-label">Option 1</label>
                <input type="text" class="form-control" id="option1" required>
            </div>
            <div class="mb-3">
                <label for="option2" class="form-label">Option 2</label>
                <input type="text" class="form-control" id="option2" required>
            </div>
            <div class="mb-3">
                <label for="option3" class="form-label">Option 3</label>
                <input type="text" class="form-control" id="option3" required>
            </div>
            <div class="mb-3">
                <label for="option4" class="form-label">Option 4</label>
                <input type="text" class="form-control" id="option4" required>
            </div>
            <div class="mb-3">
                <label for="Answer" class="form-label">Answer</label>
                <input type="text" class="form-control" id="Answer" required>
            </div>
            <div class="mb-3">
                <label for="category" class="form-label">Category</label>
                <input type="text" class="form-control" id="category" required>
            </div>
            <button onclick="addQuestion()" type="button" class="btn p-2 btn-primary">Add Question</button>
            <button onclick="sendQuestions()" type="button" class="btn p-2 m-3 btn-success">Submit Quiz</button>

        </form>
    </div>

    <div class="col-md-4 quiz-questions">
        <h2>Quiz Questions</h2>

    </div>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script>

    let quizTitle;
    let duration;
    let formDataList = [];
    let i = 0;
    function addQuestion() {

        let form = document.querySelector('.form-question form');
        quizTitle = document.querySelector("#quizTitle").value;
        duration = document.querySelector("#duration").value;


        let title = form.querySelector('#title').value;
        let option1 = form.querySelector('#option1').value;
        let option2 = form.querySelector('#option2').value;
        let option3 = form.querySelector('#option3').value;
        let option4 = form.querySelector('#option4').value;
        let answer = form.querySelector('#Answer').value;
        let category = form.querySelector('#category').value;


        if (!form.reportValidity()) {
            form.reportValidity();
            // alert("FIll all the fields");
            return;
        } else {
            let questionData = {
                name: title,
                option1: option1,
                option2: option2,
                option3: option3,
                option4: option4,
                answer: answer,
                category: category,
            };
            i++;
            formDataList.push(questionData);
            console.log(formDataList);
            document.querySelector(".quiz-questions").innerHTML +=
                `<div class="card">
                    <div class="card-header">
                    <h1 class="card-text">${i}</h1>

                    ${category}
                     </div>
                  <div class="card-body">
                    <h5 class="card-title">${title}</h5>
                    <p class="card-text">${answer}</p>
                  </div>
                   <button onclick="deleteQuestion(this)"  id="delete" class="btn btn-primary">Delete</button>
              </div>`;
            form.querySelectorAll("input").forEach(input => {
                input.value = "";
            });
        }
    }
    function deleteQuestion(button) {
        i--;
        button.parentNode.remove();
    }
    function sendQuestions() {
        const formData = {
            questionList :formDataList,
            quizTitle : quizTitle,
            duration : duration
        };



        fetch("/quiz/save", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(formData)
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                return response.text();
            })
            .then(data => {
                window.location.href = "/admin";
                console.log(data); // Log the response from the server
            })
            .catch(error => {
                alert("Creation Failed");
                console.error('There was an error!', error);
            });
    }
</script>
</body>
</html>