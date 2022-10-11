<?php
include_once "model/Animal.php";
include_once "model/Castracao.php";
include_once "model/Raca.php";
include_once "model/Usuario.php";
include_once "model/Login.php";

class AnimalController
{
    function carregarRaca($id)
    {
        //caso não usuário não esteja logado
        if (!isset($_SESSION["dadosLogin"])) {
            @header("Location:" . URL . "login");
            return;
        }

        $raca = new Raca();
        $raca->tipoespecie = $id;
        $dadosRacaAnimal = $raca->consultarRaca();

        $options = "";
        foreach ($dadosRacaAnimal as $value) {
            $options .= "<option value='$value->idraca'>$value->raca</option>";
        }
        echo $options;
    }

    function cadastrarAnimal()
    {

        //caso não usuário não esteja logado
        if (!isset($_SESSION["dadosLogin"])) {
            @header("Location:" . URL . "login");
            return;
        }

        //Controle de privilégio
        if ($_SESSION["dadosLogin"]->nivelacesso == 0) {
            $animal = new Animal();
            $animal->idusuario =   $_SESSION["dadosUsuario"]->idusuario;
            $animal->especie =     $_POST["tipoEspecie"];
            $animal->idraca =      $_POST["racas"];
            $animal->aninome =     $_POST["txtNome"];
            $animal->sexo =        $_POST["slcSexo"];
            $animal->porte =       $_POST["slcPorte"];
            $animal->cor =         $_POST["txtCor"];
            $animal->pelagem =     $_POST["slcPelagem"];
            $animal->idade =       $_POST["numIdade"];
            $animal->comunitario = $_POST["slcComunitario"];

            /* UPLOAD IMAGEM */
            if ($_FILES["imgAnimal"]["error"] == 0) {
                $nomeArquivo = $_FILES["imgAnimal"]["name"];    //Nome do arquivo
                $nomeTemp =    $_FILES["imgAnimal"]["tmp_name"];   //nome temporário

                //pegar a extensão do arquivo
                $info = new SplFileInfo($nomeArquivo);
                $extensao = $info->getExtension();

                if ($extensao != "jpg" && $extensao != "png" && $extensao != "jpeg") {
                    echo "<script>alert('A foto do animal deve ser enviada em formato jpg, png ou jpeg'); window.location='" . URL . "cadastra-animal'; </script>";
                    return;
                }
                //gerar novo nome
                $novoNome = md5(microtime()) . ".$extensao";

                $pastaDestino = "recursos/img/Animais/$novoNome";   //pasta destino
                move_uploaded_file($nomeTemp, $pastaDestino);       //mover o arquivo 

                //enviando para o banco de dados
                $animal->foto = $novoNome;
            }

            $animal->cadastrar();

            @header("Location:" . URL . "meus-animais");
        } else {
            include_once "view/paginaNaoEncontrada.php";
        }
    }

    function admCadastrarAnimal()
    {

        //caso não usuário não esteja logado
        if (!isset($_SESSION["dadosLogin"])) {
            @header("Location:" . URL . "login");
            return;
        }

        //Controle de privilégio
        if ($_SESSION["dadosLogin"]->nivelacesso == 2) {

            $dadosUsuario = new Usuario();
            $dadosUsuario->idusuario = $_POST["idUsuario"];

            if (!$dadosUsuario->consultar()) {
                echo "<script>alert('Usuário não encontrado'); window.location='" . URL . "consulta-usuario'; </script>";
                return;
            }

            $animal = new Animal();
            $animal->idusuario =   $_POST["idUsuario"];
            $animal->especie =     $_POST["tipoEspecie"];
            $animal->idraca =      $_POST["racas"];
            $animal->aninome =     $_POST["txtNome"];
            $animal->sexo =        $_POST["slcSexo"];
            $animal->porte =       $_POST["slcPorte"];
            $animal->cor =         $_POST["txtCor"];
            $animal->pelagem =     $_POST["slcPelagem"];
            $animal->idade =       $_POST["numIdade"];
            $animal->comunitario = $_POST["slcComunitario"];

            /* UPLOAD IMAGEM */
            if ($_FILES["imgAnimal"]["error"] == 0) {
                $nomeArquivo = $_FILES["imgAnimal"]["name"];    //Nome do arquivo
                $nomeTemp =    $_FILES["imgAnimal"]["tmp_name"];   //nome temporário

                //pegar a extensão do arquivo
                $info = new SplFileInfo($nomeArquivo);
                $extensao = $info->getExtension();

                if ($extensao != "jpg" && $extensao != "png" && $extensao != "jpeg") {
                    echo "<script>alert('A foto do animal deve ser enviada em formato jpg, png ou jpeg'); window.location='" . URL . "cadastra-animal'; </script>";
                    return;
                }
                //gerar novo nome
                $novoNome = md5(microtime()) . ".$extensao";

                $pastaDestino = "recursos/img/Animais/$novoNome";   //pasta destino
                move_uploaded_file($nomeTemp, $pastaDestino);       //mover o arquivo 

                //enviando para o banco de dados
                $animal->foto = $novoNome;
            }

            $animal->cadastrar();

            @header("Location:" . URL . "consulta-animais/" . $_POST["idUsuario"]);
        } else {
            include_once "view/paginaNaoEncontrada.php";
        }
    }

