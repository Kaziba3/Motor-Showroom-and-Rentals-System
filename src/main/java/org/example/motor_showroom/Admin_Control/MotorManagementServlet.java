package org.example.motor_showroom.Admin_Control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.example.motor_showroom.DAO.MotorDAO;
import org.example.motor_showroom.Models.Motor;

import java.io.File;
import java.io.IOException;

@WebServlet("/admin/motors")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class MotorManagementServlet extends HttpServlet {
    private MotorDAO motorDao;
    private final String UPLOAD_DIRECTORY = "uploads";

    @Override
    public void init() throws ServletException {
        super.init();
        motorDao = new MotorDAO();
        new File(UPLOAD_DIRECTORY).mkdirs();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            int motorId = Integer.parseInt(request.getParameter("id"));
            Motor motor = motorDao.getMotorById(motorId);
            request.setAttribute("motor", motor);
            request.getRequestDispatcher("/Admin dashboard/edit-motor.jsp").forward(request, response);
        } else {
            request.setAttribute("allMotors", motorDao.getAllMotors());
            request.getRequestDispatcher("/Admin dashboard/manage-motors.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            handleAddMotor(request, response);
        } else if ("update".equals(action)) {
            handleUpdateMotor(request, response);
        } else if ("delete".equals(action)) {
            handleDeleteMotor(request, response);
        } else if ("toggle".equals(action)) {
            handleToggleAvailability(request, response);
        }
    }

    private void handleAddMotor(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Motor motor = new Motor();
        motor.setName(request.getParameter("name"));
        motor.setType(request.getParameter("type"));
        motor.setPower(Double.parseDouble(request.getParameter("power")));
        motor.setPrice(Double.parseDouble(request.getParameter("price")));
        motor.setDescription(request.getParameter("description"));

        Part filePart = request.getPart("image");
        String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
        String filePath = UPLOAD_DIRECTORY + File.separator + fileName;
        filePart.write(filePath);

        motor.setImagePath(filePath);
        motor.setAvailability(true);

        if (motorDao.addMotor(motor)) {
            response.sendRedirect("motors?success=Motor+added+successfully");
        } else {
            response.sendRedirect("motors?error=Failed+to+add+motor");
        }
    }

    private void handleUpdateMotor(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Motor motor = new Motor();
        motor.setMotorId(Integer.parseInt(request.getParameter("motorId")));
        motor.setName(request.getParameter("name"));
        motor.setType(request.getParameter("type"));
        motor.setPower(Double.parseDouble(request.getParameter("power")));
        motor.setPrice(Double.parseDouble(request.getParameter("price")));
        motor.setDescription(request.getParameter("description"));

        Part filePart = request.getPart("image");
        if (filePart.getSize() > 0) {
            String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
            String filePath = UPLOAD_DIRECTORY + File.separator + fileName;
            filePart.write(filePath);
            motor.setImagePath(filePath);
        }

        if (motorDao.updateMotor(motor)) {
            response.sendRedirect("motors?success=Motor+updated+successfully");
        } else {
            response.sendRedirect("motors?error=Failed+to+update+motor");
        }
    }

    private void handleDeleteMotor(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int motorId = Integer.parseInt(request.getParameter("motorId"));
        if (motorDao.deleteMotor(motorId)) {
            response.sendRedirect("motors?success=Motor+deleted+successfully");
        } else {
            response.sendRedirect("motors?error=Failed+to+delete+motor");
        }
    }

    private void handleToggleAvailability(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int motorId = Integer.parseInt(request.getParameter("id"));
        if (motorDao.toggleMotorAvailability(motorId)) {
            response.sendRedirect("motors?success=Availability+updated+successfully");
        } else {
            response.sendRedirect("motors?error=Failed+to+update+availability");
        }
    }
}