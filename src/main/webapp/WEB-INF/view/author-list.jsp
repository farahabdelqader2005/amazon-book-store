<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Authors | Amazon Books</title>

    <c:url var="authorCss" value="/resources/css/author.css"/>
    <link rel="stylesheet" href="${authorCss}">
</head>

<body>
<c:url var="categoriesUrl" value="/categories/list"/>
<c:url var="authorsUrl" value="/authors/list"/>
<c:url var="addUrl" value="/authors/add"/>
<c:url var="deleteUrl" value="/authors/delete"/>

<header>
    <div class="brand">amazon <span>books</span></div>
    <div>Library Management</div>

    <nav aria-label="Main navigation">
        <a href="${categoriesUrl}">Categories</a>
        <a href="${authorsUrl}" aria-current="page">Authors</a>
    </nav>
</header>

<main>
    <div class="heading">
        <div>
            <h1>Authors</h1>
            <p class="muted">The people behind your library's books.</p>
        </div>

        <a class="button primary" href="${addUrl}">
            + Add Author
        </a>
    </div>

    <c:if test="${param.success == 'saved'}">
        <div class="alert success" role="status">
            Author saved successfully.
        </div>
    </c:if>

    <c:if test="${param.success == 'deleted'}">
        <div class="alert success" role="status">
            Author deleted successfully.
        </div>
    </c:if>

    <c:if test="${param.error == 'notFound'}">
        <div class="alert error" role="alert">
            Author not found.
        </div>
    </c:if>

    <div class="card">
        <c:choose>
            <c:when test="${empty authors}">
                <div class="empty">
                    <h2>Meet your library's authors</h2>
                    <p class="muted">
                        Add your first author to get started.
                    </p>

                    <a class="button primary" href="${addUrl}">
                        Create First Author
                    </a>
                </div>
            </c:when>

            <c:otherwise>
                <table>
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">AUTHOR NAME</th>
                        <th scope="col" class="actions-heading">
                            ACTIONS
                        </th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="author" items="${authors}">
                        <c:url var="editUrl" value="/authors/edit">
                            <c:param name="id" value="${author.id}"/>
                        </c:url>

                        <tr>
                            <td>#<c:out value="${author.id}"/></td>

                            <td class="author-name">
                                <c:out value="${author.name}"/>
                            </td>

                            <td>
                                <div class="actions">
                                    <a class="button edit" href="${editUrl}">
                                        Edit
                                    </a>

                                    <form action="${deleteUrl}"
                                          method="post"
                                          onsubmit="return confirm('Delete this author? Their books will be kept.');">

                                        <input type="hidden"
                                               name="id"
                                               value="${author.id}">

                                        <button class="button delete"
                                                type="submit">
                                            Delete
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</main>
</body>
</html>
