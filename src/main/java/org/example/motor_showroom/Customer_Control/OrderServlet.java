package org.example.motor_showroom.Customer_Control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.motor_showroom.DAO.MotorDAO;
import org.example.motor_showroom.DAO.OrderDAO;
import org.example.motor_showroom.Models.Motor;
import org.example.motor_showroom.Models.Order;
import org.example.motor_showroom.Models.User;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;

@WebServlet("/customer/order")
public class OrderServlet extends HttpServlet {
    private MotorDAO motorDao;
    private OrderDAO orderDao;

    @Override
    public void init() throws ServletException {
        super.init();
        motorDao = new MotorDAO();
        orderDao = new OrderDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int motorId = Integer.parseInt(request.getParameter("motorId"));
        Motor motor = motorDao.getMotorById(motorId);

        if (motor == null || !motor.isAvailability()) {
            response.sendRedirect(request.getContextPath() + "/customer/dashboard?error=Motor+not+available");
            return;
        }

        request.setAttribute("motor", motor);
        request.getRequestDispatcher("/Customer dashboard/order-motor.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        Order order = new Order();
        order.setUserId(user.getUserId());
        order.setMotorId(Integer.parseInt(request.getParameter("motorId")));
        order.setOrderType(request.getParameter("orderType"));

        if ("Rent".equals(order.getOrderType())) {
            order.setRentDuration(Integer.parseInt(request.getParameter("rentDuration")));
        }

        Motor motor = motorDao.getMotorById(order.getMotorId());
        double total = calculateTotal(motor, order.getRentDuration());

        order.setTotalAmount(total);
        order.setDeliveryAddress(request.getParameter("deliveryAddress"));
        order.setPaymentMethod(request.getParameter("paymentMethod"));
        order.setStatus("Pending");
        order.setOrderDate(Timestamp.from(Instant.now()));

        if (orderDao.createOrder(order)) {
            response.sendRedirect("orders?success=Order+placed+successfully");
        } else {
            response.sendRedirect("order-motor.jsp?motorId=" + order.getMotorId() + "&error=Failed+to+place+order");
        }
    }

    private double calculateTotal(Motor motor, Integer rentDuration) {
        if (rentDuration == null) return motor.getPrice() + 49.99; // Shipping fee
        return (motor.getPrice() * 0.1 * rentDuration) + 49.99; // 10% of price per day + shipping
    }
}