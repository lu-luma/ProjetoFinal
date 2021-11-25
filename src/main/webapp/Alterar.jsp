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
    <title> Projeto Final Cafeteria - ALTERAR</title>
    <link rel="icon" href="strawberry-juice.png">
    <style>
        #centro{
            margin:auto;
            width:800px;
            height: 450px;
            background-color: rgba(255, 182, 193,0.5);
            border: 8px solid deeppink;
            border-radius: 17px;
        }
        .form-control{
            width: 600px;
            height: 40px;
            margin-left: 20px;
        }
        label{
            margin-left: 20px;
        }
        .btn{
            margin-left: 15px;
            width: 100px;
            color: white;
        }
        .form-select{
            width: 600px;
            height: 40px;
            margin-left: 20px;
        }

    </style>
</head>
<body style="background-image: url('img3.jpg');">
<br>
<h1 align="center"> Projeto Final Cafeteria - ALTERAR</h1>
<br>
<div id="centro">
    <br>
    <form action="Processamento.jsp" method="get">
        <select class="form-select" aria-label="Default select example" name="txtId">
            <option selected>Selecione o id do produto que deseja alterar</option>
            <%
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
                try{
                    cmdSQL = conexaoBD.prepareStatement("SELECT id from produto");
                    rst = cmdSQL.executeQuery();
                    if (rst.next()) {
                        do{
                            String id = String.valueOf(rst.getInt("id"));
                            out.println("       <option value='"+id+"'>"+id+"</option>");
                        }while(rst.next());
                    }
                    else{}
                }catch (Exception e){}
            %>
        </select>
        <br>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="floatingInput" name="txtNome" required>
            <label for="floatingInput">Nome do Produto</label>
        </div>
        <div class="form-floating mb-3">
            <input type="number" class="form-control" id="floatingNumber" name="txtPreco" required>
            <label for="floatingNumber">Preço</label>
        </div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="floatingTamanho" name="txtTamanho" required>
            <label for="floatingTamanho">Tamanho</label>
        </div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="floatingFoto" name="imgFoto">
            <label for="floatingfoto">Foto</label>
        </div>
        <button type="submit" class="btn btn-primary" name="btnOperacao" value="Alterar">Alterar</button>
    </form>
</div>
</body>
</html>
