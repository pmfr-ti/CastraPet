<?php

// * EXAMPLE
// * COPY THIS SNIPPET TO config\config.php
// * AND CHANGE THE VALUES ACCORDINGLY

const ENV_CONFIG = [
    'URL' => "http://localhost:8001/PetCastra/",
    'DB' => [
        'HOST' => 'db',
        'PORT' => 3366,
        'NAME' => 'pmfr_castracao',
        'USER' => 'root',
        'PASS' => 'myrootpassword'    
    ],
    'MAIL' => [
        'HOST' => 'smtp.office365.com',
        'USER' => 'email@email',
        'PASS' => 'p4ssw0rd',
        'PORT' => 587,
        'NAME' => 'email name'
    ]
];

?>