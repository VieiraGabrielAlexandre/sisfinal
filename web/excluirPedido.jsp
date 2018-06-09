<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList lista = null;
    String indice= request.getParameter("indice");
    if (session.getAttribute("itens") != null){
        lista = new ArrayList();
        lista =(ArrayList) session.getAttribute("itens");
    }
    lista.remove(Integer.parseInt(indice));
    response.sendRedirect("venda.jsp");

%>