<!DOCTYPE html>
<html lang="pt-br">

<head>
    <?php include_once "head.php"; ?>
</head>

<body>

    <!-- CORPO -->
    <div class="d-grid min-vh-100 corpo">

        <?php /*Controle de menu!*/ include_once "menuControle.php"; ?>

        <div class="bg-primary container-fluid" style="grid-area: corpo;">
            <div class="row h-100 align-items-center">
                <div class="py-3 px-2">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="mt-3 p-sm-3 p-md-3 p-lg-4 p-3 bg-white">
                                    <h3 class="mb-4">Seja bem-vindo(a)!</h3>
                                    <p>
                                        <strong>O projeto PetCastra</strong> é o site em que você pode se cadastrar para agendar uma castração gratuita para seu gato ou cachorro
                                        através do programa gratuito da Prefeitura de Franco da Rocha.
                                    </p>
                                    <h5 class="mt-4">Você sabe a importância da castração?</h5>
                                    <p>
                                        Como a reprodução de cães e gatos é muito rápida, o descuido com os
                                        animais em casa e os animais deixados soltos nas ruas é a principal
                                        causa da grande reprodução e do aumento do número de animais
                                        abandonados. Além do risco de contrair doenças e transmiti-las, ser
                                        atropelado, provocar acidentes de carros, receber maus-tratos, como
                                        pedradas, pauladas, chutes, etc., cães e gatos na rua cruzam e podem
                                        ter 12 ou mais filhotes ao ano. Abandonados por seus guardiões, eles
                                        acabam por sofrer, sentir fome, sede, frio, medo, ficar doentes e
                                        transmitir doenças para as pessoas e outros animais.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="col-md-6">
                                <div class="p-sm-3 p-md-3 p-lg-4 p-3 bg-white">
                                    <h4 class="mb-4">Orientações Sobre a Castração</h4>
                                    <p>
                                    <ul>
                                        <li>
                                            A clínica veterinária credenciada ficará responsável pelo <strong>contato e
                                                agendamento</strong> da castração - Será realizada <strong>três (03) tentativas de contato</strong>,
                                            caso não atenda, automaticamente perderá a vaga cadastrada.
                                        </li>
                                        <li>
                                            Comparecer no horário agendado pela clínica.
                                        </li>
                                        <li>
                                            Deixar o <strong>animal em JEJUM</strong> ( sólido e líquido) <strong>08 horas</strong> antes da castração
                                            (Ex: a castração será às 08hs da manhã, portanto , a última refeição deverá
                                            ser até as 24hs da noite).
                                        </li>
                                        <li>
                                            É <strong>recomendado o uso de colar de proteção</strong> (elisabetano) ou a <strong>roupa cirúrgica</strong>
                                            (você encontrará na clínica veterinária ou em petshops) procure em lugares
                                            mais baratos ou até mesmo empréstimo.
                                        </li>
                                        <li>
                                            A clínica veterinária ja médica os animais, caso considerem necessário, a
                                            clínica poderá prescrever medicamentos com nome genérico (menor custo)
                                            que podem ser comprados em farmácia humana.
                                        </li>
                                        <li>
                                            Ter 18 anos ou mais e residir no município.
                                        </li>
                                        <li>
                                            Levar cobertor ou um lençol limpo.
                                        </li>
                                        <li>
                                            O proprietário que não fizer a retirada do animal no horário estipulado pela
                                            clínica estará sujeito a aplicação de Auto de Infração, conforme o Art 29 da
                                            Resolução SIMA n° 05/2021 e demais legislações federais, estaduais e
                                            municipais.
                                        </li>
                                        <li>
                                            Em caso de motivo que impeça o animal à cirurgia de castração ( fugiu,
                                            doença, castrou no particular, óbito e etc) entrar em contato imediatamente
                                            com a clínica veterinária para comunicar o cancelamento da cirurgia.
                                        </li>
                                        <li>
                                            Impedem o procedimento cirúrgico: Cio, Prenhez, amamentação de filhotes
                                            com menos de 45 dias, animais muito idosos, ( acima de 08 anos) ou filhotes
                                            com menos de 03 meses .Impedem o procedimento cirúrgico: Cio, Prenhez, amamentação de filhotes
                                            com menos de 45 dias, animais muito idosos, ( acima de 08 anos) ou filhotes
                                            com menos de 03 meses .
                                        </li>
                                        <li>
                                            Todos os animais passarão por uma avaliação clínica pelos médicos
                                            veterinários da clínica credenciada e caso detectado alguma alteração e ou
                                            condição (<strong>obesidade, idade e raça</strong>) o procedimento poderá ser cancelado ou
                                            remarcado.
                                        </li>
                                    </ul>

                                    <strong class="text-danger">ATENÇÃO:</strong>
                                    <ul class="mt-2">
                                        <li>A identificação de incongruência(s) nas informações prestadas poderá resultar no cancelamento do cadastro(s) do(s) animal(is).</li>
                                        <li>O deferimento do cadastramento do(s) animal(is) dependerá dos fatores prioritários e não da ordem de inscrição.</li>
                                        <li>O contato será realizado pelo telefone cadastrado na inscrição. O contato será feito próximo do dia do agendamento. Pedimos que aguardem o contato das Clínicas Veterinárias.</li>
                                        <li>Toda a atividade do serviço da Castração por parte do Bem Estar Animal é totalmente gratuita.</li>
                                    </ul>
                                    </p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="p-sm-3 p-md-3 p-lg-4 p-3 mt-4 mt-md-0 bg-white">
                                    <div class="card">
                                        <h4 class="card-header">Perguntas Frequentes:</h4>
                                        <ol class="list-group list-group-flush">
                                            <a class="list-group-item" data-bs-toggle="collapse" href="#pergunta0" role="button" aria-expanded="false" aria-controls="collapseExample">
                                                <li class="ms-2">É necessário pagar algo para castrar meu animal?</li>
                                            </a>
                                            <div class="collapse" id="pergunta0">
                                                <div class="card card-body border-primary">
                                                    <p>
                                                        <span class="fw-bold">R:</span> Não, o programa de castração é gratuito, o tutor tem apenas que lidar com os custos de transporte e cuidados pós-cirúrgicos.
                                                    </p>
                                                </div>
                                            </div>

                                            <a class="list-group-item" data-bs-toggle="collapse" href="#pergunta1" role="button" aria-expanded="false" aria-controls="collapseExample">
                                                <li class="ms-2">Com quantos anos posso solicitar a castração de meu animal?</li>
                                            </a>
                                            <div class="collapse" id="pergunta1">
                                                <div class="card card-body border-primary">
                                                    <p>
                                                        <span class="fw-bold">R:</span> Somente maiores de idade poderão realizar o cadastro do animal.
                                                    </p>
                                                </div>
                                            </div>

                                            <a class="list-group-item" data-bs-toggle="collapse" href="#pergunta2" role="button" aria-expanded="false" aria-controls="collapseExample">
                                                <li class="ms-2">Posso castrar mais de um animal?</li>
                                            </a>
                                            <div class="collapse" id="pergunta2">
                                                <div class="card card-body border-primary">
                                                    <p>
                                                        <span class="fw-bold">R:</span> As vagas são limitadas e distribuídas para os moradores de Franco da Rocha baseado nos seguintes critérios:
                                                        <br><br>
                                                        Caso seja <span class="fw-bold">)Protetor de Animais Independente e cadastrado no Bem Estar Animal</span>: Têm direito a <span class="fw-bold">5</span> vagas para castração por mês;
                                                        <br>
                                                        Caso tenha <span class="fw-bold">Benefício Social</span>: Têm direito a <span class="fw-bold">2</span> vagas para castração por mês;
                                                        <br>
                                                        Para o restante da <span class="fw-bold">população</span>: Têm direito a apenas <span class="fw-bold">1</span> vaga para castração por mês;
                                                    </p>
                                                </div>
                                            </div>

                                            <a class="list-group-item" data-bs-toggle="collapse" href="#pergunta3" role="button" aria-expanded="false" aria-controls="collapseExample">
                                                <li class="ms-2">O programa castra outros animais além de gatos e cachorros?</li>
                                            </a>
                                            <div class="collapse" id="pergunta3">
                                                <div class="card card-body border-primary">
                                                    <p>
                                                        <span class="fw-bold">R:</span> Não, o programa castra apenas <span class="fw-bold">gatos</span> e <span class="fw-bold">cachorros</span>.
                                                    </p>
                                                </div>
                                            </div>

                                            <a class="list-group-item" data-bs-toggle="collapse" href="#pergunta4" role="button" aria-expanded="false" aria-controls="collapseExample">
                                                <li class="ms-2">Como faço para solicitar uma castração para meu animal?</li>
                                            </a>
                                            <div class="collapse" id="pergunta4">
                                                <div class="card card-body border-primary">
                                                    <p>
                                                        <span class="fw-bold">R:</span> Clique no botão “Login” no menu do site, faça login caso já possua um cadastro, caso contrário clique em “Não possuo uma conta” e preencha as informações para se cadastrar. Após ter feito o login, vá em “Meus Animais” e cadastre seu animal, depois clique em “Solicitar Castração” e então sua solicitação estará em análise. Após ser aprovada, informações da clínica e horário serão enviadas ao e-mail cadastrado junto com as orientações que devem ser seguidas antes de ocorrer a cirurgia.
                                                    </p>
                                                </div>
                                            </div>

                                            <a class="list-group-item" data-bs-toggle="collapse" href="#pergunta5" role="button" aria-expanded="false" aria-controls="collapseExample">
                                                <li class="ms-2">Por onde eu vou receber as informações da castração?</li>
                                            </a>
                                            <div class="collapse" id="pergunta5">
                                                <div class="card card-body border-primary">
                                                    <p>
                                                        <span class="fw-bold">R:</span> As informações de qual clínica será a responsável por realizar a castração e o endereço junto com o horário serão enviados para o <strong>e-mail</strong> ou <strong>whatsapp</strong> que foi usado na hora de cadastrar sua conta.
                                                    </p>
                                                </div>
                                            </div>

                                            <a class="list-group-item" data-bs-toggle="collapse" href="#pergunta6" role="button" aria-expanded="false" aria-controls="collapseExample">
                                                <li class="ms-2">Como funciona o processo de castração?</li>
                                            </a>
                                            <div class="collapse" id="pergunta6">
                                                <div class="card card-body border-primary">
                                                    <p>
                                                        <span class="fw-bold">R:</span>
                                                        Castração é uma cirurgia feita de forma minimamente invasiva, que serve para evitar permanentemente a reprodução do seu animal. A castração também reduz a ocorrência de alguns tipos de doenças nos cães e gatos.
                                                        Depois da cirurgia ser feita, é orientado ao tutor os cuidados e remédios que devem ser dados ao animal para uma recuperação rápida.
                                                    </p>
                                                </div>
                                            </div>

                                            <a class="list-group-item" data-bs-toggle="collapse" href="#pergunta7" role="button" aria-expanded="false" aria-controls="collapseExample">
                                                <li class="ms-2">Onde será castrado meu animal?</li>
                                            </a>
                                            <div class="collapse" id="pergunta7">
                                                <div class="card card-body border-primary">
                                                    <p>
                                                        <span class="fw-bold">R:</span> Seu animal será castrado em uma das clínicas que têm parceria com a prefeitura de Franco da Rocha.
                                                    </p>
                                                </div>
                                            </div>

                                            <a class="list-group-item" data-bs-toggle="collapse" href="#pergunta8" role="button" aria-expanded="false" aria-controls="collapseExample">
                                                <li class="ms-2">Tem riscos de acontecer algo com meu animal durante a cirurgia?</li>
                                            </a>
                                            <div class="collapse" id="pergunta8">
                                                <div class="card card-body border-primary">
                                                    <p>
                                                        <span class="fw-bold">R:</span> Sim, como toda cirurgia, há riscos de acontecer algo durante o processo cirúrgico. Contudo a cirurgia de castração é simples e rotineira, sendo a raro o animal ter sequelas graves após a cirurgia.
                                                    </p>
                                                </div>
                                            </div>

                                            <a class="list-group-item" data-bs-toggle="collapse" href="#pergunta9" role="button" aria-expanded="false" aria-controls="collapseExample">
                                                <li class="ms-3">Tem algo que impeça o meu animal de ser castrado?</li>
                                            </a>
                                            <div class="collapse" id="pergunta9">
                                                <div class="card card-body border-primary">
                                                    <p>
                                                        <span class="fw-bold">R:</span> Sim. Impedem o procedimento cirúrgico:
                                                        <br>
                                                    <ul>
                                                        <li>Cio;</li>
                                                        <li>Prenhez;</li>
                                                        <li>Amamentação de filhotes com menos de 45 dias;</li>
                                                        <li>Animais muito idosos (acima de 08 anos) ou filhotes com menos de 03 meses;</li>
                                                        <li>Tenha alergia a anestesia;</li>
                                                        <li>Não tenha seguido as orientações pré-operatórias;</li>
                                                    </ul>
                                                    Todos os animais passarão por uma avaliação
                                                    clínica pelos médicos veterinários da clínica credenciada e caso detectado
                                                    alguma alteração e ou condição (<strong style="display: contents;">obesidade, idade e raça</strong>) o procedimento
                                                    poderá ser cancelado ou remarcado.
                                                    </p>
                                                </div>
                                            </div>

                                            <a class="list-group-item" data-bs-toggle="collapse" href="#pergunta10" role="button" aria-expanded="false" aria-controls="collapseExample">
                                                <li class="ms-3">Existe alguma penalidade caso eu não compareça na clínica no dia da castração?</li>
                                            </a>
                                            <div class="collapse" id="pergunta10">
                                                <div class="card card-body border-primary">
                                                    <p>
                                                        <span class="fw-bold">R:</span> Sim, caso o tutor não entre em contanto com a clínica da castração justificando sua falta, será aplicada uma punição impedindo-o de solicitar a castração de seus animais durante a campanha de castração.
                                                    </p>
                                                </div>
                                            </div>

                                            <a class="list-group-item" data-bs-toggle="collapse" href="#pergunta11" role="button" aria-expanded="false" aria-controls="collapseExample">
                                                <li class="ms-3">O programa de castração de Franco da Rocha está disponível para moradores de outros municípios?</li>
                                            </a>
                                            <div class="collapse" id="pergunta11">
                                                <div class="card card-body border-primary">
                                                    <p>
                                                        <span class="fw-bold">R:</span> Não, o programa de castração é reservado apenas para moradores de Franco da Rocha.
                                                    </p>
                                                </div>
                                            </div>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid bg-dark" style="grid-area: footer;">
            <div class="row h-100 align-items-center">
                <div class="px-5">
                </div>
            </div>
        </div>
    </div>
    <!-- /CORPO -->

    <!-- EXTENSÃO BOOTSTRAP -->
    <script src="<?php echo URL; ?>recursos/js/jquery-3.3.1.slim.min.js"></script>
    <!--<script src="<?php echo URL; ?>recursos/js/popper.min.js"></script> Ultrapassado-->
    <script src="<?php echo URL; ?>recursos/js/bootstrap.min.js"></script>
    <script src="<?php echo URL; ?>recursos/js/bootstrap.bundle.min.js"></script>
</body>

</html>