<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Author Form | Amazon Books</title>

    <c:url var="authorCss" value="/resources/css/author.css"/>
    <link rel="stylesheet" href="${authorCss}">
</head>

<body>
<c:url var="listUrl" value="/authors/list"/>
<c:url var="saveUrl" value="/authors/save"/>
<c:url var="categoriesUrl" value="/categories/list"/>

<header>
    <div class="brand">amazon <span>books</span></div>
    <div>Library Management</div>

    <nav aria-label="Main navigation">
        <a href="${categoriesUrl}">Categories</a>
        <a href="${listUrl}">Authors</a>
    </nav>
</header>

<main class="form-container">
    <a class="back-link" href="${listUrl}">
        &larr; Back to Authors
    </a>

    <div class="card form-card">
        <h1>
            <c:choose>
                <c:when test="${empty author.id}">
                    Create an author
                </c:when>
                <c:otherwise>
                    Edit author
                </c:otherwise>
            </c:choose>
        </h1>

        <p class="muted">Add the name behind the books.</p>

        <form:form action="${saveUrl}"
                   method="post"
                   modelAttribute="author"
                   htmlEscape="true">

            <form:hidden path="id"/>

            <div class="form-group">
                <label for="name">Author name</label>

                <form:input path="name"
                            id="name"
                            cssClass="form-input"
                            maxlength="255"
                            placeholder="e.g. Robert C. Martin"
                            aria-describedby="name-help name-errors"/>

                <p class="field-help" id="name-help">
                    Enter a name between 1 and 255 characters.
                </p>

                <form:errors path="name"
                             id="name-errors"
                             cssClass="field-error"
                             element="div"/>
            </div>

            <div class="form-actions">
                <button class="button primary" type="submit">
                    <c:choose>
                        <c:when test="${empty author.id}">
                            Create Author
                        </c:when>
                        <c:otherwise>
                            Save Changes
                        </c:otherwise>
                    </c:choose>
                </button>

                <a class="button edit" href="${listUrl}">
                    Cancel
                </a>
            </div>
        </form:form>
    </div>
</main>
</body>
</html>
