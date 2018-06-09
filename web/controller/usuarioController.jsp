<%--
    Document   : usuarioController
    Created on : 20/05/2018, 11:11:01
    Author     : Programador
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
--%>
<%@page import="Model.Usuario"%>
<%@page import="DAO.UsuarioDAO"%>
<%  try {
        String action = request.getParameter("action");
        String nome = request.getParameter("nome");
        String id = request.getParameter("id");
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        String confiSenha = request.getParameter("confSenha");
        String ativo = "false";
        ativo = request.getParameter("ativo");
        //out.print(ativo);
        UsuarioDAO usudao = new UsuarioDAO();
        Usuario usu = new Usuario();

        usu.setNome(nome);
        usu.setLogin(login);
        usu.setSenha(senha);
        if (ativo != null) {
            usu.setAtivo(true);
        } else {
            usu.setAtivo(false);
        }
        if (action.equals("insert")) {
            usu = usudao.salvar(usu);
        } else {
            usu.setId(Integer.parseInt(id));
            usu = usudao.update(usu);
        }
        response.sendRedirect("../usuario.jsp");

    } catch (Exception e) {
        out.print(e.getMessage());
    }


%>

