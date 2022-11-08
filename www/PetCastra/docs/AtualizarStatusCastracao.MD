UsuarioController.php
function atualizarCastracao()
DESCRIÇÃO DOS STATUS

[x] se status de castracao era de qualquer tipo de solicitacao, ele já descontou o valor da clínica. Esses status de solicitacao nao são usados nessa função, mas são considerados dentro dos IFs com && !=

[x] se novo status é animal castrado,
[x] se novo status é animal castrado com alteracoes
    se status antigo é animal castrado: mantem
    se status antigo é animal castrado com alteracoes: mantem
    se status antigo é reagendar castracao: mantem
    se status antigo é animal castrado veio a obito: mantem
    se status antigo é tutor nao compareceu: desconta 1 p/clinica
    se status antigo é castracao cancelada: desconta 1 p/clinica
    se status antigo é animal veio a obito antes da castracao: desconta 1 p/clinica

[x] se novo status é tutor nao compareceu
    se status antigo é tutor nao compareceu: mantem
    se status antigo é animal veio a obito antes da castracao: mantem
    se status antigo é castracao cancelada: mantem
    se status antigo é animal castrado com alteracoes: acrescenta 1
    se status antigo é animal castrado: acrescenta 1 p/clinica
    se status antigo é reagendar castracao: acrescenta 1 p/clinica
    se status antigo é animal castrado veio a obito: acrescenta 1 p/clinica

[x] se novo status é castracao cancelada
    se status antigo é tutor nao compareceu: mantem
    se status antigo é castracao cancelada: mantem
    se status antigo é animal veio a obito antes da castracao: mantem
    se status antigo é animal castrado: acrescenta 1 p/clinica
    se status antigo é animal castrado com alteracoes: acrescenta 1 p/clinica
    se status antigo é reagendar castracao: acrescenta 1 p/clinica
    se status antigo é animal castrado veio a obito: acrescenta 1 p/clinica

[x] se novo status é reagendar castracao
    se status antigo é animal castrado: mantem
    se status antigo é animal castrado com alteracoes: mantem
    se status antigo é reagendar castracao: mantem
    se status antigo é animal castrado veio a obito: mantem
    se status antigo é tutor nao compareceu: desconta 1 p/clinica
    se status antigo é castracao cancelada: desconta 1 p/clinica
    se status antigo é animal veio a obito antes da castracao: desconta 1 p/clinica

[x] se novo status é animal castrado veio a obito
    se status antigo é animal castrado: mantem
    se status antigo é animal castrado com alteracoes: mantem
    se status antigo é reagendar castracao:  mantem
    se status antigo é animal castrado veio a obito: mantem
    se status antigo é tutor nao compareceu: desconta 1 p/clinica
    se status antigo é castracao cancelada:  desconta 1 p/clinica
    se status antigo é animal veio a obito antes da castracao: desconta 1 p/clinica

[X] se novo status é animal veio a obito antes da castracao
    se status antigo é tutor nao compareceu: mantem
    se status antigo é castracao cancelada:  mantem
    se status antigo é animal veio a obito antes da castracao: mantem
    se status antigo é reagendar castracao:  acrescenta 1 p/clinica
    se status antigo é animal castrado veio a obito: acrescenta 1 p/clinica
    se status antigo é animal castrado: acrescenta 1 p/clinica
    se status antigo é animal castrado com alteracoes: acrescenta 1 p/clinica