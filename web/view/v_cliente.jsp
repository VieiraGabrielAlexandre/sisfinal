<%@page import="Model.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ClienteDAO"%>
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Cadastro de cliente</h3>
            </div>

            <div class="title_right">
                <div class="pull-right">
                    <div class="input-group">
                        <a href="clienteCadastrar.jsp?action=insert"> <button type="button" class="btn btn-round btn-success">Cadastrar cliente</button></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Clientes cadastrados</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">Settings 1</a>
                                </li>
                                <li><a href="#">Settings 2</a>
                                </li>
                            </ul>
                        </li>
                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <%
                        ClienteDAO cli = new ClienteDAO();
                        List<Cliente> lstcli = cli.selecionar();
                    %>

                     <table id="example" class="display" style="width:100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nome</th>
                                <th>Sobrenome</th>
                                <th>Aniversario</th>
                                <th>Cep</th>
                                <th>Logradouro</th>
                                <th>Ativo</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < lstcli.size(); i++) {
                            %>
                            <tr>
                                <td><%  out.print(lstcli.get(i).getId());%></td>
                                <td><%  out.print(lstcli.get(i).getNome());%></td>
                                <td><%  out.print(lstcli.get(i).getSobreNome());%></td>
                                <td><%  out.print(lstcli.get(i).getAniversario());%></td>
                                <td><%  out.print(lstcli.get(i).getCep());%></td>
                                <td><%  out.print(lstcli.get(i).getLogradouro());%></td>
                                <td><%  out.print(lstcli.get(i).getAtivo());%></td>
                                <td><a href="clienteCadastrar.jsp?action=update&id=<%= lstcli.get(i).getId()%>">
                                        <i class="fa fa-edit"></i> Editar
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
    <!-- /page content -->
    
<script type="text/javascript">
    $(document).ready(function () {
        $('#example').dataTable({
            "language": {
                "url": "https://cdn.datatables.net/plug-ins/1.10.16/i18n/Portuguese-Brasil.json"
            }
        });
    });
</script>