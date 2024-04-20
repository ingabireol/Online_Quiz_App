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
</style>

<body class="text-center">
<div class="card">


    <main class="form-control w-100 m-auto">
        <form:form method="post" action="/login" class="form-signin" id="form-signin" modelAttribute="user">
            <%--        <img class="mb-4" src="Icons/icons8-hr-100.png" alt="" width="72" height="72">--%>
        <h1 class="h3 mb-3 font-weight-normal">Please Log in</h1>
        <label for="inputEmail" class="sr-only">Email address</label>
            <form:input type="email" id="inputEmail" class="form-control" placeholder="Email address" path="email"
                        required=""/>

        <label for="inputPassword" class="sr-only">Password</label>
            <form:input type="password" id="inputPassword" class="form-control" placeholder="Password" path="password"
                        required=""/>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>

        </form:form>
            <h4 class="text-center ${text}">${message}</h4>
            <a href="/login" class="d-block text-center mt-3 login-link">Does not  have an account? Sign up here</a>

        <p class="mt-5 mb-3 text-muted">&copy; Ingabire Olivier 2024</p>

</div>
</main>

</body>
</html>
