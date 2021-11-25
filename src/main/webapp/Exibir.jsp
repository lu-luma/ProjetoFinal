<%--
  Created by IntelliJ IDEA.
  User: lumal
  Date: 23/11/2021
  Time: 13:51
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="icon" href="strawberry-juice.png">
    <title>Projeto Final Cafeteria - EXIBIR</title>
    <style>
        img {
            max-width:3600px;
            max-height:215px;
            width: auto;
            height: auto;
        }
        .card{
            margin-left: 10px;
            border-radius: 15px;
            border: 5px solid deeppink;
        }


    </style>
</head>
<body style="background-color: lightpink">
<br>
<h1 align="center">Projeto Final Cafeteria - EXIBIR</h1>
<br>
<%
    //conectar ao bd
    Connection conexaoBD = null;
    PreparedStatement cmdSQL = null;
    ResultSet rst = null;
    String banco,usuario,senha;
    String nome,tamanho,foto,id,preco;
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
    try {
        cmdSQL = conexaoBD.prepareStatement("SELECT * from produto");
        rst = cmdSQL.executeQuery();
        if (rst.next()) {
            out.println("<div class=\"container\">");
            out.println("   <div class=\"row\">");
            do {
               nome = rst.getString("nome");
               id = String.valueOf(rst.getInt("id"));
               tamanho = rst.getString("tamanho");
               preco = String.valueOf(rst.getDouble("preco"));
               foto = rst.getString("foto");
               if(foto.isEmpty()){
                   foto="https://cdn-icons-png.flaticon.com/512/16/16410.png";
               }
                out.println("       <div class=\"card col-sm\" style=\"width: 18rem;\">");
                out.println("               <img class=\"card-img-top\" src=\""+foto+"\">");
                out.println("               <div class=\"card-body\">");
                out.println("                   <p>Id: "+id+"</p>");
                out.println("                   <p>Nome: "+nome+"</p>");
                out.println("                   <p>Tamanho: "+tamanho+"</p>");
                out.println("                   <p>Preço: "+preco+"</p>");
                out.println("                   <a href=\"Alterar.jsp\" class=\"btn btn-primary\" name='btnOperacao' value='Alterar'>Alterar</a>");
                out.println("                   <a href=\"Excluir.jsp\" class=\"btn btn-danger\" name='btnOperacao' value='Excluir'>Excluir</a>");
                out.println("               </div>");
                out.println("       </div>");
            } while (rst.next());
            out.println("   </div>");
            out.println("</div>");
            out.println("<a href=\"index.jsp\">Clique aqui para voltar</a>");
        } else {
            out.println("<h3>SEM DADOS CADASTRADOS</h3>");
        }
    }catch (Exception e){
        out.println("<h3>Erro:"+ e.getMessage()+"</h3>");
    }
    conexaoBD.close();

%>
</body>
</html>
