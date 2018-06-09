<%@page import="DAO.UsuarioDAO"%>
<%@page import="Model.Usuario"%>
<script>
    function validarSenha() {
        senha1 = document.form.senha.value;
        senha2 = document.form.confSenha.value;

        if (senha1 == senha2)
            document.form.submit();
        else {
            swal("Atenção", "Senhas são diferentes!\nFavor digitar as senhas iguais", "warning");
            return false;
        }
    }
    <%
        String action = "";
        String idUsuario = "";
        String nome = "";
        String login = "";
        String senha = "";
        String senha2 = "";
        Boolean ativo = true;
        Usuario usu = new Usuario();
        UsuarioDAO usuDAO = new UsuarioDAO();
        try {
            action = request.getParameter("action");
            idUsuario = request.getParameter("id");
            if (!idUsuario.equals("")) {
                usu.setId(Integer.parseInt(idUsuario));
                usu = usuDAO.selecionar(usu);
                idUsuario = usu.getId().toString();
                nome = usu.getNome();
                login = usu.getLogin();
                senha = usu.getSenha();
                senha2 = usu.getSenha();
                ativo = usu.getAtivo();
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
                        <%                            if (action.equals("update")) {
                                out.print("<h2>Atualização de usuario</h2>");
                            } else {
                                out.print("<h2>Cadastrar novo usuario</h2>");
                            }
                        %>

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

                        <form id="demo-form2" name="form" onsubmit="return validarSenha()" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="" method="POST" action="controller/usuarioController.jsp">

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Nome <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="nome" name="nome" required="required" class="form-control col-md-7 col-xs-12" value="<%= nome%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="login">Login<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="Login" name="login" required="required" class="form-control col-md-7 col-xs-12" value="<%= login%>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="senha">Senha<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="password" id="senha" name="senha" required="required" class="form-control col-md-7 col-xs-12" value="<%= senha%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="confSenha">confirme a senha <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="password" id="confSenha" name="confSenha" required="required" class="form-control col-md-7 col-xs-12" value="<%= senha%>">
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
                            <input type="hidden" name="id" value="<%= idUsuario%>"/>
                            <div class="lnsolid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                    <button class="btn btn-primary" type="button" onclick="window.history.go(-1)">Cancelar</button>
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