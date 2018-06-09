
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String codigo;
    String qtde;
    String descricao;
    String preco;
    codigo = request.getParameter("id");
    qtde = request.getParameter("qtde");    
    descricao = request.getParameter("descricao");    
    preco = request.getParameter("preco"); 
  
   
    try {
            
       ArrayList arr = new ArrayList();
        if (session.getAttribute("itens") != null){
            arr =(ArrayList) session.getAttribute("itens");
            //out.print(arr.toString());
        }
        double dPreco = Double.parseDouble(preco);
        double dqtde= Double.parseDouble(qtde);
        double dTotal= dPreco * dqtde;
        arr.add(descricao+";"+codigo+";"+preco+";"+qtde+";"+dTotal);
        session.setAttribute("itens", arr);
        //out.print(arr.toString());
     } catch (Exception e) {
         out.print(e.getMessage());
     }
   response.sendRedirect("venda.jsp");
        
%>