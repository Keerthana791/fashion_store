package com.fashion_store.controller;

import com.fashion_store.dao.UserDAO;
import com.fashion_store.dao.impl.UserDAOImpl;
import com.fashion_store.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAOImpl();

    // GET: Show registration form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
    }

    // POST: Register new user
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name        = request.getParameter("name");
        String email       = request.getParameter("email");
        String password    = request.getParameter("password");
        String confirm     = request.getParameter("confirmPassword");
        String phone       = request.getParameter("phone");
        String addressLine = request.getParameter("addressLine");
        String city        = request.getParameter("city");
        String state       = request.getParameter("state");
        String country     = request.getParameter("country");
        String pincode     = request.getParameter("pincode");

        // Validation
        if (name == null || name.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Name, email, and password are required.");
            request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirm)) {
            request.setAttribute("error", "Passwords do not match.");
            request.setAttribute("formData", request.getParameterMap());
            request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
            return;
        }

        // Check if email already exists
        User existing = userDAO.getUserByEmail(email.trim());
        if (existing != null) {
            request.setAttribute("error", "An account with this email already exists.");
            request.setAttribute("formData", request.getParameterMap());
            request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
            return;
        }

        // Build User object
        User user = new User();
        user.setName(name.trim());
        user.setEmail(email.trim());
        user.setPassword(password);          // Hash in production (e.g. BCrypt)
        user.setPhone(phone != null ? phone.trim() : "");
        user.setAddressLine(addressLine != null ? addressLine.trim() : "");
        user.setCity(city != null ? city.trim() : "");
        user.setState(state != null ? state.trim() : "");
        user.setCountry(country != null ? country.trim() : "");
        user.setPincode(pincode != null ? pincode.trim() : "");

        boolean success = userDAO.registerUser(user);

        if (success) {
            request.setAttribute("success", "Account created! Please log in.");
            response.sendRedirect(request.getContextPath() + "/login?registered=true");
        } else {
            request.setAttribute("error", "Registration failed. Please try again.");
            request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
        }
    }
}
