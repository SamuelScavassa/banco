---------CRIAR BANCO---------

CREATE DATABASE ConsultasSQL_SamuelMelegatti
GO

USE ConsultasSQL_SamuelMelegatti
GO

-----CRIAR TABELAS-----

--Alunos--


CREATE TABLE Alunos
(
    idAluno INT     NOT NULL    PRIMARY KEY IDENTITY,
    nomeAluno VARCHAR(50)   NOT NULL
)
GO

--Professores--

CREATE TABLE Professores
(
    idProfessor INT     NOT NULL    PRIMARY KEY IDENTITY,
    nomeProfessor VARCHAR(50)   NOT NULL
)

--Curso--

CREATE TABLE Cursos
(
    idCurso     INT     NOT NULL    PRIMARY KEY IDENTITY,
    nomeCurso   VARCHAR(100)    NOT NULL
)
GO

--Disciplinas--

CREATE TABLE Disciplinas
(
    idDisciplina    INT     NOT NULL    PRIMARY KEY IDENTITY,
    nomeDisciplina      VARCHAR(100)    NOT NULL,
    chDisciplina    INT     NOT NULL,
    cursoId         INT,
    profId          INT,
    FOREIGN KEY (cursoId) REFERENCES Cursos(idCurso),
    FOREIGN KEY (profId) REFERENCES Professores(idProfessor)

)

--Aproveitamentos--

CREATE TABLE Aproveitamentos
(
    disciplinaId    INT     NOT NULL,
    alunoId     INT     NOT NULL,
    anoAprov     INT     NOT NULL,
    semAprov     INT     NOT NULL,
    notasAprov     INT     NOT NULL,
    faltasAprov     INT     NOT NULL    DEFAULT 0,
    CHECK (notasAprov >= 0 and notasAprov <= 10),
    CHECK (semAprov in(1,2)),
    PRIMARY KEY (disciplinaId, alunoId, anoAprov, semAprov),
    FOREIGN KEY (disciplinaId) REFERENCES Disciplinas(idDisciplina),
    FOREIGN KEY (alunoId) REFERENCES Alunos(idAluno)

)

---DML: Linguagem de Manipulação de Dados---
---Insert - Update - Delete - Select---

--INSERT--

INSERT into Cursos VALUES 
    ('Tecnologia em Análise e Desenvolvimento de Sistemas'),
    ('Tecnologia em Informática para Negócios'),
    ('Tecnologia em Agronegócios')

GO

SELECT * from Aproveitamentos
go

INSERT into Professores 
VALUES ('Walter Pedroso'), ('Mario Prado'),('Valéria Volpe'), ('Maura Frigo'), ('Lucimar Sasso')
GO


INSERT into Disciplinas (nomeDisciplina, chDisciplina, cursoId, profId)
VALUES  ('Ingês I', 40, 1, 4)
GO

INSERT into Disciplinas (nomeDisciplina, chDisciplina, cursoId, profId)
VALUES  ('Algoritmo', 80, 1, 3)
GO

INSERT into Disciplinas (nomeDisciplina, chDisciplina, cursoId, profId)
VALUES  ('Banco de Dados', 80, 2, 3)
GO
INSERT into Disciplinas (nomeDisciplina, chDisciplina, cursoId, profId)
VALUES  ('Banco de Dados', 80, 1, 3)
GO

INSERT into Disciplinas (nomeDisciplina, chDisciplina, cursoId, profId)
VALUES  ('Programação Avançada', 80, 1, 2)
GO

INSERT into Disciplinas (nomeDisciplina, chDisciplina, cursoId, profId)
VALUES  ('Engenharia de Software', 80, 1, 5)
GO

INSERT into Disciplinas (nomeDisciplina, chDisciplina, cursoId, profId)
VALUES  ('Rede de computadores', 80, 1, 1)
GO

