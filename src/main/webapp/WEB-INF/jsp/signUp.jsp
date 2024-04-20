<%@page isELIgnored="false" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../Icons/icons8-hr-50.png">

    <title>Human Resource</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="../styles/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
</head>
<style>
    html,
    body {
        height: 100%;
    }

    .form-signin {
        max-width: 330px;
        padding: 1rem;
        margin: auto;
    }

    .form-signin .form-floating:focus-within {
        z-index: 2;
    }

    .form-signin input[type="email"] {
        margin-bottom: -1px;
        border-bottom-right-radius: 0;
        border-bottom-left-radius: 0;
    }

    .form-signin input[type="password"] {
        margin-bottom: 10px;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
    }

    .login-link {
        animation: fadeIn 4s;
    }

    @keyframes fadeIn {
        0% {opacity: 0;}
        100% {opacity: 1;}
    }
</style>

<body class="text-center">
<div class="card animate__animated animate__fadeIn">


    <main class="form-control w-100 m-auto">
        <form:form action="/signup" cssClass="form-signin" id="form-signin" method="post" modelAttribute="user">
            <%--        <img class="mb-4" src="Icons/icons8-hr-100.png" alt="" width="72" height="72">--%>
            <h1 class="h3 mb-3 font-weight-normal">Please sign up</h1>
            <div class="form-floating mb-3">
                <form:input type="email" id="inputEmail" class="form-control" placeholder="Email address" path="email"
                            required=""/>
                <label for="inputEmail">Email address</label>
            </div>
            <div class="form-floating mb-3">
                <form:input type="text" id="username" class="form-control" placeholder="Username" path="username"
                            required=""/>
                <label for="username">Username</label>
            </div>
            <div class="form-floating mb-3">
                <form:input type="text" id="role" class="form-control" placeholder="Role" path="role" required=""/>
                <label for="role">Role</label>
            </div>

            <div class="form-floating">
                <form:input type="password" id="inputPassword" cssClass="form-control" placeholder="Password" path="password"
                            required=""/>
                <label for="inputPassword">Password</label>
            </div>


            <%--        <label for="inputPassword" class="sr-only">Confirm Password :</label>--%>
            <%--        <input type="password" id="confirmPassword" class="form-control" placeholder="Confirm Password" name="confirmPassword" required>--%>

            <%--        <div class="checkbox mb-3">--%>


            <%--        </div>--%>
            <button class="w-100 btn btn-lg btn-primary" type="submit">Sign Up</button>
            <p class="mt-5 mb-3 text-muted">&copy; Ingabire Olivier 2024</p>
        </form:form>
        <a href="/login" class="d-block text-center mt-3 login-link">Already have an account? Login here</a>
    </main>
</div>
</body>
</html>