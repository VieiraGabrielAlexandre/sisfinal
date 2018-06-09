<%@page import="java.text.NumberFormat"%>
<%@page import="DAO.Pedidos_ItensDAO"%>
<%@page import="Model.Pedidos_itens"%>
<%@page import="DAO.ClienteDAO"%>
<%@page import="Model.Cliente"%>
<%@page import="DAO.PedidosDAO"%>
<%@page import="Model.Pedidos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.AbstractList"%>
<%@page import="Model.Produto"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ProdutoDAO"%>
<%@page import="DAO.pedido"%>



<!-- page content -->
<div class="right_col"role="main">
    <div class="">
        <div class="page-title">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <h3>Relatorio de pedidos</h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="row">
                       <div class="x_content">
                    <%
                        String id = request.getParameter("id_pedido");
                        Pedidos_itens itens = new Pedidos_itens();
                        itens.setId_pedido(Integer.parseInt(id));
                        Pedidos_ItensDAO itensdao = new Pedidos_ItensDAO();
                        List<Pedidos_itens> lstitens = itensdao.selecionarDetalhes(itens);
                        NumberFormat formato = NumberFormat.getCurrencyInstance();
                    %>

                    <table id="example" class="display" style="width:100%">
                        <thead>
                            <tr>                           
                                <th>Decricao</th>                              
                                <th>Valor unitario</th>                              
                                <th>quantidade</th>                              
                                <th>valor total</th>                              
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < lstitens.size(); i++) {
                            %> 
                             </tr>
                                <td><%=lstitens.get(i).getDescricao() %> </td>                               
                                <td><%=lstitens.get(i).getValor_unitario()%> </td>                               
                                <td><%=lstitens.get(i).getValor_total()%> </td>                               
                                <td><%=lstitens.get(i).getValor_total()%> </td>                               
                            </tr>
                            <% }
                            %>
                        </tbody>
                    </table>  
                        <button class="btn btn-primary" type="button" onclick="window.history.go(-1)">Voltar</button>
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