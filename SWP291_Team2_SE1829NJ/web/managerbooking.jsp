<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manager Booking</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Booking Management</h1>
        <nav>
            <a href="home.jsp">Home</a> | 
            <a href="searchRooms.jsp">Search Rooms</a> | 
            <a href="logout.jsp">Logout</a>
        </nav>
    </header>

    <main>
        <h2>Current Bookings</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Room</th>
                    <th>Customer</th>
                    <th>Check-in Date</th>
                    <th>Check-out Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="booking" items="${bookings}">
                    <tr>
                        <td>${booking.id}</td>
                        <td>${booking.room.name}</td>
                        <td>${booking.customer.name}</td>
                        <td>${booking.checkinDate}</td>
                        <td>${booking.checkoutDate}</td>
                        <td>
                            <a href="editBooking.jsp?id=${booking.id}">Edit</a> |
                            <a href="deleteBooking?id=${booking.id}" onclick="return confirm('Are you sure you want to delete this booking?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <h2>Add New Booking</h2>
        <form action="addBooking" method="post">
            <label for="room">Room:</label>
            <select name="roomId" id="room">
                <c:forEach var="room" items="${rooms}">
                    <option value="${room.id}">${room.name}</option>
                </c:forEach>
            </select><br>

            <label for="customer">Customer:</label>
            <select name="customerId" id="customer">
                <c:forEach var="customer" items="${customers}">
                    <option value="${customer.id}">${customer.name}</option>
                </c:forEach>
            </select><br>

            <label for="checkinDate">Check-in Date:</label>
            <input type="date" id="checkinDate" name="checkinDate" required><br>

            <label for="checkoutDate">Check-out Date:</label>
            <input type="date" id="checkoutDate" name="checkoutDate" required><br>

            <input type="submit" value="Add Booking">
        </form>
    </main>

    <footer>
        <p>&copy; 2024 Hotel Management System</p>
    </footer>
</body>
</html>
