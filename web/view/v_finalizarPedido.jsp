<%@page import="Model.Pedidos_itens"%>
<%@page import="DAO.Pedidos_ItensDAO"%>
<%@page import="DAO.PedidosDAO"%>
<%@page import="Model.Pedidos"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ClienteDAO"%>
<%
    String id;
    String nome;
    nome = request.getParameter("nome");
    id = request.getParameter("id_u");
    String user_id = (String) session.getAttribute("id_usuario");
    Pedidos p = new Pedidos();
    p.setId_cliente(Integer.parseInt(id));
    p.setId_usuario(Integer.parseInt(user_id));
    PedidosDAO pdao = new PedidosDAO();
    p= pdao.salvar(p);
    
    Pedidos_ItensDAO itensDAO = new Pedidos_ItensDAO();
    ArrayList listaF = null;
    String lstItemF;
    String ItemF[];
    if (session.getAttribute("itens") != null){
        listaF = new ArrayList();
        listaF =(ArrayList) session.getAttribute("itens");
        Iterator i = listaF.iterator();
         while ( i.hasNext()){
            Pedidos_itens itens = new Pedidos_itens();
            lstItemF = i.next().toString();
            ItemF = lstItemF.split(";"); 
            NumberFormat formato = NumberFormat.getCurrencyInstance();
            
            itens.setId_pedido(p.getId());
            itens.setDescricao(ItemF[0]);
            itens.setValor_unitario(Float.parseFloat(ItemF[2]));
            itens.setQuantidade(Integer.parseInt(ItemF[3]));
            itens.setValor_total(Float.parseFloat(ItemF[4]));
           
            itens = itensDAO.salvar(itens);
         }
         
    }
       listaF.clear();
        session.setAttribute("itens",listaF);
        response.sendRedirect("venda.jsp");
   %> 
    

<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Finalizar pedido</h3>
            </div>            
        </div>
        
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">    
                <p>to aqui bicha <%= user_id%></p>
            </div>            
        </div>
    </div>
</div>
    <!-- /page content -->