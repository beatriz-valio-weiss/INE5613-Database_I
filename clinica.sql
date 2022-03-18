CREATE TABLE Especialidade ( 
 id INT PRIMARY KEY,  
 nome VARCHAR(30) NOT NULL
); 
 
CREATE TABLE Salas ( 
 id INT PRIMARY KEY
); 
 
CREATE TABLE Medico ( 
 nome VARCHAR(50) NOT NULL,  
 salario FLOAT NOT NULL,  
 senha VARCHAR(30) NOT NULL,  
 crm INT PRIMARY KEY,  
 email VARCHAR(100) NOT NULL,  
 especializacao1 INT NOT NULL,  
 especializacao2 INT,  
 especializacao3 INT,
 FOREIGN KEY (especializacao1) REFERENCES Especialidade (id),
 FOREIGN KEY (especializacao2) REFERENCES Especialidade (id),
 FOREIGN KEY (especializacao3) REFERENCES Especialidade (id)
); 
 
CREATE TABLE Pacientes ( 
 cpf INT PRIMARY KEY,  
 nome VARCHAR(50) NOT NULL,  
 senha VARCHAR(30) NOT NULL,  
 email VARCHAR(100) NOT NULL  
); 
 
CREATE TABLE Consultas ( 
 data DATE NOT NULL,  
 hora TIME NOT NULL,  
 encaminhamento VARCHAR(200),  
 observações VARCHAR(200),  
 id INT PRIMARY KEY,  
 idSalas INT NOT NULL,  
 idEspecialidade INT NOT NULL,  
 idPacientes INT NOT NULL,  
 idMédico INT NOT NULL,  
 FOREIGN KEY (idSalas) REFERENCES Salas (id),
 FOREIGN KEY (idEspecialidade) REFERENCES Especialidade (id),
 FOREIGN KEY (idPacientes) REFERENCES Pacientes (cpf),
 FOREIGN KEY (idMédico) REFERENCES Medico (crm)
); 
 
 
CREATE TABLE SalasPresencial ( 
 numero INT NOT NULL,  
 idSalas INT NOT NULL,  
 FOREIGN KEY (idSalas) REFERENCES Salas (id)
); 
 
 

CREATE TABLE Equipamentos ( 
 tipo VARCHAR(40),  
 modelo VARCHAR(40),  
 numeroSerie VARCHAR(40) PRIMARY KEY,  
 idPresencial INT NOT NULL,  
 FOREIGN KEY (idPresencial) REFERENCES SalasPresencial (numero)
); 
  
CREATE TABLE SalasTelemedicina ( 
 link VARCHAR(100) NOT NULL,  
 idSalas INT NOT NULL,  
 FOREIGN KEY (idSalas) REFERENCES Salas (id)
); 
 
CREATE TABLE Exame ( 
 tipo VARCHAR(50) NOT NULL,  
 data DATE NOT NULL,  
 hora TIME NOT NULL,  
 id INT PRIMARY KEY,  
 idPresencial INT NOT NULL,  
 idPacientes INT NOT NULL,  
 FOREIGN KEY (idPresencial) REFERENCES SalasPresencial (idSalas),
 FOREIGN KEY (idPacientes) REFERENCES Pacientes (cpf)
); 
 
 
CREATE TABLE ResultadoExame ( 
 disponivel INT DEFAULT '0',  
 resultado VARCHAR(200) NOT NULL,  
 idExame INT NOT NULL,  
 idPacientes INT NOT NULL,  
 FOREIGN KEY (idExame) REFERENCES Exame (id),
 FOREIGN KEY (idPacientes) REFERENCES Pacientes (cpf)
); 
  
CREATE TABLE RequisicaoExame ( 
 data DATE NOT NULL,  
 hora TIME NOT NULL,  
 descricao VARCHAR(200) NOT NULL,  
 idConsultas INT NOT NULL,  
 FOREIGN KEY (idConsultas) REFERENCES Consultas (id)
); 
 
CREATE TABLE AtestadoMedico ( 
 data DATE NOT NULL,  
 qtdDias INT NOT NULL,  
 motivo VARCHAR(200) NOT NULL,  
 idConsultas INT NOT NULL,  
 nomePaciente VARCHAR(50) NOT NULL,  
 idPacientes INT NOT NULL,   
 nomeMedico VARCHAR(50) NOT NULL,  
 idMédico INT NOT NULL,  
 FOREIGN KEY (idConsultas) REFERENCES Consultas (id),
 FOREIGN KEY (idPacientes) REFERENCES Pacientes (cpf),
 FOREIGN KEY (idMédico) REFERENCES Medico (crm)
);
