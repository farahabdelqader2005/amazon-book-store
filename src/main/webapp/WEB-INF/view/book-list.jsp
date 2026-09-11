<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Books | Amazon Book Store</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <c:url var="bookCss" value="/resources/css/book.css"/>
    <link rel="stylesheet" href="${bookCss}">
</head>

<body>

<c:url var="booksUrl" value="/books/list"/>
<c:url var="categoriesUrl" value="/categories/list"/>
<c:url var="authorsUrl" value="/authors/list"/>
<c:url var="addUrl" value="/books/add"/>
<c:url var="deleteUrl" value="/books/delete"/>

<aside class="sidebar">

    <div class="brand">
        amazon<span> books</span>
    </div>

    <div class="brand-subtitle">
        Library Management
    </div>

    <p class="menu-label">
        MANAGEMENT
    </p>

    <a href="${booksUrl}"
       class="nav-item-custom active"
       aria-current="page">
        Books
    </a>

    <a href="${categoriesUrl}"
       class="nav-item-custom">
        Categories
    </a>

    <a href="${authorsUrl}"
       class="nav-item-custom">
        Authors
    </a>

</aside>

<div class="main-content">

    <div class="top-bar">

        <p class="top-bar-title">
            Amazon Book Store / Books
        </p>

    </div>

    <main class="page-content">

        <div class="page-heading d-flex flex-wrap justify-content-between align-items-center">

            <div>

                <p class="section-label mb-2">
                    YOUR LIBRARY, ORGANIZED
                </p>

                <h1 class="h2 page-title">
                    Books
                </h1>

                <p class="text-muted mb-0">
                    Manage the books available in your library.
                </p>

            </div>

            <a href="${addUrl}"
               class="btn btn-brand px-4 py-2 mt-3 mt-md-0">

                + Add Book

            </a>

        </div>

        <c:if test="${param.success == 'saved'}">

            <div class="alert alert-success">
                Book saved successfully.
            </div>

        </c:if>

        <c:if test="${param.success == 'deleted'}">

            <div class="alert alert-success">
                Book deleted successfully.
            </div>

        </c:if>

        <c:if test="${param.error == 'notFound'}">

            <div class="alert alert-danger">
                Book not found.
            </div>

        </c:if>

        <section class="content-card">

            <div class="card-header-custom">

                <h2>
                    Book List
                </h2>

            </div>

            <c:choose>

                <c:when test="${empty books}">

                    <div class="empty-state">

                        <div class="empty-icon">
                            +
                        </div>

                        <h2 class="h4 font-weight-bold">
                            Your library is empty
                        </h2>

                        <p class="text-muted">
                            Add your first book to start building your library.
                        </p>

                        <a href="${addUrl}"
                           class="btn btn-brand mt-2">

                            Create First Book

                        </a>

                    </div>

                </c:when>

                <c:otherwise>

                    <div class="table-responsive">

                        <table class="table">

                            <thead>

                            <tr>

                                <th class="pl-4">
                                    ID
                                </th>

                                <th>
                                    TITLE
                                </th>

                                <th>
                                    CATEGORIES
                                </th>

                                <th>
                                    AUTHORS
                                </th>

                                <th class="text-right pr-4">
                                    ACTIONS
                                </th>

                            </tr>

                            </thead>

                            <tbody>

                            <c:forEach var="book"
                                       items="${books}">

                                <c:url var="detailsUrl"
                                       value="/books/details">

                                    <c:param name="id"
                                             value="${book.id}"/>

                                </c:url>

                                <c:url var="editUrl"
                                       value="/books/edit">

                                    <c:param name="id"
                                             value="${book.id}"/>

                                </c:url>

                                <tr>

                                    <td class="pl-4 book-id">

                                        #<c:out value="${book.id}"/>

                                    </td>

                                    <td class="book-title">

                                        <c:out value="${book.title}"/>

                                    </td>

                                    <td>

                                        <c:forEach var="category"
                                                   items="${book.categories}">

                                            <span class="category-tag">

                                                <c:out value="${category.name}"/>

                                            </span>

                                        </c:forEach>

                                    </td>

                                    <td>

                                        <c:forEach var="author"
                                                   items="${book.authors}">

                                            <span class="author-tag">

                                                <c:out value="${author.name}"/>

                                            </span>

                                        </c:forEach>

                                    </td>

                                    <td class="text-right pr-4">

                                        <a href="${detailsUrl}"
                                           class="btn btn-details btn-sm">

                                            Details

                                        </a>

                                        <a href="${editUrl}"
                                           class="btn btn-edit btn-sm">

                                            Edit

                                        </a>

                                        <form action="${deleteUrl}"
                                              method="post"
                                              class="d-inline-block"
                                              onsubmit="return confirm('Are you sure you want to delete this book? Categories and authors will remain.');">

                                            <input type="hidden"
                                                   name="id"
                                                   value="${book.id}">

                                            <button type="submit"
                                                    class="btn btn-delete btn-sm">

                                                Delete

                                            </button>

                                        </form>

                                    </td>

                                </tr>

                            </c:forEach>

                            </tbody>

                        </table>

                    </div>

                </c:otherwise>

            </c:choose>

        </section>

    </main>

</div>

</body>
</html>
