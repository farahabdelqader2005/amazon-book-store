<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>${empty category.id ? 'Add Category' : 'Edit Category'} | Amazon Book Store</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <style>
        body {
            background: #f4f6f9;
            color: #172337;
            font-family: Arial, sans-serif;
        }

        .store-header {
            background: #172337;
            color: white;
            padding: 24px 0;
        }

        .brand {
            font-size: 23px;
            font-weight: bold;
        }

        .brand span {
            color: #ffb347;
        }

        .form-container {
            max-width: 660px;
            margin: 45px auto;
        }

        .form-card {
            background: white;
            border: 1px solid #e6eaf0;
            border-top: 5px solid #ffb347;
            border-radius: 16px;
            padding: 32px;
            box-shadow: 0 8px 28px rgba(23, 35, 55, 0.05);
        }

        .form-control {
            min-height: 48px;
            border-radius: 8px;
        }

        .form-control:focus {
            border-color: #bd7511;
            box-shadow: 0 0 0 3px rgba(255, 179, 71, 0.2);
        }

        .btn-brand {
            background: #ffb347;
            color: #172337;
            font-weight: bold;
        }

        .btn-brand:hover {
            background: #f4a12f;
            color: #172337;
        }

        .back-link {
            color: #526079;
        }
    </style>
</head>

<body>
<header class="store-header">
    <div class="container">
        <div class="brand">amazon<span> books</span></div>
        <small>Library Management</small>
    </div>
</header>

<main class="container">
    <div class="form-container">
        <c:url var="listUrl" value="/categories/list"/>
        <c:url var="saveUrl" value="/categories/save"/>

        <a href="${listUrl}" class="back-link d-inline-block mb-3">
            &larr; Back to Categories
        </a>

        <section class="form-card">
            <h1 class="h3 font-weight-bold">
                ${empty category.id ? 'Create a category' : 'Edit category'}
            </h1>

            <p class="text-muted mb-4">
                A clear name makes your library easier to explore.
            </p>

            <form:form action="${saveUrl}"
                       method="post"
                       modelAttribute="category">

                <form:hidden path="id"/>

                <div class="form-group">
                    <label for="categoryName" class="font-weight-bold">
                        Category name
                    </label>

                    <form:input path="name"
                                id="categoryName"
                                cssClass="form-control"
                                htmlEscape="true"
                                maxlength="255"
                                placeholder="e.g. Programming"/>

                    <form:errors path="name"
                                 cssClass="text-danger d-block mt-2"/>
                </div>

                <div class="d-flex flex-wrap mt-4">
                    <button type="submit"
                            class="btn btn-brand px-4 py-2 mr-2 mb-2">
                        ${empty category.id ? 'Create Category' : 'Save Changes'}
                    </button>

                    <a href="${listUrl}"
                       class="btn btn-outline-secondary px-4 py-2 mb-2">
                        Cancel
                    </a>
                </div>
            </form:form>
        </section>
    </div>
</main>
</body>
</html>
