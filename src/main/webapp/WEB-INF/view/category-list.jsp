<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Categories | Amazon Book Store</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <c:url var="categoryCss"
           value="/resources/css/category.css"/>

    <link rel="stylesheet"
          href="${categoryCss}">

</head>

<body>

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

    <a href="#"
       class="nav-item-custom">
        Books
    </a>

    <a href="#"
       class="nav-item-custom active">
        Categories
    </a>

    <a href="#"
       class="nav-item-custom">
        Authors
    </a>

</aside>


<div class="main-content">

    <div class="top-bar">

        <p class="top-bar-title">
            Amazon Book Store / Categories
        </p>

    </div>


    <main class="page-content">

        <div class="page-heading d-flex flex-wrap
                    justify-content-between align-items-center">

            <div>

                <p class="section-label mb-2">
                    YOUR LIBRARY, ORGANIZED
                </p>

                <h1 class="h2 page-title">
                    Categories
                </h1>

                <p class="text-muted mb-0">
                    Create and manage the categories used to organize your books.
                </p>

            </div>


            <c:url var="addUrl"
                   value="/categories/add"/>

            <a href="${addUrl}"
               class="btn btn-brand px-4 py-2 mt-3 mt-md-0">

                + Add Category

            </a>

        </div>


        <c:if test="${param.success == 'saved'}">

            <div class="alert alert-success">
                Category saved successfully.
            </div>

        </c:if>


        <c:if test="${param.success == 'deleted'}">

            <div class="alert alert-success">
                Category deleted successfully.
            </div>

        </c:if>


        <c:if test="${param.error == 'notFound'}">

            <div class="alert alert-danger">
                Category not found.
            </div>

        </c:if>


        <c:url var="listUrl"
               value="/categories/list"/>


        <div class="search-card">

            <form action="${listUrl}"
                  method="get"
                  class="search-form">

                <div class="form-row">

                    <div class="col-md-10 mb-2 mb-md-0">

                        <input type="text"
                               name="keyword"
                               class="form-control"
                               placeholder="Search categories..."
                               value="${param.keyword}">

                    </div>


                    <div class="col-md-2">

                        <button type="submit"
                                class="btn search-btn btn-block">

                            Search

                        </button>

                    </div>

                </div>

            </form>

        </div>


        <section class="content-card">

            <div class="card-header-custom">
                <h2>Category List</h2>
            </div>


            <c:choose>

                <c:when test="${empty categories}">

                    <div class="empty-state">

                        <div class="empty-icon">
                            +
                        </div>

                        <h2 class="h4 font-weight-bold">
                            A fresh start for your library
                        </h2>

                        <p class="text-muted">
                            Add your first category to start organizing your books.
                        </p>

                        <a href="${addUrl}"
                           class="btn btn-brand mt-2">

                            Create First Category

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
                                    CATEGORY NAME
                                </th>

                                <th class="text-right pr-4">
                                    ACTIONS
                                </th>

                            </tr>

                            </thead>


                            <tbody>


                            <c:forEach var="category"
                                       items="${categories}">


                                <c:url var="editUrl"
                                       value="/categories/edit">

                                    <c:param name="id"
                                             value="${category.id}"/>

                                </c:url>


                                <c:url var="deleteUrl"
                                       value="/categories/delete"/>


                                <tr>

                                    <td class="pl-4 category-id">

                                        #<c:out value="${category.id}"/>

                                    </td>


                                    <td class="category-name">

                                        <c:out value="${category.name}"/>

                                    </td>


                                    <td class="text-right pr-4">

                                        <a href="${editUrl}"
                                           class="btn btn-outline-secondary btn-sm btn-edit">

                                            Edit

                                        </a>


                                        <form action="${deleteUrl}"
                                              method="post"
                                              class="d-inline-block"
                                              onsubmit="return confirm('Are you sure you want to delete this category? Books linked to this category will remain in the system.');">


                                            <input type="hidden"
                                                   name="id"
                                                   value="${category.id}">


                                            <button type="submit"
                                                    class="btn btn-outline-danger btn-sm btn-delete">

                                                Delete

                                            </button>

                                        </form>

                                    </td>

                                </tr>


                            </c:forEach>


                            </tbody>

                        </table>

                    </div>


                    <c:if test="${totalPages > 1}">

                        <div class="pagination-area d-flex
                                    justify-content-between align-items-center">


                            <div class="page-info">

                                Page ${currentPage} of ${totalPages}

                            </div>


                            <nav>

                                <ul class="pagination pagination-sm">


                                    <c:choose>

                                        <c:when test="${currentPage == 1}">

                                            <li class="page-item disabled">

                                                <span class="page-link">
                                                    Previous
                                                </span>

                                            </li>

                                        </c:when>


                                        <c:otherwise>

                                            <c:url var="previousUrl"
                                                   value="/categories/list">

                                                <c:param name="page"
                                                         value="${currentPage - 1}"/>

                                            </c:url>


                                            <li class="page-item">

                                                <a class="page-link"
                                                   href="${previousUrl}">

                                                    Previous

                                                </a>

                                            </li>

                                        </c:otherwise>

                                    </c:choose>


                                    <c:forEach var="pageNumber"
                                               begin="1"
                                               end="${totalPages}">


                                        <c:url var="pageUrl"
                                               value="/categories/list">

                                            <c:param name="page"
                                                     value="${pageNumber}"/>

                                        </c:url>


                                        <c:choose>

                                            <c:when test="${pageNumber == currentPage}">

                                                <li class="page-item active">

                                                    <span class="page-link">
                                                            ${pageNumber}
                                                    </span>

                                                </li>

                                            </c:when>


                                            <c:otherwise>

                                                <li class="page-item">

                                                    <a class="page-link"
                                                       href="${pageUrl}">

                                                            ${pageNumber}

                                                    </a>

                                                </li>

                                            </c:otherwise>

                                        </c:choose>


                                    </c:forEach>


                                    <c:choose>

                                        <c:when test="${currentPage == totalPages}">

                                            <li class="page-item disabled">

                                                <span class="page-link">
                                                    Next
                                                </span>

                                            </li>

                                        </c:when>


                                        <c:otherwise>

                                            <c:url var="nextUrl"
                                                   value="/categories/list">

                                                <c:param name="page"
                                                         value="${currentPage + 1}"/>

                                            </c:url>


                                            <li class="page-item">

                                                <a class="page-link"
                                                   href="${nextUrl}">

                                                    Next

                                                </a>

                                            </li>

                                        </c:otherwise>

                                    </c:choose>


                                </ul>

                            </nav>

                        </div>

                    </c:if>

                </c:otherwise>

            </c:choose>

        </section>

    </main>

</div>

</body>

</html>
