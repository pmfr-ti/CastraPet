START TRANSACTION;
    UPDATE castracao
    SET status = 8
    where status = 1 AND horario IS null;
COMMIT;