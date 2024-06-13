package controller;

import dao.RoomDAO;
import dao.TypeRoomDAO;
import model.Room;
import model.TypeRoom;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "RoomSearchServlet", urlPatterns = {"/searchRooms"})
public class RoomSearchServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(RoomSearchServlet.class.getName());

    private static final String ROOMS_JSP = "rooms.jsp";
    private static final String ERROR_MESSAGE = "error";
    private static final String INVALID_ROOM_TYPE_ID = "Invalid room type ID.";
    private static final String NO_ROOMS_FOUND = "No matching rooms found.";
    private static final String SEARCH_PARAMETERS_LOG = "Search parameters - userQuantity: %s, priceRange: %s, typeRoomId: %s";
    private static final String ROOMS_FOUND_LOG = "Number of rooms found: %d";
    private static final String ROOMS_ATTRIBUTE = "rooms";
    private static final String TYPE_ROOMS_ATTRIBUTE = "typeRooms";
    private static final String MESSAGE_ATTRIBUTE = "message";
    private static final String USER_QUANTITY_PARAM = "userQuantity";
    private static final String PRICE_RANGE_PARAM = "priceRange";
    private static final String TYPE_ROOM_ID_PARAM = "typeRoomId";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Fetch all type rooms
            TypeRoomDAO typeRoomDAO = new TypeRoomDAO();
            List<TypeRoom> typeRooms = typeRoomDAO.listAllTypeRooms();
            typeRooms.forEach(typeRoom -> logger.info(typeRoom.toString()));

            // Get parameters
            String userQuantity = request.getParameter(USER_QUANTITY_PARAM);
            String priceRange = request.getParameter(PRICE_RANGE_PARAM);
            String typeRoomIdStr = request.getParameter(TYPE_ROOM_ID_PARAM);

            // Log parameters
            logger.info(String.format(SEARCH_PARAMETERS_LOG, userQuantity, priceRange, typeRoomIdStr));

            // Convert typeRoomId to Integer if not null or empty
            Integer typeRoomId = null;
            if (typeRoomIdStr != null && !typeRoomIdStr.trim().isEmpty()) {
                typeRoomId = Integer.valueOf(typeRoomIdStr);
            }

            // Fetch rooms based on parameters
            RoomDAO roomDAO = new RoomDAO();
            List<Room> rooms = roomDAO.getAllByParam(userQuantity, priceRange, typeRoomId);

            // Check if rooms are found
            if (rooms.isEmpty()) {
                request.setAttribute(MESSAGE_ATTRIBUTE, NO_ROOMS_FOUND);
            }

            // Log the number of rooms found
            logger.info(String.format(ROOMS_FOUND_LOG, rooms.size()));

            // Set attributes and forward to JSP
            request.setAttribute(ROOMS_ATTRIBUTE, rooms);
            request.setAttribute(TYPE_ROOMS_ATTRIBUTE, typeRooms);
            request.getRequestDispatcher(ROOMS_JSP).forward(request, response);

        } catch (NumberFormatException e) {
            // Handle invalid typeRoomId format
            logger.log(Level.SEVERE, "Invalid typeRoomId format", e);
            request.setAttribute(ERROR_MESSAGE, INVALID_ROOM_TYPE_ID);
            request.getRequestDispatcher(ROOMS_JSP).forward(request, response);
        } catch (ServletException | IOException e) {
            // Handle any other exceptions
            logger.log(Level.SEVERE, "An unexpected error occurred", e);
            request.setAttribute(ERROR_MESSAGE, "An error occurred while searching for rooms.");
            request.getRequestDispatcher(ROOMS_JSP).forward(request, response);
        }
    }
}
