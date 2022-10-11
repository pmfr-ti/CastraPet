<?php

include_once "model/Usuario.php";
include_once "model/Clinica.php";
include_once "model/Castracao.php";
include_once "model/Email.php";

class ClinicaController
{

    function cadastrarClinica()
    {
        try {

            //caso não usuário não esteja logado
            if (!isset($_SESSION["dadosLogin"])) {
                @header("Location:" . URL . "login");
                return;
            }

            //Controle de privilégio
            if ($_SESSION["dadosLogin"]->nivelacesso == 2) {

                $filtros = array(".", "-", "(", ")", "/", " ");
                $cnpj = str_replace($filtros, '', $_POST["txtCNPJ"]);
                $cep = str_replace($filtros, '', $_POST["txtCEP"]);
                $tel = str_replace($filtros, '', $_POST["txtTelefone"]);

                $login = new Login();
                $login->nome =  $_POST["txtNome"];
                $login->email = $_POST["txtEmail"];
                $login->senha = password_hash($_POST["txtSenha"], PASSWORD_DEFAULT);
                $login->nivelacesso = 1;

                $idLogin = $login->cadastrar();

                if ($idLogin === null) {
                    echo "<script>alert('Já existe um perfil com esse e-mail'); window.location='" . URL . "cadastra-clinica'; </script>";
                    return;
                }

                $clinica = new Clinica();
                $clinica->idlogin = $idLogin;
                $clinica->cnpj = $cnpj;
                $clinica->clitelefone = $tel;
                $clinica->vagas =       $_POST["txtVagas"];
                $clinica->clirua =      $_POST["txtRua"];
                $clinica->clibairro =   $_POST["txtBairro"];
                $clinica->clinumero =   $_POST["txtNumero"];
                $clinica->clicep = $cep;
                $clinica->ativo = 1;

                $clinica->cadastrar();

                echo "<script>alert('Clínica cadastrada com sucesso!'); window.location='" . URL . "cadastra-clinica';</script>";
            } else {
                include_once "view/paginaNaoEncontrada.php";
            }
        } catch (\Throwable $th) {
            error_log($th->getMessage(), 0);
            echo "<script>alert('Não foi possível realizar essa ação. Contate o administrador do sistema'); window.location='" . URL . "cadastra-clinica'; </script>";
        }
    }

    function atualizarClinica()
    {
        //caso não usuário não esteja logado
        if (!isset($_SESSION["dadosLogin"])) {
            @header("Location:" . URL . "login");
            return;
        }

        //Controle de privilégio
        if ($_SESSION["dadosLogin"]->nivelacesso == 2) {

            $login = new Login();
            $login->idlogin = $_POST["idLogin"];
            $login->nome = $_POST["txtNome"];
            $login->email = $_POST["txtEmail"];
            $login->senha = password_hash($_POST["txtSenha"], PASSWORD_DEFAULT);
            $login->nivelacesso = 1;
            $login->atualizar();

            $clinica = new Clinica();
            $clinica->idclinica =   $_POST["idClinica"];
            $clinica->cnpj =        $_POST["txtCNPJ"];
            $clinica->clitelefone = $_POST["txtTelefone"];
            $clinica->vagas =       $_POST["txtVagas"];
            $clinica->clirua =      $_POST["txtRua"];
            $clinica->clibairro =   $_POST["txtBairro"];
            $clinica->clinumero =   $_POST["txtNumero"];
            $clinica->clicep =      $_POST["txtCEP"];
            if ($_POST["chkAtivo"] == 1) {
                $clinica->ativo = 1;
            } else
                $clinica->ativo = 0;
            $clinica->atualizar();

            @header("Location:" . URL . "consulta-clinica/");
        } else {
            include_once "view/paginaNaoEncontrada.php";
        }
    }

    function excluirClinica($idClinica, $idLogin)
    {
        //caso não usuário não esteja logado
        if (!isset($_SESSION["dadosLogin"])) {
            @header("Location:" . URL . "login");
            return;
        }

        //Controle de privilégio
        if ($_SESSION["dadosLogin"]->nivelacesso == 2) {

            $clinica = new Clinica();
            $clinica->idclinica = $idClinica;
            $clinica->excluir();

            $login = new Login();
            $login->idlogin = $idLogin;
            $login->excluir();

            @header("Location:" . URL . "consulta-clinica/");
        } else {
            include_once "view/paginaNaoEncontrada.php";
        }
    }

