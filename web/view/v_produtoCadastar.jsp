<%@page import="DAO.ProdutoDAO"%>
<%@page import="Model.Produto"%>
<script>
    function validar() {
   
            document.form.submit();
      
    }

<%
    String action = "";
    String idProd = "";     
    String descricao = "";     
    Float preco =0f;     
    Boolean ativo = true;
    Produto prod = new Produto();
    ProdutoDAO prodDAO = new ProdutoDAO();
    try {
        action = request.getParameter("action");
        idProd = request.getParameter("id");
        if (!idProd.equals("")) {
            prod.setId(Integer.parseInt(idProd));
            prod = prodDAO.selecionar(prod);
            idProd = prod.getId().toString();             
            descricao = prod.getDescricao();             
            preco =  prod.getPrecoVenda();             
            ativo = prod.getAtivo();
        }

    } catch (Exception e) {
    }

    //request.setAttribute("action", action);
    //request.setAttribute("idUsuario", idUsuario);
    //out.print(action);
    //out.print(idUsuario);
%>

</script>
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Cadastrar novo produto</h2>
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
                        <br>
                        <form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left" novalidate=""onsubmit="return validar()" method="POST" action="controller/produtoController.jsp">

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="descricao">Descrição <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="descricao" name="descricao" required="required" class="form-control col-md-7 col-xs-12" value="<%= descricao %>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="preco">Preço de venda<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="preco" name="preco" required="required" class="form-control col-md-7 col-xs-12"value="<%= preco %>">
                                </div>
                            </div>
                             <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="ativo">Ativo <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <% if (ativo == true) {%>
                                    <input type="checkbox" id="ativo" name="ativo" value="true" checked required="required" class="checkbox col-md-7 col-xs-12" >
                                    <% } else {%>
                                    <input type="checkbox" id="ativo" name="ativo"  value="true" required="required" class="checkbox col-md-7 col-xs-12">
                                    <% }%>
                                </div>
                            </div>
                            <% if (action.equals("insert")) { %>
                            <input type="hidden" name="action" value="insert"/>
                            <%} else {%>
                            <input type="hidden" name="action" value="update"/>
                            <%}%>
                            <input type="hidden" name="id" value="<%= idProd %>"/>
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                    <button class="btn btn-primary" type="button"onclick="window.history.go(-1)">Cancelar</button>
                                    <button class="btn btn-primary" type="reset">Limpar</button>
                                    <button type="submit" class="btn btn-success">Enviar</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>

            </div>
        </div>


    </div>
</div>
<!-- /page content -->