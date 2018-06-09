/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import DAO.UsuarioDAO;
import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.List;
import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author internet
 */
@WebServlet(name = "Logar", urlPatterns = {"/Logar"})
public class Logar extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String login = request.getParameter("user");
            String senha = request.getParameter("senha");
            Usuario usu = new Usuario();
            usu.setLogin(login);
            usu.setSenha(senha);
            UsuarioDAO usudao = new UsuarioDAO();
            List<Usuario> lsusu = usudao.selecionarUsuario(usu);

            HttpSession session = request.getSession();
            //if (login.equals("Jan") && senha.equals("1234")) {
            if (lsusu.size() > 0) {
                response.sendRedirect("cliente.jsp");
                session.setAttribute("usuario", lsusu.get(0).getNome());
                session.setAttribute("id_usuario", lsusu.get(0).getId().toString());
                session.setMaxInactiveInterval(60 * 5);
            } else {
                response.sendRedirect("login.jsp");
                session.setAttribute("usuario", "");
            }
        } catch (NullPointerException e) {
            response.sendRedirect("login.jsp");
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
