USE colégio_fênix;

CREATE DATABASE colégio_fênix 
DEFAULT CHARACTER SET utf8 -- Codificação de caracteres por padrão
DEFAULT COLLATE utf8_general_ci; -- Utilização dos caracteres que iremos utilizar

CREATE TABLE aula (
id_aula INT UNSIGNED NOT NULL AUTO_INCREMENT,
data_aula DATETIME NOT NULL,
id_aula_polos INT UNSIGNED NOT NULL,
id_aula_alunos INT UNSIGNED NOT NULL,
id_aula_professores INT UNSIGNED NOT NULL,
id_aula_disciplinas INT UNSIGNED NOT NULL,
id_aula_salas INT UNSIGNED NOT NULL,
FOREIGN KEY (id_aula_polos) REFERENCES polos(id_polos) ON DELETE RESTRICT,
FOREIGN KEY (id_aula_alunos) REFERENCES alunos(ra_alunos) ON DELETE RESTRICT,
FOREIGN KEY (id_aula_professores) REFERENCES professores(id_professores) ON DELETE RESTRICT,
FOREIGN KEY (id_aula_disciplinas) REFERENCES disciplinas(id_disciplinas) ON DELETE RESTRICT,
FOREIGN KEY (id_aula_salas) REFERENCES salas(id_salas) ON DELETE RESTRICT,
PRIMARY KEY (id_aula)
) DEFAULT CHARSET=utf8 ENGINE=INNODB;

CREATE TABLE polos (
id_polos INT UNSIGNED NOT NULL AUTO_INCREMENT,
nome_escola CHAR(20) NOT NULL, -- Ex: Colégio Fênix de Campinas, Colégio Fênix de São Caetano...
rua_escola VARCHAR(50) NOT NULL,
numero_escola INT4 NOT NULL,
bairro_escola CHAR(30) NOT NULL,
cidade_escola CHAR(20) NOT NULL,
estado_escola CHAR(20) NOT NULL,
cep_escola INT8 NOT NULL,
PRIMARY KEY (id_polos)
) DEFAULT CHARSET=utf8 ENGINE=INNODB;

CREATE TABLE alunos (
ra_alunos INT UNSIGNED NOT NULL AUTO_INCREMENT, -- Key já garante a unicidade das informações
cpf_aluno DECIMAL(12,0) UNIQUE NOT NULL,
nome_aluno VARCHAR(50) NOT NULL,
dt_nascimento DATE NOT NULL,
sexo_aluno ENUM('F', 'M') NOT NULL,
tipo_sanguineo ENUM('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-') NOT NULL,
categoria_escolaridade ENUM('F', 'EM') NOT NULL, -- (Fundamenta2 ou Ensino Médio)
ano_cursando ENUM('6F', '7F', '8F', '9F', '1EM', '2EM', '3EM') NOT NULL, -- ([6-9]FUNDAMENTAL2 (F) - [1-3]ENSINO MÉDIO (EM))
PRIMARY KEY (ra_alunos)
) DEFAULT CHARSET=utf8 ENGINE=INNODB;

CREATE TABLE professores (
id_professores INT UNSIGNED NOT NULL AUTO_INCREMENT,
nome_professor CHAR(50) NOT NULL,
materia_lecionada_professor CHAR(20) NOT NULL,
titular_professor ENUM('F', 'T') NOT NULL, -- Falso, logo é substituto_professor
salario FLOAT(7,2) NOT NULL,
PRIMARY KEY (id_professores)
) DEFAULT CHARSET=utf8 ENGINE=INNODB;

CREATE TABLE disciplinas (
id_disciplinas INT UNSIGNED NOT NULL AUTO_INCREMENT,
nome_disciplina CHAR(20) NOT NULL,
PRIMARY KEY (id_disciplinas)
) DEFAULT CHARSET=utf8 ENGINE=INNODB;

CREATE TABLE salas (
id_salas INT UNSIGNED NOT NULL AUTO_INCREMENT,
numero_sala INT4 NOT NULL,
lotação_maxima_alunos INT2 NOT NULL,
PRIMARY KEY (id_salas)
) DEFAULT CHARSET=utf8 ENGINE=INNODB;



 