    function agendarDataCastracao()
    {
        //caso não usuário não esteja logado
        if (!isset($_SESSION["dadosLogin"])) {
            @header("Location:" . URL . "login");
            return;
        }

        //Controle de privilégio
        if ($_SESSION["dadosLogin"]->nivelacesso == 1) {
            
            $idcastracao = $_POST["idcastracao"];
            
            //Caso o botão recusado não seja apertado pela clinica
            if (!isset($_POST["btnRecusa"])) {

                if ($_POST["horario"] == ''){
                    echo "<script>alert('Data e hora invalidos'); window.location='" . URL . "agendamento/$castracao->idcastracao'; </script>";
                    return;
                }

                $castracao = new Castracao();
                $castracao->idcastracao = $idcastracao;
                $castracao->idclinica = $_SESSION["dadosClinica"]->idclinica;
                $castracao->status = 1;
                $castracao->horario = $_POST["horario"];
              

                try {

                    $castracao->aprovarCastracao();

                } catch (\Throwable $th) {
                    $dataTexto = date("d/m/Y H:i", strtotime($_POST["horario"]));
                    echo "<script>alert('Não foi possível realizar o agendamento pois há uma castração agendada no horário: $dataTexto.'); window.location='" . URL . "lista-solicitacao';</script>";
                    return;
                }
                
                

                if (isset($_POST["emailDestinatario"])) {
                    if (trim($_POST["emailDestinatario"]) !== '') {
                        //enviar o email
                        $email = new Email();
                        $email->data = $_POST["horario"];
                        $email->nomeClinica = $_SESSION["dadosClinica"]->nome;
                        $email->ruaClinica = $_SESSION["dadosClinica"]->clirua;
                        $email->bairroClinica = $_SESSION["dadosClinica"]->clibairro;
                        $email->numeroClinica = $_SESSION["dadosClinica"]->clinumero;
                        $email->emailDestinatario = $_POST["emailDestinatario"];
                        $email->nomeDestinatario = $_POST["nomeDestinatario"];
                        $email->nomeAnimal = $_POST["aninome"];
                        $email->clitelefone = $_SESSION["dadosClinica"]->clitelefone;

                        $email->enviarConfirmacao();

                        echo "<script>alert('Agendamento realizado! Email de confirmação enviado.'); window.location='" . URL . "lista-solicitacao';</script>";


                    } else {
                        echo "<script>alert('Agendamento realizado! Não foi possível enviar o email. O email do tutor não foi informado.'); window.location='" . URL . "lista-solicitacao';</script>";
                        return;
                    }
                } else {
                    echo "<script>alert('Agendamento realizado! Não foi possível enviar o email. O email do tutor não foi informado.'); window.location='" . URL . "lista-solicitacao';</script>";
                    return;
                }
            
            }else if ($_POST["btnRecusa"] == "Recusar") {
               
                //Devolvendo castração para a clinica
                $clinica = new Clinica();
                $clinica->idlogin = $_SESSION["dadosClinica"]->idlogin;
                $clinica = $clinica->consultar();
                $clinica[0]->vagas++;
                $clinicaFArray =  new Clinica();
                $clinicaFArray->idclinica =  $clinica[0]->idclinica;
                $clinicaFArray->cnpj =  $clinica[0]->cnpj;
                $clinicaFArray->clitelefone = $clinica[0]->clitelefone;
                $clinicaFArray->vagas = $clinica[0]->vagas;
                $clinicaFArray->clirua = $clinica[0]->clirua;
                $clinicaFArray->clibairro = $clinica[0]->clibairro;
                $clinicaFArray->clinumero = $clinica[0]->clinumero;
                $clinicaFArray->clicep =  $clinica[0]->clicep;
                $clinicaFArray->ativo = $clinica[0]->ativo;
                $clinicaFArray->atualizar();
                
                //Setando cadastração como recuasada
                $castracao = new Castracao();
                $castracao->idcastracao = $idcastracao;
                $castracao->msgrecusa = $_POST["msgRecusa"];
                $castracao->status = 3;

                $castracao->recusarCastracao();

                //Não preciso mais devolver a castração para o usuario(Ele recupera ao editar o animal ou endereço)
                //Devolvendo castração para o usuário
                //Primeiro pego o animal da castração, pois nele contem as informações do usuário
                /*$usuario = new Usuario();
                $castracaoFull = $castracao->retornar();
                $usuario->idusuario = $castracaoFull->idusuario;
                $usuarioFull = $usuario->retornar();
                $usuario->quantcastracoes = $usuarioFull->quantcastracoes+= 1;
               
                
                $usuario->atualizarQuantCastracoes(); */

                @header("Location:" . URL . "lista-solicitacao"); 
            }

            
        } else {
            include_once "view/paginaNaoEncontrada.php";
        }
    }
}
