<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Model.Cliente"%>
<%@page import="DAO.ClienteDAO"%>
<%@page import="java.util.Date;"%>

<%  try {
        String action = request.getParameter("action");
        String nome = request.getParameter("nome");
        String id = request.getParameter("id");
        String sobrenome = request.getParameter("sobrenome");
        String cep = request.getParameter("cep");
        String logradouro = request.getParameter("logradouro");
        String aniversario = request.getParameter("aniversario");
        String ativo = "false";
        ativo = request.getParameter("ativo");
        //out.print(ativo);
        ClienteDAO clidao = new ClienteDAO();
        Cliente cli = new Cliente();

        cli.setNome(nome);
        cli.setSobreNome(sobrenome);
        cli.setCep(cep);
        cli.setLogradouro(logradouro);
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-mm-dd");
        cli.setAniversario( formato.parse(aniversario));
          
        if (ativo != null) {
            cli.setAtivo(true);
        } else {
            cli.setAtivo(false);
        }
        if (action.equals("insert")) {
            cli = clidao.salvar(cli);
        } else {
            cli.setId(Integer.parseInt(id));
            cli = clidao.update(cli);
        }
        response.sendRedirect("../cliente.jsp");

    } catch (Exception e) {
        out.print(e.getMessage());
    }


%>

