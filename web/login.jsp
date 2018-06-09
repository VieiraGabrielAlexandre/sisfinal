<!DOCTYPE html>
<html lang="PT-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Dashboad de vendas</title>
        <%@include file="head.jsp" %>
    </head>
    <%
        session.setAttribute("usuario", "");
    %>
    <body class="login">
        <div>
            <a class="hiddenanchor" id="signup"></a>
            <a class="hiddenanchor" id="signin"></a>

            <div class="login_wrapper">
                <div class="animate form login_form">
                    <section class="login_content">
                        <form action="./Logar" method="POST">
                            <h1>gestão/Vendas</h1>
                            <div>
                                <input type="text" class="form-control" placeholder="Usuário" required="" name="user" />
                            </div>
                            <div>
                                <input type="password" class="form-control" placeholder="Senha" required="" name="senha"/>
                            </div>
                            <div>
                                <input type="submit" value="Logar"/>
                                <a class="reset_pass" href="#">Esqueceu a senha?</a>
                            </div>

                            <div class="clearfix"></div>

                            <div class="separator">
                                <p class="change_link">Cadastrar-se?
                                    <a href="#signup" class="to_register"> Criar usuário </a>
                                </p>

                                <div class="clearfix"></div>
                                <br />
                        </form>
                    </section>
                </div>

                <div id="register" class="animate form registration_form">
                    <section class="login_content">
                        <form>
                            <h1>Cadastrar-se</h1>
                            <div>
                                <input type="text" class="form-control" placeholder="Usúario" required="" />
                            </div>
                            <div>
                                <input type="email" class="form-control" placeholder="Email" required="" />
                            </div>
                            <div>
                                <input type="password" class="form-control" placeholder="Senha" required="" />
                            </div>
                            <div>
                                <a class="btn btn-default submit" href="index.html">Submit</a>
                            </div>

                            <div class="clearfix"></div>

                            <div class="separator">
                                <p class="change_link">Already a member ?
                                    <a href="#signin" class="to_register"> Log in </a>
                                </p>

                                <div class="clearfix"></div>
                                <br />


                            </div>
                        </form>
                    </section>
                </div>
            </div>
        </div>
    </body>
</html>
