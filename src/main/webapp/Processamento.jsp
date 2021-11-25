<%--
  Created by IntelliJ IDEA.
  User: lumal
  Date: 23/11/2021
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<html>
<head>
    <title>Processando...</title>
</head>
<body>
<%
//pegando valores dos forms
String operacao = request.getParameter("btnOperacao");
//conectar ao bd
    Connection conexaoBD = null;
    PreparedStatement cmdSQL = null;
    ResultSet rst = null;
    String banco,usuario,senha;
    try{
        banco = "jdbc:mysql://localhost/ProjetoFinal";
        usuario = "root";
        senha = "sarahmiguel2";
        Class.forName("com.mysql.jdbc.Driver");
        conexaoBD = DriverManager.getConnection(banco,usuario,senha);

    }catch (Exception e){
        out.println("<h3>Erro:"+ e.getMessage()+"</h3>");
        return;
    }
    //realizar as operações
    //inserir
    if (operacao.equals("Enviar")){
        String nome = request.getParameter("txtNome");
        Double preco = Double.valueOf(request.getParameter("txtPreco"));
        String tamanho = request.getParameter("txtTamanho");
        String foto = request.getParameter("imgFoto");
        try {
            cmdSQL = conexaoBD.prepareStatement("INSERT INTO produto(nome,preco,tamanho,foto)"+
                    "VALUES ('"+nome+"','"+preco+"','"+tamanho+"','"+foto+"')");
            cmdSQL.executeUpdate();
            response.sendRedirect("Exibir.jsp");
        }catch (Exception e){
            out.println("<h3>Erro:"+ e.getMessage()+"</h3>");
        }
    }
    //alterar
    if (operacao.equals("Alterar")){
        String nome = request.getParameter("txtNome");
        Double preco = Double.valueOf(request.getParameter("txtPreco"));
        String tamanho = request.getParameter("txtTamanho");
        String foto = request.getParameter("imgFoto");
        int id = Integer.parseInt(request.getParameter("txtId"));
        try {
            cmdSQL = conexaoBD.prepareStatement("UPDATE produto SET nome='" + nome + "', preco = '" + preco + "', tamanho='" + tamanho + "', foto='" + foto + "' WHERE  id = '" + id + "'");
            cmdSQL.executeUpdate();
            response.sendRedirect("Exibir.jsp");
        }catch (Exception e){
            out.println("<h3>Erro:"+ e.getMessage()+"</h3>");
        }
    }
    //excluir
    if (operacao.equals("Excluir")){
        int id = Integer.parseInt(request.getParameter("txtId"));
        try {
            cmdSQL = conexaoBD.prepareStatement("DELETE FROM produto WHERE  id = '" + id + "'");
            cmdSQL.executeUpdate();
            response.sendRedirect("Exibir.jsp");
        }catch (Exception e){
            out.println("<h3>Erro:"+ e.getMessage()+"</h3>");
        }
    }
%>
</body>
</html>
