package controller.room;

import dao.RoomDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Room;


public class SearchRoom extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String peopleStr = request.getParameter("people");
//        String roomsStr = request.getParameter("rooms");

        int people = 0;
//        int rooms = 0;

        if (peopleStr != null && !peopleStr.isEmpty()) {
            try {
                people = Integer.parseInt(peopleStr);
            } catch (NumberFormatException e) {
                // Handle the error gracefully, perhaps set a default value or show an error message
                people = 0;
            }
        }

   

        RoomDAO roomDAO = new RoomDAO();
        List<Room> roomsList = roomDAO.findListRoomByNumbersRoomNumberHuman(people);

        request.setAttribute("rooms", roomsList);
        request.getRequestDispatcher("rooms.jsp").forward(request, response);
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
        return "Servlet to search rooms based on number of people and rooms";
    }
}
