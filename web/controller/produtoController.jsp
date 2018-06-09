<%@page import="Model.Produto"%>
<%@page import="DAO.ProdutoDAO"%>
<%  try {
        String action = request.getParameter("action");
        String descricao = request.getParameter("descricao");
        float preco = Float.parseFloat(request.getParameter("preco"));
        String id = request.getParameter("id");        
        String ativo = "false";
        ativo = request.getParameter("ativo");
        //out.print(ativo);
        ProdutoDAO produtoDAO = new ProdutoDAO();
        Produto produto = new Produto();

        produto.setDescricao(descricao);
        produto.setPrecoVenda(preco);
   
        
        if (ativo != null) {
            produto.setAtivo(true);
        } else {
            produto.setAtivo(false);
        }
        if (action.equals("insert")) {
            produto = produtoDAO.salvar(produto);
        } else {
            produto.setId(Integer.parseInt(id));
            produto = produtoDAO.update(produto);
        }
        response.sendRedirect("../produto.jsp");

    } catch (Exception e) {
        out.print(e.getMessage());
    }


%>

