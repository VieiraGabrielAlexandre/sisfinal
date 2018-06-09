 <%@page import="Model.Fornecedor"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="DAO.FornecedorDAO"%>
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Cadastro de fornecedores</h3>
            </div>

            <div class="title_right">
                <div class="pull-right">
                    <div class="input-group">                         
                        <a href="fornecedorCadastrar.jsp?action=insert"><button type="button" class="btn btn-round btn-success">Cadastrar fornecedor</button></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>fornecedores cadastrados</h2>
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
                        FornecedorDAO forn = new FornecedorDAO();
                        List<Fornecedor> lsforn = forn.selecionar();
                    %>

                    <table id="example" class="display" style="width:100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Razão social</th>
                                <th>Ativo</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (int i = 0; i < lsforn.size(); i++) {
                            %>
                            <tr>
                                <td><%  out.print(lsforn.get(i).getId());%></td>
                                <td><%  out.print(lsforn.get(i).getRazaoSocial());%></td>
                                <td><%  out.print(lsforn.get(i).getAtivo());%></td>
                                <td><a href="fornecedorCadastrar.jsp?action=update&id=<%= lsforn.get(i).getId()%>">
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

<script type="text/javascript">
    $(document).ready(function () {
        $('#example').dataTable({
            "language": {
                "url": "https://cdn.datatables.net/plug-ins/1.10.16/i18n/Portuguese-Brasil.json"
            }
        });
    });
</script>