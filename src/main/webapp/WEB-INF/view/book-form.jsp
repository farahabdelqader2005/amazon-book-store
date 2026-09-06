<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Book</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="container mt-4">

<h2 class="mb-4">Add New Book</h2>

<form action="${pageContext.request.contextPath}/books/save" method="post">

    <div class="form-group">
        <label>Book Title:</label>
        <input type="text" name="title" class="form-control" required />
    </div>

    <div class="form-group">
        <label>Price:</label>
        <input type="number" step="0.01" name="price" class="form-control" required />
    </div>

    <div class="form-group">
        <label>Category:</label>
        <select name="categoryId" class="form-control" required>
            <option value="">Select Category</option>
            <c:forEach var="cat" items="${categories}">
                <option value="${cat.id}">${cat.name}</option>
            </c:forEach>
        </select>
    </div>

    <h4 class="mt-4">Book Details (ISBN & Publication)</h4>

    <div class="form-group">
        <label>ISBN:</label>
        <input type="text" name="isbn" class="form-control" required />
    </div>

    <div class="form-group">
        <label>Publisher:</label>
        <input type="text" name="publisher" class="form-control" />
    </div>

    <div class="form-group">
        <label>Number of Pages:</label>
        <input type="number" name="numberOfPages" class="form-control" />
    </div>

    <div class="form-group">
        <label>Language:</label>
        <input type="text" name="language" class="form-control" />
    </div>

    <button type="submit" class="btn btn-success">Save Book</button>
    <a href="${pageContext.request.contextPath}/books/list" class="btn btn-secondary">Cancel</a>
</form>

</body>
</html>
