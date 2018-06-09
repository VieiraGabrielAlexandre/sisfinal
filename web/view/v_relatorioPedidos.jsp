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
                        Pedidos ped = new Pedidos();
                        PedidosDAO pedao = new PedidosDAO();
                        List<Pedidos> lstped = pedao.selecionar();
                    %>

                    <table id="example" class="display" style="width:100%">
                        <thead>
                            <tr>
                                <th>ID PEDIDO</th>
                                <th>CLIENTE</th>                                
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < lstped.size(); i++) {
                                Cliente cli = new Cliente();
                                ClienteDAO clidao = new ClienteDAO();
                                cli.setId(lstped.get(i).getId_cliente());
                                cli = clidao.selecionar(cli);
                            %>
                            <tr>
                                <td><%  out.print(lstped.get(i).getId());%></td>
                                <td><%  out.print(cli.getNome());%></td>
                              
                                <td><a href="relatorioPedidosItens.jsp?id_pedido=<%  out.print(lstped.get(i).getId());%>" >
                                        <i class="fa fa-edit"></i> detalhes
                                    </a></td>
                            </tr>
                            <%                                }
                            %>
                        </tbody>
                    </table>
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
