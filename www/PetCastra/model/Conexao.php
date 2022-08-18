<?php

require_once "config/config.php";

class Conexao{

    static function conectar(){
        //Informações para acessar o servidor do banco de dados
        $localhost = "mysql:host=" . ENV_CONFIG['DB']['HOST'] . ";port=" . ENV_CONFIG['DB']['PORT'] . ";dbname=" . ENV_CONFIG['DB']['NAME'];
        
        $usuario = ENV_CONFIG['DB']['USER'];
        $senha = ENV_CONFIG['DB']['PASS'];
        
        $con = new PDO($localhost,$usuario,$senha);
        
        //Ativando recurso de exibição de erro
        $con->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
        
        return $con;//Retorna conexão para uso
    }
}
?>