<?php

const TIPOS_STATUS_CASTRACAO = [
    'solicitacao_em_analise' => [
        'id' => 0,
        'descricao' => 'Solicitação em análise de documentos',
    ],
    'solicitacao_aprovada' => [
        'id' => 1,
        'descricao' => 'Solicitação aprovada',
    ],
    'solicitacao_reprovada' => [
        'id' => 3,
        'descricao' => 'Solicitação reprovada',
    ],
    'solicitacao_enviada_para_clinica' => [
        'id' => 8,
        'descricao' => 'Solicitação aprovada e enviada a clinica.',
    ],
    'castrado' => [
        'id' => 2,
        'descricao' => 'Animal castrado',
    ],
    'cadastrado_editar' => [
        'id' => 9,
        'descricao' => 'Animal castrado (Suas informações devem ser editadas)',
    ],
    'obito_castrado' => [
        'id' => 7,
        'descricao' => 'Animal castrado foi a óbito.',
    ],
    'obito_nao_castrado' => [
        'id' => 10,
        'descricao' => 'Animal foi a óbito antes da castração.',
    ],
    'nao_compareceu' => [
        'id' => 4,
        'descricao' => 'Tutor não compareceu',
    ],
    'cancelado' => [
        'id' => 5,
        'descricao' => 'Castração cancelada',
    ],
    'reagendado' => [
        'id' => 6,
        'descricao' => 'Reagendar castração',
    ],
];

// * fluxo 0 - 8 - 1
// * 0 - Solicitação em análise de documentos
// * 8 - Solicitação aprovada e enviada a clinica.
// * 1 - Solicitação aprovada
?>