    function atualizarAnimal()
    {
        //caso não usuário não esteja logado
        if (!isset($_SESSION["dadosLogin"])) {
            @header("Location:" . URL . "login");
            return;
        }

        //Controle de privilégio
        if ($_SESSION["dadosLogin"]->nivelacesso == 0 || $_SESSION["dadosLogin"]->nivelacesso == 2) {

            $animal = new Animal();
            $animal->idanimal =    $_POST["idanimal"];
            $animal->aninome =     $_POST["txtNome"];
            $animal->especie =     $_POST["tipoEspecie"];
            $animal->idade =       $_POST["numIdade"];
            $animal->sexo =        $_POST["slcSexo"];
            $animal->pelagem =     $_POST["slcPelagem"];
            $animal->cor =         $_POST["txtCor"];
            $animal->porte =       $_POST["slcPorte"];
            $animal->idraca =      $_POST["racas"];
            $animal->comunitario = $_POST["slcComunitario"];

            /* UPLOAD IMAGEM */
            $infoanimal = new Animal();
            $infoanimal->idanimal = $_POST["idanimal"];
            $dadosAnimal = $infoanimal->retornar();

            $dadosUsuarioDonoAtual = new Usuario();
            $dadosUsuarioDonoAtual->idusuario = $dadosAnimal->idusuario;
            $dadosUsuarioDonoAtual->consultar();

            if ($_FILES["foto"]["error"] == 0) {

                if (empty($dadosAnimal->foto)) {
                    $nomeArquivo = $_FILES["foto"]["name"];       //Nome do arquivo
                    $nomeTemp =    $_FILES["foto"]["tmp_name"];      //nome temporário

                    //pegar a extensão do arquivo
                    $info = new SplFileInfo($nomeArquivo);
                    $extensao = $info->getExtension();

                    //gerar novo nome
                    $novoNome = md5(microtime()) . ".$extensao";

                    $pastaDestino = "recursos/img/Animais/$novoNome";    //pasta destino
                    move_uploaded_file($nomeTemp, $pastaDestino);       //mover o arquivo 

                    //enviando para o banco
                    $animal->foto = $novoNome;
                } else {
                    unlink("recursos/img/Animais/$dadosAnimal->foto"); //excluir o arquivo

                    $nomeArquivo = $_FILES["foto"]["name"];       //Nome do arquivo
                    $nomeTemp =    $_FILES["foto"]["tmp_name"];      //nome temporário

                    //pegar a extensão do arquivo
                    $info = new SplFileInfo($nomeArquivo);
                    $extensao = $info->getExtension();

                    if ($extensao != "jpg" && $extensao != "png" && $extensao != "jpeg") {
                        echo "<script>alert('A foto do animal deve ser enviada em formato jpg, png ou jpeg'); window.location='" . URL . "cadastra-tutor'; </script>";
                        return;
                    }
                    //gerar novo nome
                    $novoNome = md5(microtime()) . ".$extensao";

                    $pastaDestino = "recursos/img/Animais/$novoNome";    //pasta destino
                    move_uploaded_file($nomeTemp, $pastaDestino);       //mover o arquivo 

                    //enviando para o banco
                    $animal->foto = $novoNome;
                }
            } else {
                $animal->foto = $dadosAnimal->foto;
            }

            $verificaanimal = new Animal();
            $verificaanimal->idusuario = $_SESSION["dadosUsuario"]->idusuario;
            $animais = $verificaanimal->consultarAnimaisPorDono();

            // permite editar se o animal realmente pertence aquele dono
            // ou se o usuário for administrador
            if (in_array($_POST["idanimal"], $animais) || $_SESSION["dadosLogin"]->nivelacesso == 2) {

                if ($_SESSION["dadosLogin"]->nivelacesso == 2 && isset($_POST["txtCPF"]) && !empty(trim($_POST["txtCPF"]))) {

                    $filtros = array(".", "-", "(", ")", " ");
                    $cpfDoNovoTutor = str_replace($filtros, '', $_POST["txtCPF"]);

                    $novoTutor = new Usuario();
                    $novoTutor->cpf = $cpfDoNovoTutor;
                    $dadosNovoTutor = $novoTutor->consultarPorCpf();

                    if ($dadosNovoTutor != null) {

                        $animal->idusuario = $dadosNovoTutor->idusuario;
                        $animal->atualizarEAlterarTutor();
                        echo "<script>alert('Tutor alterado!'); window.location='" . URL . "consulta-animais/" . $dadosUsuarioDonoAtual->idusuario  . "'; </script>";
                        return;
                    } else {

                        echo "<script>alert('CPF não encontrado!'); window.location='" . URL . "consulta-animais/" . $dadosUsuarioDonoAtual->idusuario  . "'; </script>";
                        return;
                    }
                } else {

                    $animal->atualizar();
                }
            } else {
                echo "<script>alert('Você não tem permissão para editar esse animal'); window.location='" . URL . "meus-animais'; </script>";
                exit();
            }

            /* $castracao = new Castracao();
            $castracao->idanimal = $_POST["idanimal"];
            $castracaoFull = $castracao->retornarCastracaoReprovadaPorAnimal();

            if ($castracaoFull){

                $usuario = new Login();
                $usuario->idlogin = $_SESSION['dadosLogin']->idlogin;
                $usuarioFull = $usuario->retornarUsuario();
            
               

                if($usuarioFull->beneficio == 0){
                    if (isset($castracaoFull)) {
                        $castracaoFull->excluir();
                        
                        if($usuarioFull->quantcastracoes < 2){
                          $usuarioFull->quantcastracoes = (intval($usuarioFull->quantcastracoes) + 1);

                        }

                        $usuarioFull->atualizarQuantCastracoes();
                    }

                }else if($usuarioFull->beneficio == 1){ //Verifico o tipo de benificio para sabermos até quanto pode-se incrementar

                    if (isset($castracaoFull)) {
                        
                        $castracaoPExcluir = new Castracao();
                        $castracaoPExcluir->idcastracao = $castracaoFull->idcastracao;
                        return;
                        $castracaoPExcluir->excluir();
                    
                        if($usuarioFull->quantcastracoes < 2){//Verificando se as castrações são menores que duas
                            $usuarioFull->quantcastracoes = (intval($usuarioFull->quantcastracoes) + 1);
                        }
                
                        $upUsuario->atualizarQuantCastracoes();
                    }

                }else if($usuarioFull->beneficio == 2){
                    
                    if (isset($castracaoFull)) {

                        $castracaoFull->excluir();
                        
                        if($usuarioFull->quantcastracoes < 5){
                            $upUsuario->quantcastracoes = (intval($upUsuario->quantcastracoes) + 1);
                        }
                        
                    
                        $upUsuario->atualizarQuantCastracoes();
                    }
                }
            } */


            //Excluir a castração caso exista com esse animal
            $castracao = new Castracao();
            $castracao->idanimal = $_POST["idanimal"];
            $idcastracao = $castracao->retornarid();

            if (isset($idcastracao->idcastracao)) {
                $castracao->idcastracao = $idcastracao->idcastracao;
                $castracao->excluir();

                $_SESSION["dadosUsuario"]->quantcastracoes++;

                $usuario = new Usuario();
                $usuario->idusuario = $_SESSION["dadosUsuario"]->idusuario;
                $usuario->quantcastracoes = $_SESSION["dadosUsuario"]->quantcastracoes;

                $usuario->atualizarQuantCastracoes();
            }

            if ($_SESSION["dadosLogin"]->nivelacesso == 0) {
                @header("Location:" . URL . "meus-animais");
            } else {
                @header("Location:" . URL . "consulta-animais/" . $dadosUsuarioDonoAtual->idusuario);
            }
        } else {
            include_once "view/paginaNaoEncontrada.php";
        }
    }

