/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Staff.controller;

import Staff.da.StaffDA;
import Staff.entity.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author user
 */
public class RegisterStaffServelt extends HttpServlet {

    @PersistenceContext
    EntityManager manager;
    @Resource
    UserTransaction transaction;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Staff> checkStaff = StaffDA.getAllRecords();
        boolean exist = false;

        //check exist username
        for (int i = 0; i < checkStaff.size(); i++) {
            if (checkStaff.get(i).getStaffUsername().equals(request.getParameter("staffName"))) {
                exist = true;
            }
        }

        if (exist == true) {
            session.setAttribute("userNameExist", "Username Exist.");
            response.sendRedirect("Maintain/Staff/RegisterStaff.jsp");

        } else if (request.getParameter("staffPassword").equals(request.getParameter("staffPasswordRepeat"))) {

            Staff staff = new Staff();
            staff.setStaffUsername(request.getParameter("staffName"));
            staff.setStaffPassword(request.getParameter("staffPassword"));
            staff.setStaffEmail(request.getParameter("staffEmail"));
            staff.setStaffFullname(request.getParameter("staffFullname"));
            staff.setStaffIcNo(request.getParameter("staffIC"));
            staff.setStaffPhNo(request.getParameter("staffPH"));
            staff.setStaffAddress(request.getParameter("staffAddress"));
            staff.setStaffGender(request.getParameter("staffGender"));

            try {

                transaction.begin();
                manager.persist(staff);
                transaction.commit();
                String successMsg = "<div class=\"alert success\">\n"
                        + "  <span class=\"closebtn\">&times;</span>  \n"
                        + "  Staff Added Successful.\n"
                        + "</div>";
                session.setAttribute("successMsg", successMsg);

            } catch (Exception ex) {
                ex.printStackTrace();
            }

            response.sendRedirect("Maintain/Staff/StaffList.jsp");
        } else {
            session.setAttribute("incorrectPassword", "Password need to be same.");
            response.sendRedirect("Maintain/Staff/RegisterStaff.jsp");
        }
    }

}
