<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CastraPet</title>
    <!-- EXTENSÃO BOOTSTRAP -->
    <link rel="stylesheet" href="<?php echo URL; ?>recursos/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo URL; ?>recursos/css/root.css">
</head>
<body>
    <!-- CORPO -->
    <?php include_once "menuADM.php";?>

    <div class="container-fluid">
        <div class="bg-danger">
            <div class="container mx-auto row p-3">
                <div class="container bg-white p-0">
                <form action="busca-usuario">    
                    <div class="container bg-dark text-light font-weight-bold p-3">
                        <label>Consultar Usuário:</label>
                        <input type="number" name="buscaUsuario" id="buscaUsuario">
                    </div>
                </form>
                    <form action="consulta-usuario">
                        <div class="row align-items-center justify-content-center">
                            <div class="col-sm-5 mb-3 form-group ps-4">
                                <div class="row">
                                    <p>Nome:<?php echo" xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";?></p>
                                </div>
                                <div class="row">
                                    <p>E-mail:<?php echo" xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";?></p>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <p>CPF:<?php echo" xxxxxxxxxxx";?></p>
                                    </div>
                                    <div class="col-6">
                                        <p>Telefone:<?php echo" xxxxxxxxxxx";?></p>
                                    </div>    
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <p>RG:<?php echo" xxxxxxxxxxx";?></p>
                                    </div>
                                    <div class="col-6">
                                        <p>Celular:<?php echo" xxxxxxxxxxx";?></p>
                                    </div>    
                                </div>
                                <div class="row">
                                    <p>
                                        <input type="checkbox" name="chkProtetor" id="chkProtetor" checked disabled>
                                        Tenho benefício NIS: <?php echo" xxxxxxxx"?>
                                    </p>
                                </div>
                                
                                <div class="row ">
                                    <p>
                                        <input type="checkbox" name="chkProtetor" id="chkProtetor" checked disabled>
                                        Sou protetor de animais
                                        &nbsp;
                                        <input class="btn btn-success col-auto" type="button" value="Visualizar documento" name="btnProtetorDoc"> 
                                    </p>
                                </div>
                            </div>
                            <div class="col-sm-7 mb-3 form-group ps-4">
                                <div class="row">
                                    <div class="col-6">
                                        <p>CEP:<?php echo" xxxxxxxxx";?></p>
                                    </div>
                                    <div class="col-6">
                                        <p>Número:<?php echo" xxxxx";?></p>
                                    </div>    
                                </div>
                                <div class="row">
                                    <p>Bairro:<?php echo" xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";?></p>
                                </div>
                                <div class="row mb-5">
                                    <p>Rua:<?php echo" xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";?></p>
                                </div>
                                
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-6">
                                            <!-- Acessar animais cadastrados do usuário -->
                                            <a href="<?php echo URL.'consulta-animais';?>" class="btn btn-success col-auto">Animais Cadastrados</a>
                                    </div>
                                    <div class="col-6 justify-content-end">
                                        <!-- Botão editar usuário -->
                                        <button class="btn btn-success" onclick="mostrarModal();">
                                            Editar
                                        </button>
                                        <!-- Botão excluir usuário -->
                                        <?php echo"
                                            <a href='".URL."excluir-usuario' class='btn btn-danger ' 
                                            onclick='return confirm(\"Deseja realmente excluir esse usuário?\")'>Excluir</a>"
                                        ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>                    
                </div>
            </div>
        </div>
        <footer class="container-fluid text-left bg-dark" style="padding: 2.5rem; color:white; background:var(--preto);">
            <a href="<?php echo URL.'home-adm'; ?>" class="btn btn-success my-2 my-sm-0">Voltar</a>
        </footer>
    </div>

    <!-- MODAL: editar usuário -->
    <div class="modal fade" id="modalEditar" tabindex="-1" data-bs-backdrop="static">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                Conseguiu!!!
            </div>
        </div>
    </div>
    <!--/MODAL -->

    <!-- /CORPO -->

    <!-- EXTENSÃO BOOTSTRAP -->
    <script src="<?php echo URL; ?>recursos/js/jquery-3.3.1.slim.min.js"></script>
    <script src="<?php echo URL; ?>recursos/js/popper.min.js"></script>
    <script src="<?php echo URL; ?>recursos/js/bootstrap.min.js"></script>

    <!-- Abrir modal -->
    <script>
        function mostrarModal(){
            /*let el = document.getElementById('modalEditar');
            let minhaModal = new bootstrap.Modal(el);
            minhaModal.show();*/

            let minhaModal = new bootstrap.Modal(document.getElementById('modalEditar')).show();
        }

    </script>    
    
</body>
</html>