    function excluirAnimal($idanimal, $idusuario, $foto)
    {
        //caso não usuário não esteja logado
        if (!isset($_SESSION["dadosLogin"])) {
            @header("Location:" . URL . "login");
            return;
        }

        //Controle de privilégio
        if ($_SESSION["dadosLogin"]->nivelacesso == 0 || $_SESSION["dadosLogin"]->nivelacesso == 2) {

            try {
                $animal = new Animal();
                $animal->idanimal = $idanimal;

                //removendo imagem
                $dadosAnimal = $animal->retornar();
                if (is_file("recursos/img/Animais/$dadosAnimal->foto")) //verificar se o arquivo existe
                {
                    unlink("recursos/img/Animais/$dadosAnimal->foto"); //excluir o arquivo
                }

                if ($_SESSION["dadosLogin"]->nivelacesso == 0) {

                    //verificando se o animal realmente pertence aquele dono
                    $verificaanimal = new Animal();
                    $verificaanimal->idusuario = $_SESSION["dadosUsuario"]->idusuario;
                    $animais = $verificaanimal->consultarAnimaisPorDono();

                    if (in_array($idanimal, $animais)) {
                        $animal->excluir();
                    } else {
                        echo "<script>alert('Você não tem permissão para excluir esse animal'); window.location='" . URL . "meus-animais'; </script>";
                        exit();
                    }
                } else {
                    $animal->excluir();
                }
            } catch (Exception $e) {
                if ($_SESSION["dadosLogin"]->nivelacesso == 2) {
                    echo "<script>alert('Erro ao excluir o animal! Verifique se esse animal não possui um cadastro nas castrações'); window.location='" . URL . "consulta-animais/$idusuario'; </script>";
                } else {
                    echo "<script>alert('Erro ao excluir o animal'); window.location='" . URL . "meus-animais'; </script>";
                }
                return;
            }
            if (is_file("recursos/img/Animais/$foto")) {
                unlink("recursos/img/Animais/$foto");
            }
            if ($_SESSION["dadosLogin"]->nivelacesso == 0) {
                @header("Location:" . URL . "meus-animais");
            } else {
                @header("Location:" . URL . "consulta-animais/$idusuario");
            }
        } else {
            include_once "view/paginaNaoEncontrada.php";
        }
    }

