CREATE DATABASE oficina_db;

USE oficina_db;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

CREATE TABLE veiculos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(100) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    marca VARCHAR(100) NOT NULL,
    cliente_id INT NOT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,

    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE agendamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    descricao VARCHAR(255),
    cliente_id INT NOT NULL,
    veiculo_id INT NOT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,

    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (veiculo_id) REFERENCES veiculos(id)
);

USE oficina_db;

INSERT INTO usuarios
(nome, email, senha, created_at, updated_at)
VALUES
('Administrador', 'admin@saep.com', SHA2('123456', 256), NOW(), NOW()),
('Carlos Oliveira', 'carlos@saep.com', SHA2('123456', 256), NOW(), NOW()),
('Mariana Santos', 'mariana@saep.com', SHA2('123456', 256), NOW(), NOW());

INSERT INTO clientes
(nome, cpf, telefone, email, created_at, updated_at)
VALUES
('João Silva', AES_ENCRYPT('12345678901', 'chave123'), '(19) 99999-1111', 'joao@email.com', NOW(), NOW()),
('Maria Santos', AES_ENCRYPT('98765432100', 'chave123'), '(19) 98888-2222', 'maria@email.com', NOW(), NOW()),
('Pedro Oliveira', AES_ENCRYPT('11122233344', 'chave123'), '(19) 97777-3333', 'pedro@email.com', NOW(), NOW());

INSERT INTO veiculos
(placa, modelo, marca, cliente_id, created_at, updated_at)
VALUES
('ABC1D23', 'Civic', 'Honda', 1, NOW(), NOW()),
('DEF4G56', 'Corolla', 'Toyota', 2, NOW(), NOW()),
('GHI7J89', 'Onix', 'Chevrolet', 3, NOW(), NOW());

INSERT INTO agendamentos
(data, hora, descricao, cliente_id, veiculo_id, created_at, updated_at)
VALUES
('2026-11-20', '08:00:00', 'Troca de óleo', 1, 1, NOW(), NOW()),
('2026-11-21', '10:30:00', 'Revisão do veículo', 2, 2, NOW(), NOW()),
('2026-11-22', '14:00:00', 'Manutenção preventiva', 3, 3, NOW(), NOW());

SELECT * FROM agendamentos;
