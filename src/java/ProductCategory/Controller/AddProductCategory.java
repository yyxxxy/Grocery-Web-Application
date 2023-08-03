/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProductCategory.Controller;

import ProductCategory.Entity.ProductCategory;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
public class AddProductCategory extends HttpServlet {

    @PersistenceContext
    EntityManager manager;
    @Resource
    UserTransaction transaction;

    @Override
    @SuppressWarnings("empty-statement")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        System.out.print("In do post method of Add Image Servlet");
        Part file = request.getPart("productcatimage");

        String ImagefileName = file.getSubmittedFileName();//get selected file
        System.out.print("Selected Image file name:" + ImagefileName);
       
        
        //read me : need to chage this C:/Users/user/Desktop/IgnasiusLauLiAng_KhokWaiLok_BrysonLeongKaiWah_ThongJennVen_ChooXinyu_app/Gocery/web/ImageProductCategory/ to your ImageProductUpload file path in your pc
        String pathFile = "C:/Users/user/Desktop/IgnasiusLauLiAng_KhokWaiLok_BrysonLeongKaiWah_ThongJennVen_ChooXinyu_app/Gocery/web/ImageProductCategory/";
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

        String name = request.getParameter("productcatname");
        ProductCategory prodCat = new ProductCategory(name);
        prodCat.setProductCatImage(ImagefileName);
        try {

            transaction.begin();
            manager.persist(prodCat);
            transaction.commit();
            String successMsg = "<div class=\"alert success\">\n"
                    + "  <span class=\"closebtn\">&times;</span>  \n"
                    + "  Product Category Added Successful.\n"
                    + "</div>";
            session.setAttribute("successMsg", successMsg);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        session.setAttribute("prodCat", prodCat);

        response.sendRedirect("Maintain/ProductCategory/ProductCategoryList.jsp");
    }

}
