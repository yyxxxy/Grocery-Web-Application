/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Staff.controller;

import Staff.entity.Staff;
import java.io.IOException;
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
public class StaffUpdateServlet extends HttpServlet {

    @PersistenceContext
    EntityManager manager;
    @Resource
    UserTransaction transaction;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            transaction.begin();
            Staff staff = manager.find(Staff.class, Integer.valueOf(request.getParameter("staffID")));
            staff.setStaffUsername(request.getParameter("staffName"));
            staff.setStaffEmail(request.getParameter("staffEmail"));
            staff.setStaffFullname(request.getParameter("staffFullname"));
            staff.setStaffIcNo(request.getParameter("staffIC"));
            staff.setStaffPhNo(request.getParameter("staffPH"));
            staff.setStaffAddress(request.getParameter("staffAddress"));
            staff.setStaffGender(request.getParameter("staffGender"));

            manager.merge(staff);
            transaction.commit();

            String successMsg = "<div class=\"alert success\">\n"
                    + "  <span class=\"closebtn\">&times;</span>  \n"
                    + "  Staff Updated Successful.\n"
                    + "</div>";
            HttpSession session = request.getSession();
            session.setAttribute("successMsg", successMsg);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        response.sendRedirect("Maintain/Staff/StaffList.jsp");
    }

}