INSERT into Disciplinas (nomeDisciplina, chDisciplina, cursoId, profId)
VALUES  ('Rede de computadores', 80, 2, 1)
GO

INSERT into Disciplinas (nomeDisciplina, chDisciplina, cursoId, profId)
VALUES  ('Matematica', 40, 2, 5)
GO

INSERT into Disciplinas (nomeDisciplina, chDisciplina, cursoId, profId)
VALUES  ('Horta doméstica', 40, 3, 3)
GO


INSERT into Alunos VALUES  
    ('Daniela'),
    ('Rafael'),
    ('Ana Luisa'),
    ('Pedro Henrique'),
    ('Maria Paula'),
    ('Miguel Augusto'),
    ('Andre Luis'),
    ('Bruno Augusto'),
    ('Ana Maria')
GO

INSERT into Alunos VALUES  
    ('Samuel')
GO

-- Aluno 1 --
INSERT into Aproveitamentos
(disciplinaId, alunoId, anoAprov, semAprov, notasAprov, faltasAprov)
VALUES
    (1,1,2022,1,8.5,10), -- aprovado --
    (2,1,2022,1,4,5), -- Reprovado por nota --
    (4,1,2022,1,7.5,30) -- Reprovado por falta --
GO

-- Aluno 2 --
INSERT into Aproveitamentos
(disciplinaId, alunoId, anoAprov, semAprov, notasAprov, faltasAprov)
VALUES
    (4,2,2022,1,7.5,30), -- Reprovado por falta --
    (7,2,2022,1,1.5,2), -- Reprovado por nota --
    (8,2,2022,1,10,15) -- Aprovado --
GO

-- Aluno 3 --
INSERT into Aproveitamentos
(disciplinaId, alunoId, anoAprov, semAprov, notasAprov, faltasAprov)
VALUES
    (2,3,2022,1,3,2), -- Reprovado por nota --
    (5,3,2022,1,8,40), -- Reprovado por falta --
    (6,3,2022,1,10,4) -- Aprovado --
GO

-- Aluno 4 --
INSERT into Aproveitamentos
(disciplinaId, alunoId, anoAprov, semAprov, notasAprov, faltasAprov)
VALUES
    (9,4,2022,1,3,30)
GO

-- Aluno 5 --
INSERT into Aproveitamentos
(disciplinaId, alunoId, anoAprov, semAprov, notasAprov, faltasAprov)
VALUES
    (9,5,2022,1,9,10)
GO

-- Aluno 6 --
INSERT into Aproveitamentos
(disciplinaId, alunoId, anoAprov, semAprov, notasAprov, faltasAprov)
VALUES
    (9,6,2022,1,5,10)
GO

-- Aluno 7 --
INSERT into Aproveitamentos
(disciplinaId, alunoId, anoAprov, semAprov, notasAprov, faltasAprov)
VALUES
    (3,7,2022,1,8.75,4)
GO
INSERT into Aproveitamentos
(disciplinaId, alunoId, anoAprov, semAprov, notasAprov, faltasAprov)
VALUES
    (5,7,2022,1,0.75,4),
    (6,7,2022,1,2.75,35)
GO

-- Aluno 8 --
INSERT into Aproveitamentos
(disciplinaId, alunoId, anoAprov, semAprov, notasAprov, faltasAprov)
VALUES
    (7,8,2022,1,5.5,10),
    (8,8,2022,1,3.5,50),
    (4,8,2022,1,9.5,5)
GO


-- Aluno 9 --
INSERT into Aproveitamentos
(disciplinaId, alunoId, anoAprov, semAprov, notasAprov, faltasAprov)
VALUES
    (9,9,2022,1,9.5,10)
GO


-- Aluno 10 --
INSERT into Aproveitamentos
(disciplinaId, alunoId, anoAprov, semAprov, notasAprov, faltasAprov)
VALUES
    (4,10,2022,1,9.5,10),
    (7,10,2022,1,6.5,10)
GO

