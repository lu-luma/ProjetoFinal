<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title> Projeto Final Cafeteria - INSERÇÃO</title>
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
            background-color: deeppink;
            margin-left: 15px;
            width: 100px;
            color: white;
        }

    </style>
</head>
<body style="background-image: url('img3.jpg');">
<br>
<h1 align="center"> Projeto Final Cafeteria - INSERÇÃO</h1>
<br>
<div id="centro">
    <br>
    <form action="Processamento.jsp" method="get">
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
        <button type="submit" class="btn " name="btnOperacao" value="Enviar">Enviar</button>
    </form>
</div>
</body>
</html>