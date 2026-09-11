<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <title>
        Book Details | Amazon Books
    </title>

    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body class="container mt-4">

<c:url var="listUrl"
       value="/books/list"/>

<c:url var="editUrl"
       value="/books/edit">

    <c:param name="id"
             value="${book.id}"/>

</c:url>

<h2 class="mb-4">
    Book Details
</h2>

<a href="${listUrl}"
   class="btn btn-secondary mb-3">

    Back to Books

</a>

<a href="${editUrl}"
   class="btn btn-warning mb-3">

    Edit Book

</a>

<div class="card">

    <div class="card-body">

        <h3 class="card-title">

            <c:out value="${book.title}"/>

        </h3>

        <hr>

        <h5>
            Categories
        </h5>

        <c:choose>

            <c:when test="${empty book.categories}">

                <p class="text-muted">
                    No categories assigned.
                </p>

            </c:when>

            <c:otherwise>

                <c:forEach var="category"
                           items="${book.categories}">

                    <span class="badge badge-info mr-1">

                        <c:out value="${category.name}"/>

                    </span>

                </c:forEach>

            </c:otherwise>

        </c:choose>

        <hr>

        <h5>
            Authors
        </h5>

        <c:choose>

            <c:when test="${empty book.authors}">

                <p class="text-muted">
                    No authors assigned.
                </p>

            </c:when>

            <c:otherwise>

                <c:forEach var="author"
                           items="${book.authors}">

                    <span class="badge badge-secondary mr-1">

                        <c:out value="${author.name}"/>

                    </span>

                </c:forEach>

            </c:otherwise>

        </c:choose>

        <hr>

        <h5>
            Book Information
        </h5>

        <c:choose>

            <c:when test="${empty book.bookDetails}">

                <p class="text-muted">
                    No book details available.
                </p>

            </c:when>

            <c:otherwise>

                <table class="table table-bordered mt-3">

                    <tr>

                        <th>
                            ISBN
                        </th>

                        <td>
                            <c:out value="${book.bookDetails.isbn}"/>
                        </td>

                    </tr>

                    <tr>

                        <th>
                            Publication Date
                        </th>

                        <td>
                            <c:out value="${book.bookDetails.publicationDate}"/>
                        </td>

                    </tr>

                    <tr>

                        <th>
                            Publisher
                        </th>

                        <td>
                            <c:out value="${book.bookDetails.publisher}"/>
                        </td>

                    </tr>

                    <tr>

                        <th>
                            Number Of Pages
                        </th>

                        <td>
                            <c:out value="${book.bookDetails.numberOfPages}"/>
                        </td>

                    </tr>

                    <tr>

                        <th>
                            Language
                        </th>

                        <td>
                            <c:out value="${book.bookDetails.language}"/>
                        </td>

                    </tr>

                </table>

            </c:otherwise>

        </c:choose>

    </div>

</div>

</body>
</html>
