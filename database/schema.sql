-- Lar dos Idosos · schema.sql
-- Tabelas derivadas do MER do PIE I (Documento de Visão, Seção 3).
-- Relacionamentos do MER são todos 1:N, então não há tabela associativa.

SET NAMES utf8mb4;
DROP DATABASE IF EXISTS lar_dos_idosos;
CREATE DATABASE lar_dos_idosos CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE lar_dos_idosos;

CREATE TABLE idoso (
  id_idoso INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  cpf VARCHAR(14) NOT NULL UNIQUE,
  data_nascimento DATE NOT NULL,
  telefone_responsavel VARCHAR(20) NOT NULL,
  quarto VARCHAR(10) NOT NULL,
  status ENUM('ativo', 'internado', 'alta') NOT NULL DEFAULT 'ativo',
  data_entrada DATE NOT NULL,
  CHECK (data_nascimento <= data_entrada)
);

CREATE TABLE funcionario (
  id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  cpf VARCHAR(14) NOT NULL UNIQUE,
  cargo ENUM('coordenador', 'cuidador', 'enfermeiro', 'auxiliar') NOT NULL,
  turno ENUM('manha', 'tarde', 'noite') NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  senha_hash VARCHAR(255) NOT NULL,
  ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE medicamento (
  id_medicamento INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  dosagem VARCHAR(50) NOT NULL,
  frequencia VARCHAR(50) NOT NULL
);

CREATE TABLE administracao_medicamento (
  id_admin INT AUTO_INCREMENT PRIMARY KEY,
  id_idoso INT NOT NULL,
  id_medicamento INT NOT NULL,
  id_funcionario INT NOT NULL,
  data_hora DATETIME NOT NULL,
  administrado BOOLEAN NOT NULL DEFAULT FALSE,
  observacao TEXT,
  FOREIGN KEY (id_idoso) REFERENCES idoso (id_idoso) ON DELETE RESTRICT,
  FOREIGN KEY (id_medicamento) REFERENCES medicamento (id_medicamento) ON DELETE RESTRICT,
  FOREIGN KEY (id_funcionario) REFERENCES funcionario (id_funcionario) ON DELETE RESTRICT
);

CREATE TABLE ocorrencia (
  id_ocorrencia INT AUTO_INCREMENT PRIMARY KEY,
  id_idoso INT NOT NULL,
  id_funcionario INT NOT NULL,
  tipo ENUM('queda', 'mal_estar', 'comportamento', 'outro') NOT NULL,
  descricao TEXT NOT NULL,
  data_hora DATETIME NOT NULL,
  FOREIGN KEY (id_idoso) REFERENCES idoso (id_idoso) ON DELETE RESTRICT,
  FOREIGN KEY (id_funcionario) REFERENCES funcionario (id_funcionario) ON DELETE RESTRICT
);
