<%@page import="Model.Cliente"%>
<%@page import="DAO.ClienteDAO"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
    String user = (String) session.getAttribute("usuario");
    ArrayList lista = null;
    String lstItem;
    String Item[];
    Integer indice= -1;
    try {
        if (user.equals("")) {
            response.sendRedirect("login.jsp");
        }
    } catch (NullPointerException e) {
        response.sendRedirect("login.jsp");
    }
    if (session.getAttribute("itens") != null){
        lista = new ArrayList();
        lista =(ArrayList) session.getAttribute("itens");       
    }
%>


<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="venda.jsp" class="site_title"><i class="fa fa-paw"></i>
                <span>Sistema Gestão/Venda</span></a>
        </div>

        <div class="clearfix"></div>

        <!-- menu profile quick info -->
        
        <div class="profile clearfix">
           
            <div class="profile_info">
                <span>Bem Vindo,
                <h2><% out.print(session.getAttribute("usuario"));%></h2>
                             
            </div>
            <div class="clearfix"></div>
        </div>
        <!-- /menu profile quick info -->

        <br />

        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <h3>Geral</h3>
                <ul class="nav side-menu">
                    <li><a><i class="fa fa-home"></i> Venda <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="venda.jsp">Venda</a></li>
                            <li><a href="relatorioPedidos.jsp">Relatório de pedidos</a></li>
                        </ul>
                    </li>
                    <li><a><i class="fa fa-edit"></i> Cadastro <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="cliente.jsp">Cliente</a></li>
                            <li><a href="produto.jsp">Produto</a></li>
                            <li><a href="fornecedor.jsp">Fornecedor</a></li>
                            <li><a href="usuario.jsp">Usuário</a></li>
                        </ul>
                    </li>

                    <li><a href="login.jsp"><i class="fa fa-edit"></i> SAIR </a>
                    </li>
                </ul>
            </div>
        </div>   
    </div>
</div>

<!-- top navigation -->
<div class="top_nav">
    <div class="nav_menu">
        <nav>
            <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>

            <ul class="nav navbar-nav navbar-right">                
                <li class="">
                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                       <% out.print(session.getAttribute("usuario"));%>
                        <span class=" fa fa-angle-down"></span>
                    </a>
                    
                </li>
                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                      <img src="images/carrinho.png" width="30px" height="30px"> 
                    <span class="badge bg-green"><%if (lista != null)out.print(lista.size());%></span>
                  </a                 
                </li>              
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <%                         
                        if (lista != null){
                         Iterator i = lista.iterator();

                             while ( i.hasNext()){
                                 lstItem = i.next().toString();
                                 Item = lstItem.split(";"); 
                                 NumberFormat formato = NumberFormat.getCurrencyInstance();
                               indice += 1 ;  
                     %>
                    <li>                     
                        <span>Descrição: <%=Item[0]%></span>
                        <p>
                            <span>Vlr unit: <%=formato.format(Double.parseDouble(Item[2]))%> </span>
                            <span>Qtde: <%=Item[3]%> </span>
                            <span class="">Total: <%=formato.format(Double.parseDouble(Item[4]))%> </span>
                            <a href="excluirPedido.jsp?indice=<%=indice%>">
                                <span class="time red bold">X</span>
                            </a>
                        </p>  
                    </li>
                    <%                          
                            }
                        }
                    %>
                    <li>
                      <div class="text-center">
                          <%                         
                           if (lista != null){
                               %>
                           
                        <a data-toggle="modal" data-target="#modal-mensagem">
                          <strong>Finalizar pedido</strong>                        
                          <i class="fa fa-angle-right"></i>
                        </a>
                               <%}%>
                      </div>
                    </li>
                  </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>
<div class="modal fade" id="modal-mensagem">
    <div class="modal-dialog">
         <div class="modal-content">
             <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal"><span>x</span></button>
                 <h4 class="modal-title">Selecione o cliente</h4>                 
             </div>
             <div class="modal-body">
                  <%
                        ClienteDAO cl = new ClienteDAO();
                        List<Cliente> lstcl = cl.selecionar();
                    %>

                    <table id="datatable-responsive" class="table table-striped dt-responsive nowrap" cellspacing="0" width="100%">
                        <thead>
                            <tr>                           
                                <th></th>                              
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < lstcl.size(); i++) {
                            %>                           
                              
                            </td>

                                <td>
                                    <a href="finalizar.jsp?id=<%= lstcl.get(i).getId()%>&nome= <%  out.print(lstcl.get(i).getNome());%>">
                                        
                                     <%  out.print(lstcl.get(i).getNome());%>
                                    </a>
                                </td>
                            </tr>
                            <% }
                            %>
                        </tbody>
                    </table>             
             </div>
             <div class="modal-footer">
                 <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
             </div>
         </div>
     </div>
 </div>
<!-- /top navigation -->