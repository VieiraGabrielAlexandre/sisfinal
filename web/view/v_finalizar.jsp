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
    id = request.getParameter("id");
   
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
                <p>Finalizar pedido para o cliente  <% out.print(nome);%>.</p>
                <% 
                    
                    ArrayList listaF = null;
                    String lstItemF;
                    String ItemF[];
                    if (session.getAttribute("itens") != null){
                        listaF = new ArrayList();
                        listaF =(ArrayList) session.getAttribute("itens");       
                    }        
                %>

                    <table id="example" class="display" style="width:100%">
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Descricao</th>
                                <th>valor Unitario</th>
                                <th>Quantidade</th>
                                <th>Valor total</th>                             
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            if (listaF != null){
                            Iterator i = listaF.iterator();

                           while ( i.hasNext()){
                                lstItemF = i.next().toString();
                                ItemF = lstItemF.split(";"); 
                                NumberFormat formato = NumberFormat.getCurrencyInstance();
                            %>
                            <tr>
                                <td><%  out.print(ItemF[1]);%></td>
                                <td><%  out.print(ItemF[0]);%></td>
                                <td><%  out.print(formato.format(Double.parseDouble(ItemF[2])));%></td>
                                <td><%  out.print(ItemF[3]);%></td>
                                <td><%  out.print(formato.format(Double.parseDouble(ItemF[4])));%></td>
                            </tr>
                            <% }
                            }
                            %>
                        </tbody>
                    </table>
                    <div class="title_right">
                    <div class="pull-right">
                        <div class="input-group">
                            <a href="finalizarPedido.jsp?action=finalizar&id_u=<%= id %>"><br><button type="button" class="btn btn-round btn-success">Finalizar</button></a>
                        </div>
                    </div>
                </div>
            </div>            
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#example').dataTable({
            "language": {
                "url": "https://cdn.datatables.net/plug-ins/1.10.16/i18n/Portuguese-Brasil.json"
            }
        });
    });
</script>