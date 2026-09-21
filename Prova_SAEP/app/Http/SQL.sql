CREATE DATABASE saep_db;

USE saep_db;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

CREATE TABLE empresas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

CREATE TABLE salas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    num_sala VARCHAR(100) NOT NULL,
    bloco VARCHAR(50) NOT NULL,
    empresa_id INT NOT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,

    FOREIGN KEY (empresa_id) REFERENCES empresas(id)
);

CREATE TABLE agendamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    descricao VARCHAR(255),
    sala_id INT NOT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,

    FOREIGN KEY (sala_id) REFERENCES salas(id)
);

use saep_db;

INSERT INTO usuarios 
(nome, email, senha, created_at, updated_at)
VALUES
('Administrador', 'admin@saep.com', SHA2('123456', 256), NOW(), NOW()),
('Carlos Oliveira', 'carlos@saep.com', SHA2('123456', 256), NOW(), NOW()),
('Mariana Santos', 'mariana@saep.com', SHA2('123456', 256), NOW(), NOW());


INSERT INTO empresas
(nome, cnpj, telefone, email, created_at, updated_at)
VALUES
('SENAI', '12.345.678/0001-00', '(19) 99999-1111', 'senai@email.com', NOW(), NOW()),
('Flex', '23.456.789/0001-00', '(19) 98888-2222', 'flex@email.com', NOW(), NOW()),
('SESI', '34.567.890/0001-00', '(19) 97777-3333', 'sesi@email.com', NOW(), NOW()),
('SENAC', '45.678.901/0001-00', '(19) 96666-4444', 'senac@email.com', NOW(), NOW());

INSERT INTO salas
(num_sala, bloco, empresa_id, created_at, updated_at)
VALUES
('1', '2', 1, NOW(), NOW()),
('2', '2', 1, NOW(), NOW()),
('3', '2', 2, NOW(), NOW()),
('4', '1', 3, NOW(), NOW()),
('5', '1', 4, NOW(), NOW());
INSERT INTO agendamentos
(data, hora, descricao, sala_id, created_at, updated_at)
VALUES
('2026-09-21', '08:00:00', 'Reunião de equipe', 1, NOW(), NOW()),
('2026-09-22', '10:30:00', 'Apresentação de projeto', 2, NOW(), NOW()),
('2026-09-23', '14:00:00', 'Treinamento de funcionários', 3, NOW(), NOW()),
('2026-09-24', '09:00:00', 'Reunião com clientes', 4, NOW(), NOW()),
('2026-09-25', '15:30:00', 'Workshop de tecnologia', 5, NOW(), NOW()),
('2026-09-26', '11:00:00', 'Aula de capacitação', 1, NOW(), NOW());

SELECT * FROM agendamentos;