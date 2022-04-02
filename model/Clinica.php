<?php
    class Clinica{
        //Atributos
        private $idclinica;
        private $idlogin;
        private $cnpj;
        private $clitelefone;
        private $vagas;
        private $clirua;
        private $clibairro;
        private $clinumero;
        private $clicep;

        //Método get
        function __get($atributo)
        {
            return $this->$atributo;
        }

        //Método set
        function __set($atributo, $valor)
        {
            $this->$atributo = $valor;
        }

        //Método construtor
        function __construct()
        {
            //Importando arquivo de conexão com banco de dados
            include_once "Conexao.php";
        }


        //Método cadastrar
        function cadastrar()
        {
            //Conectando ao banco de dados
            $con = Conexao::conectar();

            //Preparar comando SQL para cadastrar
            $cmd = $con->prepare("INSERT INTO clinica (idlogin, cnpj, clitelefone, vagas, clirua, clibairro, clinumero, clicep) VALUES (:idlogin, :cnpj, :clitelefone, :vagas, :clirua, :clibairro, :clinumero, :clicep)");
            
            //Parâmetros SQL
            $cmd->bindParam(":idlogin", $this->idlogin);
            $cmd->bindParam(":cnpj", $this->cnpj);
            $cmd->bindParam(":clitelefone", $this->clitelefone);
            $cmd->bindParam(":vagas", $this->vagas);
            $cmd->bindParam(":clirua", $this->clirua);
            $cmd->bindParam(":clibairro", $this->clibairro);
            $cmd->bindParam(":clinumero", $this->clinumero);
            $cmd->bindParam(":clicep", $this->clicep);

            //Executando o comando SQL
            $cmd->execute();
        }

        //Método consultar
        function consultar()
        {
            //Conectando ao banco de dados
            $con = Conexao::conectar();

            //Preparar comando SQL para consultar
            $cmd = $con->prepare("SELECT * FROM clinica");
            
            //Executando o comando SQL
            $cmd->execute();

            return $cmd->fetchAll(PDO::FETCH_OBJ);
        }

        //Método excluir
        function excluir()
        {
            //Conectando ao banco de dados
            $con = Conexao::conectar();

            //Preparar comando SQL para deletar
            $cmd = $con->prepare("DELETE FROM clinica WHERE idclinica = :idclinica");

            //Parâmetros SQL
            $cmd->bindParam(":idclinica", $this->idclinica);
            
            //Executando o comando SQL
            $cmd->execute();
        }
        
        //Método Atualizar
        function atualizar()
        {
            //Conectando ao banco de dados
            $con = Conexao::conectar();

            //Preparar o comando SQL para atualizar
            $cmd = $con->prepare("UPDATE clinica SET idlogin = :idlogin, cnpj = :cnpj, clitelefone = :clitelefone, vagas = :vagas, clirua = :clirua, clibairro = :clibairro, clinumero = :clinumero, clicep = :clicep WHERE idclinica = :idclinica");
            
            //Parâmetros SQL
            $cmd->bindParam(":idlogin", $this->idlogin);
            $cmd->bindParam(":cnpj", $this->cnpj);
            $cmd->bindParam(":clitelefone", $this->clitelefone);
            $cmd->bindParam(":vagas", $this->vagas);
            $cmd->bindParam(":clirua", $this->clirua);
            $cmd->bindParam(":clibairro", $this->clibairro);
            $cmd->bindParam(":clinumero", $this->clinumero);
            $cmd->bindParam(":clicep", $this->clicep);
            $cmd->bindParam(":idclinica", $this->idclinica);

            //Executando o comando SQL
            $cmd->execute();
        }

        //Método Retornar
        function retornar()
        {
            //Conectando ao banco de dados
            $con = Conexao::conectar();

            //Preparar comando SQL para retornar
            $cmd = $con->prepare("SELECT * FROM clinica WHERE idclinica = :idclinica");
            
            //Parâmetros SQL
            $cmd->bindParam(":idclinica", $this->idclinica);

            //Executando o comando SQL
            $cmd->execute();

            return $cmd->fetch(PDO::FETCH_OBJ);
        }
    }
?>