    function cadastrarRaca()
    {
        //caso não usuário não esteja logado
        if (!isset($_SESSION["dadosLogin"])) {
            @header("Location:" . URL . "login");
            return;
        }

        //Controle de privilégio
        if ($_SESSION["dadosLogin"]->nivelacesso == 2) {
            try {
                $raca = new Raca();
                $raca->raca = $_POST["txtRaca"];
                $raca->tipoespecie = $_POST["tipoEspecie"];
                $raca->cadastrar();

                echo "<script>alert('Raça cadastrada com sucesso'); window.location='" . URL . "cadastra-raca'; </script>";
            } catch (Exception $e) {
                echo "<script>alert('Erro: $e'); window.location='" . URL . "cadastra-raca'; </script>";
            }
        } else {
            include_once "view/paginaNaoEncontrada.php";
        }
    }

    //Atualizar Raça
    function atualizarRaca()
    {
        //caso não usuário não esteja logado
        if (!isset($_SESSION["dadosLogin"])) {
            @header("Location:" . URL . "login");
            return;
        }

        //Controle de privilégio
        if ($_SESSION["dadosLogin"]->nivelacesso == 2) {
            try {
                $raca = new Raca();
                $raca->idraca = $_POST["idRaca"];
                $raca->raca = $_POST["txtRaca"];
                $raca->tipoespecie = $_POST["tipoEspecie"];
                $raca->atualizar();

                echo "<script>alert('Raça atualizada com sucesso'); window.location='" . URL . "consulta-raca'; </script>";
            } catch (Exception $e) {
                echo "<script>alert('Erro: $e'); window.location='" . URL . "consulta-raca'; </script>";
            }
        } else {
            include_once "view/paginaNaoEncontrada.php";
        }
    }

    //Excluir Raça
    function excluirRaca($idraca)
    {
        //caso não usuário não esteja logado
        if (!isset($_SESSION["dadosLogin"])) {
            @header("Location:" . URL . "login");
            return;
        }

        //Controle de privilégio
        if ($_SESSION["dadosLogin"]->nivelacesso == 2) {
            try {
                $raca = new Raca();
                $raca->idraca = $idraca;

                $raca->excluir();
            } catch (Exception $e) {
                echo "<script>alert('Erro: $e'); window.location='" . URL . "consulta-raca'; </script>";
            }
            @header("Location:" . URL . "consulta-raca");
        } else {
            include_once "view/paginaNaoEncontrada.php";
        }
    }
}
