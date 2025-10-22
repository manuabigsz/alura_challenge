INSERT INTO Registration (user_id, course_id, registration_date)
SELECT u.id, c.id, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)
FROM User u
CROSS JOIN Course c
WHERE c.code = 'html'
AND u.email IN (
    'maria.silva@email.com', 'joao.santos@email.com', 'ana.costa@email.com',
    'pedro.oliveira@email.com', 'carla.souza@email.com', 'lucas.almeida@email.com',
    'juliana.lima@email.com', 'rafael.ferreira@email.com', 'fernanda.rodrigues@email.com',
    'bruno.pereira@email.com', 'camila.martins@email.com', 'thiago.ribeiro@email.com',
    'patricia.dias@email.com', 'rodrigo.carvalho@email.com', 'mariana.gomes@email.com',
    'felipe.barbosa@email.com', 'amanda.castro@email.com', 'gabriel.moreira@email.com',
    'beatriz.cardoso@email.com', 'vinicius.araujo@email.com', 'larissa.pinto@email.com',
    'gustavo.teixeira@email.com', 'natalia.cunha@email.com', 'eduardo.barros@email.com',
    'aline.monteiro@email.com', 'marcelo.freitas@email.com', 'renata.campos@email.com',
    'andre.rocha@email.com', 'bianca.nunes@email.com', 'diego.duarte@email.com',
    'isabela.melo@email.com', 'henrique.correia@email.com', 'leticia.azevedo@email.com',
    'matheus.farias@email.com', 'carolina.ramos@email.com'
);

INSERT INTO Registration (user_id, course_id, registration_date)
SELECT u.id, c.id, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)
FROM User u
CROSS JOIN Course c
WHERE c.code = 'css'
AND u.email IN (
    'maria.silva@email.com', 'joao.santos@email.com', 'ana.costa@email.com',
    'pedro.oliveira@email.com', 'carla.souza@email.com', 'lucas.almeida@email.com',
    'juliana.lima@email.com', 'rafael.ferreira@email.com', 'fernanda.rodrigues@email.com',
    'bruno.pereira@email.com', 'camila.martins@email.com', 'thiago.ribeiro@email.com',
    'patricia.dias@email.com', 'rodrigo.carvalho@email.com', 'mariana.gomes@email.com',
    'felipe.barbosa@email.com', 'amanda.castro@email.com', 'gabriel.moreira@email.com',
    'beatriz.cardoso@email.com', 'vinicius.araujo@email.com', 'larissa.pinto@email.com',
    'gustavo.teixeira@email.com', 'natalia.cunha@email.com', 'eduardo.barros@email.com',
    'aline.monteiro@email.com', 'marcelo.freitas@email.com', 'renata.campos@email.com',
    'andre.rocha@email.com'
);

INSERT INTO Registration (user_id, course_id, registration_date)
SELECT u.id, c.id, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)
FROM User u
CROSS JOIN Course c
WHERE c.code = 'automacao'
AND u.email IN (
    'leonardo.castro@email.com', 'priscila.lopes@email.com', 'ricardo.mendes@email.com',
    'vanessa.torres@email.com', 'alexandre.silva@email.com', 'tatiana.sousa@email.com',
    'fabio.santos@email.com', 'daniela.costa@email.com', 'mauricio.lima@email.com',
    'sabrina.alves@email.com', 'leandro.pereira@email.com', 'adriana.ribeiro@email.com',
    'cesar.martins@email.com', 'luciana.dias@email.com', 'roberto.carvalho@email.com',
    'maria.silva@email.com', 'joao.santos@email.com', 'ana.costa@email.com',
    'pedro.oliveira@email.com', 'carla.souza@email.com', 'lucas.almeida@email.com',
    'juliana.lima@email.com'
);

INSERT INTO Registration (user_id, course_id, registration_date)
SELECT u.id, c.id, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)
FROM User u
CROSS JOIN Course c
WHERE c.code = 'produtividade'
AND u.email IN (
    'rafael.ferreira@email.com', 'fernanda.rodrigues@email.com', 'bruno.pereira@email.com',
    'camila.martins@email.com', 'thiago.ribeiro@email.com', 'patricia.dias@email.com',
    'rodrigo.carvalho@email.com', 'mariana.gomes@email.com', 'felipe.barbosa@email.com',
    'amanda.castro@email.com', 'gabriel.moreira@email.com', 'beatriz.cardoso@email.com',
    'vinicius.araujo@email.com', 'larissa.pinto@email.com', 'gustavo.teixeira@email.com',
    'natalia.cunha@email.com', 'eduardo.barros@email.com', 'aline.monteiro@email.com'
);

INSERT INTO Registration (user_id, course_id, registration_date)
SELECT u.id, c.id, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY)
FROM User u
CROSS JOIN Course c
WHERE c.code = 'svelte'
AND u.email IN (
    'bianca.nunes@email.com', 'diego.duarte@email.com', 'isabela.melo@email.com',
    'henrique.correia@email.com', 'leticia.azevedo@email.com', 'matheus.farias@email.com',
    'carolina.ramos@email.com', 'leonardo.castro@email.com', 'priscila.lopes@email.com',
    'ricardo.mendes@email.com', 'vanessa.torres@email.com', 'alexandre.silva@email.com'
);