/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DataAccessor.UserDAO;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author VenoMon
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User(); //creating object for LoginBean class, which is a normal java class, contains just setters and getters. Bean classes are efficiently used in java to access user information wherever required in the application.

        user.setEmail(email); //setting the username and password through the loginBean object then only you can get it in future.
        user.setPassword(password);

        UserDAO userDAO = new UserDAO(); //creating object for LoginDao. This class contains main logic of the application.

        String userValidate = userDAO.authenticateUser(user); //Calling authenticateUser function
        HttpSession session = request.getSession();

        if (userValidate.equals("USER")) { //If function returns success string then user will be rooted to Home page

            session.setAttribute("user_email", email); //with setAttribute() you can define a "key" and value pair so that you can get it in future using getAttribute("key")
            request.getRequestDispatcher("welcome.jsp").forward(request, response);//RequestDispatcher is used to send the control to the invoked page.
        } else if (userValidate.equals("ADMIN")) { //If function returns success string then user will be rooted to Home page

            session.setAttribute("user_email", email); //with setAttribute() you can define a "key" and value pair so that you can get it in future using getAttribute("key")
            request.getRequestDispatcher("admin.jsp").forward(request, response);//RequestDispatcher is used to send the control to the invoked page.
        } else {
            request.setAttribute("errorLogin", "Invalid Username or Password");
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            rd.include(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
