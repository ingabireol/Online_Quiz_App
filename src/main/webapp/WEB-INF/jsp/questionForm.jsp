<!-- src/main/webapp/WEB-INF/jsp/index.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<html>
<head>

</head>
<body>
<h2 class="text-center">Create a Question</h2>

<div class="contain-fluid">
    <form:form action="/questions/saveQuestion" method="post" modelAttribute="question">
        <div class="mb-3">
            <label for="name" class="form-label">Title</label>
            <form:input type="text" class="form-control" id="name" path="name" placeholder="Question title"/>
        </div>

        <div class="mb-3">
            <label for="option1" class="form-label">Option 1</label>
            <form:input class="form-control" path="option1" id="option1" rows="3"/>
        </div>

        <div class="mb-3">
            <label for="option2" class="form-label">Option 2</label>
            <form:input class="form-control" path="option2" id="option2" rows="3"/>
        </div>

        <div class="mb-3">
            <label for="option1" class="form-label">Option 3</label>
            <form:input class="form-control" path="option3" id="option3" rows="3"/>
        </div>

        <div class="mb-3">
            <label for="option1" class="form-label">Option 4</label>
            <form:input class="form-control" path="option4" id="option4" rows="3"/>
        </div>

        <div class="mb-3">
            <label for="answer" class="form-label">Right Answer</label>
            <form:input class="form-control" path="answer" id="answer" rows="3"/>
        </div>

        <div class="mb-3">
            <label for="category" class="form-label">Category</label>
            <form:input class="form-control" path="category" id="category" rows="3"/>
        </div>
        <div>
            <button type="submit" class="btn btn-lg btn-primary">Submit</button>
        </div>

    </form:form>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>