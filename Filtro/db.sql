DROP DATABASE GRAND_SLAM;
CREATE DATABASE GRAND_SLAM;
USE GRAND_SLAM;
CREATE TABLE Pais(Nombre VARCHAR(50) NOT NULL);
ALTER TABLE
    Pais ADD PRIMARY KEY(Nombre);
CREATE TABLE Partido_1_1(
    id INT NOT NULL,
    Tipo ENUM('Masculino', 'Femenino') NOT NULL,
    Jugador1 VARCHAR(80) NOT NULL,
    Jugador2 VARCHAR(80) NOT NULL,
    Fase VARCHAR(50) NOT NULL,
    Resultado TEXT,
    Ganador VARCHAR(80),
    Perdedor VARCHAR(80)
);
ALTER TABLE
    Partido_1_1 ADD PRIMARY KEY(id);
CREATE TABLE Torneo(
    id INT NOT NULL,
    Pais_Anfitrion VARCHAR(50) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    Premio VARCHAR(11) NOT NULL,
    Anyo CHAR(4) NOT NULL
);
ALTER TABLE
    Torneo ADD PRIMARY KEY(id);
CREATE TABLE Partido_2_2(
    id INT NOT NULL,
    Tipo ENUM('Masculino_dobles', 'Femenino_dobles', 'Mixto_dobles') NOT NULL,
    Equipo1 INT NOT NULL,
    Equipo2 INT NOT NULL,
    Fase VARCHAR(50) NOT NULL,
    Resultado TEXT,
    Ganador VARCHAR(80),
    Perdedor VARCHAR(80)
);
ALTER TABLE
    Partido_2_2 ADD PRIMARY KEY(id);
CREATE TABLE Jugador(
    id INT NOT NULL,
    Nombre_Completo VARCHAR(80) NOT NULL,
    cedula INT NOT NULL,
    Pais VARCHAR(50) NOT NULL,
    Nacionalidad VARCHAR(100) NOT NULL
);
ALTER TABLE
    Jugador ADD PRIMARY KEY(id);
ALTER TABLE
    Jugador ADD UNIQUE jugador_nombre_completo_unique(Nombre_Completo);
ALTER TABLE
    Jugador ADD UNIQUE jugador_cedula_unique(cedula);
CREATE TABLE Fase(
    Nombre VARCHAR(50) NOT NULL,
    Premio_perdedor VARCHAR(50) NOT NULL
);
ALTER TABLE
    Fase ADD PRIMARY KEY(Nombre);
CREATE TABLE Equipo(
    id INT NOT NULL,
    Jugador1 VARCHAR(80) NOT NULL,
    Jugador2 VARCHAR(80) NOT NULL
);
ALTER TABLE
    Equipo ADD PRIMARY KEY(id);
CREATE TABLE Arbitros(
    Nombre VARCHAR(80) PRIMARY KEY
);
ALTER TABLE partido_1_1 ADD COLUMN arbitro VARCHAR(80),
ADD constraint partido1_1_arbitro_foreign FOREIGN KEY (arbitro) REFERENCES arbitros(Nombre);
ALTER TABLE partido_2_2 ADD COLUMN arbitro VARCHAR(80),
ADD constraint partido_2_2_arbitro_foreign FOREIGN KEY (arbitro) REFERENCES arbitros(Nombre);
ALTER TABLE
    Partido_2_2 ADD CONSTRAINT partido_2_2_equipo1_foreign FOREIGN KEY(Equipo1) REFERENCES Equipo(id);
ALTER TABLE
    Partido_1_1 ADD CONSTRAINT partido_1_1_jugador1_foreign FOREIGN KEY(Jugador1) REFERENCES Jugador(Nombre_completo);
ALTER TABLE
    Partido_1_1 ADD CONSTRAINT partido_1_1_fase_foreign FOREIGN KEY(Fase) REFERENCES Fase(Nombre);
ALTER TABLE
    Jugador ADD CONSTRAINT jugador_pais_foreign FOREIGN KEY(Pais) REFERENCES Pais(Nombre);
ALTER TABLE
    Partido_2_2 ADD CONSTRAINT partido_2_2_fase_foreign FOREIGN KEY(Fase) REFERENCES Fase(Nombre);
ALTER TABLE
    Partido_2_2 ADD CONSTRAINT partido_2_2_equipo2_foreign FOREIGN KEY(Equipo2) REFERENCES Equipo(id);
ALTER TABLE
    Torneo ADD CONSTRAINT torneo_pais_anfitrion_foreign FOREIGN KEY(Pais_Anfitrion) REFERENCES Pais(Nombre);
ALTER TABLE
    Equipo ADD CONSTRAINT equipo_jugador1_foreign FOREIGN KEY(Jugador1) REFERENCES Jugador(Nombre_completo);
ALTER TABLE
    Partido_1_1 ADD CONSTRAINT partido_1_1_jugador2_foreign FOREIGN KEY(Jugador1) REFERENCES Jugador(Nombre_completo);
ALTER TABLE
    Equipo ADD CONSTRAINT equipo_jugador2_foreign FOREIGN KEY(Jugador2) REFERENCES Jugador(Nombre_completo);