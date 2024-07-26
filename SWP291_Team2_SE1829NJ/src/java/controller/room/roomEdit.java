package controller.room;

import dao.RoomDAO;
import dao.RoomImageDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Hotel;
import model.Room;
import model.RoomImage;
import model.TypeRoom;

/**
 * @author HUNG
 */
public class roomEdit extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // Support for Unicode data sent from the form
        response.setContentType("text/html; charset=UTF-8");

        // Parsing form data
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String roomFloor = request.getParameter("room_floor");
        int userQuantity = Integer.parseInt(request.getParameter("userQuantity"));
        float area = Float.parseFloat(request.getParameter("area"));
        float price = Float.parseFloat(request.getParameter("price"));
        int statusId = Integer.parseInt(request.getParameter("status_id"));
        int hotelId = Integer.parseInt(request.getParameter("hotel_id"));
        int typeId = Integer.parseInt(request.getParameter("type_id"));
        String description = request.getParameter("description");
        boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));
        String[] imageUrls = request.getParameterValues("imageUrls");
        String newImageUrl = request.getParameter("newImageUrls");

        // Creating a room object from the data
        Room room = new Room();
        room.setId(id);
        room.setName(name);
        room.setRoom_floor(roomFloor);
        room.setUserQuantity(userQuantity);
        room.setArea(area);
        room.setPrice(price);
        room.setStatus(statusId);
        room.setDescription(description);
        room.setIsActive(isActive);
        room.setHotel(new Hotel(hotelId));
        room.setTypeRoom(new TypeRoom(typeId));

        // Creating RoomImage list from images
        List<RoomImage> roomImages = new ArrayList<>();
        if (imageUrls != null) {
            for (String imageUrl : imageUrls) {
                if (imageUrl != null && !imageUrl.trim().isEmpty()) { // Check if the image URL is not empty
                    RoomImage roomImage = new RoomImage();
                    roomImage.setImg(imageUrl.trim());
                    roomImage.setRoom(room);
                    roomImages.add(roomImage);
                }
            }
        }

        // Adding new image if present
        if (newImageUrl != null && !newImageUrl.trim().isEmpty()) {
            RoomImage roomImage = new RoomImage();
            roomImage.setImg(newImageUrl.trim());
            roomImage.setRoom(room);
            roomImages.add(roomImage);
        }

        RoomDAO roomDAO = new RoomDAO();
        boolean result = roomDAO.editRoomById(room, roomImages);

        if (result) {
            response.sendRedirect("roommanagement");
        } else {
            request.setAttribute("errorMessage", "Error updating room");
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
