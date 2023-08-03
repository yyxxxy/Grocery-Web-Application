/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Product.Controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.persistence.Query;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.transaction.UserTransaction;

/**
 *
 * @author user
 */
@MultipartConfig
public class CreateProduct extends HttpServlet {

    @PersistenceContext
    EntityManager manager;
    @Resource
    UserTransaction transaction;

    @Override
    @SuppressWarnings("empty-statement")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.print("In do post method of Add Image Servlet");
        Part file = request.getPart("prodImage");

        String ImagefileName = file.getSubmittedFileName();//get selected file
        System.out.print("Selected Image file name:" + ImagefileName);

        //read me : need to chage this C:/Users/user/Desktop/IgnasiusLauLiAng_KhokWaiLok_BrysonLeongKaiWah_ThongJennVen_ChooXinyu_app/Gocery/web/ImageProductUpload/ to the ImageProductUpload file path in your pc
        String pathFile = "C:/Users/user/Desktop/IgnasiusLauLiAng_KhokWaiLok_BrysonLeongKaiWah_ThongJennVen_ChooXinyu_app/Gocery/web/ImageProductUpload/";
        String uploadPath = pathFile + ImagefileName; //upload path where we have to uplaod our actual page
        System.out.print("Upload :" + uploadPath);

        //Uploading our selected image into the img folder
        try {
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = file.getInputStream();
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            transaction.begin();
            Query insertQuery;
            insertQuery = manager.createNativeQuery("INSERT INTO PRODUCT (PRODUCT_NAME, PRODUCT_PRICE, PRODUCT_QTY, PRODUCT_DESC, PRODUCT_IMAGE, FK_PROD_CAT_ID) VALUES (?,?,?,?,?,?)")
                    .setParameter(1, request.getParameter("prodName"))
                    .setParameter(2, Double.parseDouble(request.getParameter("prodPrice")))
                    .setParameter(3, Integer.parseInt(request.getParameter("prodQuantity")))
                    .setParameter(4, request.getParameter("prodDesc"))
                    .setParameter(5, ImagefileName)
                    .setParameter(6, Integer.parseInt(request.getParameter("prodcatid")));

            insertQuery.executeUpdate();
            transaction.commit();
            String successMsg = "<div class=\"alert success\">\n"
                    + "  <span class=\"closebtn\">&times;</span>  \n"
                    + "  Product Added Successful.\n"
                    + "</div>";
            HttpSession session = request.getSession();
            session.setAttribute("successMsg", successMsg);

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        response.sendRedirect("Maintain/Product/ProductList.jsp");
    }
}
