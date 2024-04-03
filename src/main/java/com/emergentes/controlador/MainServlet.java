
package com.emergentes.controlador;

import com.emergentes.modelo.Calificacion;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author RONALD
 */
@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MainServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MainServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    
        String op = request.getParameter("op");
        Calificacion objcal = new Calificacion();
        int id, pos;
        HttpSession ses= request.getSession();
        ArrayList<Calificacion> lista = (ArrayList<Calificacion>) ses.getAttribute("listacal");
        switch (op){ 
            case "nuevo":
                //enviar un objeto vacio a editar
                request.setAttribute("miobjcal", objcal);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                //eniva un objeto a editar pero con contenido
                id= Integer.parseInt(request.getParameter("id"));
                pos = buscarPorIndice(request,id);
                objcal=lista.get(pos);
                //obtener elobjeto
                 request.setAttribute("miobjcal", objcal);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                
                break;
            case "eliminar":
                //eliminar el registro segun el id que se recibe
                id=Integer.parseInt(request.getParameter("id"));
                pos = buscarPorIndice(request,id);
                if (pos>=0) {
                    lista.remove(pos);
                }
                request.setAttribute("listaper", lista);
                response.sendRedirect("index.jsp");
                break;
                default:
        }}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
         HttpSession ses= request.getSession();
        
        ArrayList<Calificacion> lista = (ArrayList<Calificacion>) ses.getAttribute("listacal");
        Calificacion objcal = new Calificacion();
       objcal.setId(id);
       objcal.setNombres(request.getParameter("nombres"));
       objcal.setApellidos(request.getParameter("apellidos"));
       objcal.setP1(Integer.parseInt(request.getParameter("p1")));
       objcal.setP2(Integer.parseInt(request.getParameter("p2")));
       objcal.setEF(Integer.parseInt(request.getParameter("ef")));
       objcal.setNota(Integer.parseInt(request.getParameter("nota")));
        if (id==0) {
            int idNuevo=obtenerID(request);
            objcal.setId(idNuevo);
            lista.add(objcal);
            response.sendRedirect("index.jsp");
        } else {
            int pos= buscarPorIndice(request, id);
            lista.set(pos, objcal);
            request.setAttribute("listacal", lista);
            response.sendRedirect("index.jsp");
            
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

    public int buscarPorIndice(HttpServletRequest request, int id){
        HttpSession ses= request.getSession();
        
        ArrayList<Calificacion> lista = (ArrayList<Calificacion>) ses.getAttribute("listacal");
        int pos= -1;
        if (lista!=null) {
            for (Calificacion ele:lista) {
               ++pos;
                if (ele.getId()== id) {
                    break;
                }
            }
    }
            return pos;
}
    public int obtenerID(HttpServletRequest request){
        HttpSession ses= request.getSession();
        ArrayList<Calificacion> lista= (ArrayList<Calificacion>) ses.getAttribute("listacal");
        int idn=0;
        for (Calificacion ele : lista) {
            idn=ele.getId();
        }
        return idn+1;
    }
}