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
<%@page import="Model.Fornecedor"%>
<%@page import="DAO.FornecedorDAO"%>
<%  try {
        String action = request.getParameter("action");
        String razao = request.getParameter("razao");
        String id = request.getParameter("id");        
        String ativo = "false";
        ativo = request.getParameter("ativo");
        //out.print(ativo);
        FornecedorDAO fornecedorDAO = new FornecedorDAO();
        Fornecedor fornecedor = new Fornecedor();

        fornecedor.setRazaoSocial(razao);
   
        
        if (ativo != null) {
            fornecedor.setAtivo(true);
        } else {
            fornecedor.setAtivo(false);
        }
        if (action.equals("insert")) {
            fornecedor = fornecedorDAO.salvar(fornecedor);
        } else {
            fornecedor.setId(Integer.parseInt(id));
            fornecedor = fornecedorDAO.update(fornecedor);
        }
        response.sendRedirect("../fornecedor.jsp");

    } catch (Exception e) {
        out.print(e.getMessage());
    }


%>

