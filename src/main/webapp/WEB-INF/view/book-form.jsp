<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <title>
        ${empty book.id ? 'Add Book' : 'Edit Book'}
    </title>

    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body class="container mt-4">

<c:url var="saveUrl" value="/books/save"/>
<c:url var="listUrl" value="/books/list"/>

<h2 class="mb-4">
    ${empty book.id ? 'Add New Book' : 'Edit Book'}
</h2>

<form action="${saveUrl}" method="post">

    <input type="hidden"
           name="id"
           value="${book.id}">

    <div class="form-group">

        <label>
            Book Title
        </label>

        <input type="text"
               name="title"
               value="<c:out value='${book.title}'/>"
               class="form-control"
               maxlength="255"
               required>

    </div>

    <div class="form-group">

        <label>
            Categories
        </label>

        <div class="border rounded p-3">

            <c:forEach var="category"
                       items="${categories}">

                <c:set var="categorySelected"
                       value="false"/>

                <c:forEach var="selectedCategory"
                           items="${book.categories}">

                    <c:if test="${selectedCategory.id == category.id}">

                        <c:set var="categorySelected"
                               value="true"/>

                    </c:if>

                </c:forEach>

                <div class="form-check">

                    <input type="checkbox"
                           name="categoryIds"
                           value="${category.id}"
                           class="form-check-input"
                           id="category-${category.id}"
                           <c:if test="${categorySelected}">checked</c:if>>

                    <label class="form-check-label"
                           for="category-${category.id}">

                        <c:out value="${category.name}"/>

                    </label>

                </div>

            </c:forEach>

        </div>

    </div>

    <div class="form-group">

        <label>
            Authors
        </label>

        <div class="border rounded p-3">

            <c:forEach var="author"
                       items="${authors}">

                <c:set var="authorSelected"
                       value="false"/>

                <c:forEach var="selectedAuthor"
                           items="${book.authors}">

                    <c:if test="${selectedAuthor.id == author.id}">

                        <c:set var="authorSelected"
                               value="true"/>

                    </c:if>

                </c:forEach>

                <div class="form-check">

                    <input type="checkbox"
                           name="authorIds"
                           value="${author.id}"
                           class="form-check-input"
                           id="author-${author.id}"
                           <c:if test="${authorSelected}">checked</c:if>>

                    <label class="form-check-label"
                           for="author-${author.id}">

                        <c:out value="${author.name}"/>

                    </label>

                </div>

            </c:forEach>

        </div>

    </div>

    <hr>

    <h4>
        Book Details
    </h4>

    <div class="form-group">

        <label>
            ISBN
        </label>

        <input type="text"
               name="bookDetails.isbn"
               value="<c:out value='${book.bookDetails.isbn}'/>"
               class="form-control"
               required>

    </div>

    <div class="form-group">

        <label>
            Publisher
        </label>

        <input type="text"
               name="bookDetails.publisher"
               value="<c:out value='${book.bookDetails.publisher}'/>"
               class="form-control">

    </div>

    <div class="form-group">

        <label>
            Number Of Pages
        </label>

        <input type="number"
               name="bookDetails.numberOfPages"
               value="${book.bookDetails.numberOfPages}"
               class="form-control"
               min="1">

    </div>

    <div class="form-group">

        <label>
            Language
        </label>

        <input type="text"
               name="bookDetails.language"
               value="<c:out value='${book.bookDetails.language}'/>"
               class="form-control">

    </div>

    <button type="submit"
            class="btn btn-primary">

        Save Book

    </button>

    <a href="${listUrl}"
       class="btn btn-secondary">

        Cancel

    </a>

</form>

</body>
</html>
