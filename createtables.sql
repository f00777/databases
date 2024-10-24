-- Tabla Equipos
CREATE TABLE Equipos (
  id_equipo INT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad VARCHAR(100),
  conferencia VARCHAR(50),
  division VARCHAR(50)
);

-- Tabla Jugadores
CREATE TABLE Jugadores (
  id_jugador INT PRIMARY KEY,
  nombre VARCHAR(50),
  fecha_nacimiento DATE,
  posicion VARCHAR(20),
  altura DECIMAL(3,2),
  peso DECIMAL(5,2),
  id_equipo INT,
  FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo)
);

-- Tabla Partidos
CREATE TABLE Partidos (
  id_partido INT PRIMARY KEY,
  fecha DATE,
  lugar VARCHAR(100),
  id_equipo_local INT,
  id_equipo_visitante INT,
  resultado_local INT,
  resultado_visitante INT,
  FOREIGN KEY (id_equipo_local) REFERENCES Equipos(id_equipo),
  FOREIGN KEY (id_equipo_visitante) REFERENCES Equipos(id_equipo)
);

-- Tabla Estadísticas por Jugador y Partido
CREATE TABLE Estadisticas_Jugador_Partido (
  id_estadistica INT PRIMARY KEY,
  id_partido INT,
  id_jugador INT,
  puntos INT,
  rebotes INT,
  asistencias INT,
  minutos_jugados DECIMAL(4,2),
  faltas INT,
  robos INT,
  FOREIGN KEY (id_partido) REFERENCES Partidos(id_partido),
  FOREIGN KEY (id_jugador) REFERENCES Jugadores(id_jugador)
);

-- Tabla Árbitros
CREATE TABLE Arbitros (
  id_arbitro INT PRIMARY KEY,
  nombre VARCHAR(100),
  experiencia INT
);

-- Tabla Árbitros y Partidos (relación)
CREATE TABLE Arbitros_Partidos (
  id_arbitro INT,
  id_partido INT,
  PRIMARY KEY(id_arbitro, id_partido),
  FOREIGN KEY (id_arbitro) REFERENCES Arbitros(id_arbitro),
  FOREIGN KEY (id_partido) REFERENCES Partidos(id_partido)
);

-- Inserción de 10 Equipos 
INSERT INTO Equipos (id_equipo, nombre, ciudad, conferencia, division) VALUES
(1, 'Los Angeles Lakers', 'Los Angeles', 'Oeste', 'Pacífico'),
(2, 'Golden State Warriors', 'San Francisco', 'Oeste', 'Pacífico'),
(3, 'Brooklyn Nets', 'Brooklyn', 'Este', 'Atlántico'),
(4, 'Chicago Bulls', 'Chicago', 'Este', 'Central'),
(5, 'Miami Heat', 'Miami', 'Este', 'Sudeste'),
(6, 'Phoenix Suns', 'Phoenix', 'Oeste', 'Pacífico'),
(7, 'Dallas Mavericks', 'Dallas', 'Oeste', 'Suroeste'),
(8, 'Milwaukee Bucks', 'Milwaukee', 'Este', 'Central'),
(9, 'Boston Celtics', 'Boston', 'Este', 'Atlántico'),
(10, 'Philadelphia 76ers', 'Philadelphia', 'Este', 'Atlántico');


--Inserción de 50 Jugadores (5 en cada equipo)
INSERT INTO Jugadores (id_jugador, nombre, fecha_nacimiento, posicion, altura, peso, id_equipo) VALUES
(1, 'LeBron James', '1984-12-30', 'Alero', 2.06, 113.4, 1),
(2, 'Anthony Davis', '1993-03-11', 'Ala-pívot', 2.08, 115.0, 1),
(3, 'Russell Westbrook', '1988-11-12', 'Base', 1.91, 90.7, 1),
(4, 'Carmelo Anthony', '1984-05-29', 'Alero', 2.01, 108.9, 1),
(5, 'Dwight Howard', '1985-12-08', 'Pívot', 2.10, 120.7, 1),

(6, 'Stephen Curry', '1988-03-14', 'Base', 1.88, 83.9, 2),
(7, 'Klay Thompson', '1990-02-08', 'Escolta', 1.98, 97.5, 2),
(8, 'Draymond Green', '1990-03-04', 'Ala-pívot', 1.98, 104.3, 2),
(9, 'Andrew Wiggins', '1995-02-23', 'Alero', 2.01, 91.6, 2),
(10, 'James Wiseman', '2001-03-31', 'Pívot', 2.16, 109.8, 2),

(11, 'Kevin Durant', '1988-09-29', 'Alero', 2.08, 109.8, 3),
(12, 'James Harden', '1989-08-26', 'Escolta', 1.96, 99.8, 3),
(13, 'Kyrie Irving', '1992-03-23', 'Base', 1.88, 88.5, 3),
(14, 'Blake Griffin', '1989-03-16', 'Ala-pívot', 2.06, 113.4, 3),
(15, 'LaMarcus Aldridge', '1985-07-19', 'Pívot', 2.11, 113.4, 3),

(16, 'Zach LaVine', '1995-03-10', 'Escolta', 1.98, 91.6, 4),
(17, 'Nikola Vučević', '1990-10-24', 'Pívot', 2.13, 118.0, 4),
(18, 'Lonzo Ball', '1997-10-27', 'Base', 1.98, 86.2, 4),
(19, 'DeMar DeRozan', '1989-08-07', 'Alero', 2.01, 100.2, 4),
(20, 'Alex Caruso', '1994-02-28', 'Escolta', 1.96, 84.4, 4),

(21, 'Jimmy Butler', '1989-09-14', 'Alero', 2.01, 104.3, 5),
(22, 'Bam Adebayo', '1997-07-18', 'Pívot', 2.06, 116.1, 5),
(23, 'Kyle Lowry', '1986-03-25', 'Base', 1.83, 89.8, 5),
(24, 'Tyler Herro', '2000-01-20', 'Escolta', 1.96, 88.5, 5),
(25, 'Duncan Robinson', '1994-04-22', 'Alero', 2.01, 98.4, 5),

(26, 'Chris Paul', '1985-05-06', 'Base', 1.85, 79.8, 6),
(27, 'Devin Booker', '1996-10-30', 'Escolta', 1.96, 93.2, 6),
(28, 'Deandre Ayton', '1998-07-23', 'Pívot', 2.11, 113.4, 6),
(29, 'Mikal Bridges', '1996-08-30', 'Alero', 1.98, 95.3, 6),
(30, 'Jae Crowder', '1990-07-06', 'Ala-pívot', 1.98, 107.1, 6),

(31, 'Luka Dončić', '1999-02-28', 'Base', 2.01, 104.3, 7),
(32, 'Kristaps Porziņģis', '1995-08-02', 'Pívot', 2.21, 109.8, 7),
(33, 'Tim Hardaway Jr.', '1992-03-16', 'Escolta', 1.96, 93.0, 7),
(34, 'Dorian Finney-Smith', '1993-05-04', 'Alero', 2.01, 99.8, 7),
(35, 'Jalen Brunson', '1996-08-31', 'Base', 1.85, 86.2, 7),

(36, 'Giannis Antetokounmpo', '1994-12-06', 'Alero', 2.11, 110.7, 8),
(37, 'Jrue Holiday', '1990-06-12', 'Base', 1.93, 93.2, 8),
(38, 'Khris Middleton', '1991-08-12', 'Alero', 2.01, 99.8, 8),
(39, 'Brook Lopez', '1988-04-01', 'Pívot', 2.13, 122.5, 8),
(40, 'Bobby Portis', '1995-02-10', 'Ala-pívot', 2.08, 113.4, 8),

(41, 'Jayson Tatum', '1998-03-03', 'Alero', 2.03, 95.3, 9),
(42, 'Jaylen Brown', '1996-10-24', 'Escolta', 1.98, 101.6, 9),
(43, 'Marcus Smart', '1994-03-06', 'Base', 1.93, 99.8, 9),
(44, 'Al Horford', '1986-06-03', 'Pívot', 2.06, 109.8, 9),
(45, 'Robert Williams', '1997-10-17', 'Pívot', 2.06, 108.9, 9),

(46, 'Joel Embiid', '1994-03-16', 'Pívot', 2.13, 127.0, 10),
(47, 'Tobias Harris', '1992-07-15', 'Alero', 2.06, 107.5, 10),
(48, 'Tyrese Maxey', '2000-11-04', 'Base', 1.88, 91.6, 10),
(49, 'Matisse Thybulle', '1997-03-04', 'Escolta', 1.96, 91.6, 10),
(50, 'Danny Green', '1987-06-22', 'Escolta', 1.98, 95.3, 10);


--Inserción de 10 Árbitros 
INSERT INTO Arbitros (id_arbitro, nombre, experiencia) VALUES
(1, 'Scott Foster', 20),
(2, 'Tony Brothers', 25),
(3, 'Zach Zarba', 18),
(4, 'Marc Davis', 23),
(5, 'James Capers', 27),
(6, 'Ed Malloy', 19),
(7, 'Ken Mauer', 34),
(8, 'Eric Lewis', 16),
(9, 'Sean Wright', 16),
(10, 'John Goble', 14);

--Inserción de 5 Parridos Aleatorios
INSERT INTO Partidos (id_partido, fecha, lugar, id_equipo_local, id_equipo_visitante, resultado_local, resultado_visitante) VALUES
(1, '2024-10-22', 'Staples Center', 1, 2, 110, 105),
(2, '2024-10-23', 'Barclays Center', 3, 4, 115, 98),
(3, '2024-10-24', 'FTX Arena', 5, 6, 120, 113),
(4, '2024-10-25', 'American Airlines Center', 7, 8, 105, 108),
(5, '2024-10-26', 'TD Garden', 9, 10, 102, 110);

--Asignar árbitro a cada partido
INSERT INTO Arbitros_Partidos (id_arbitro, id_partido) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

--Asignar valores aleatorios a la tabla de Estadisticas_Jugador_Partido
INSERT INTO Estadisticas_Jugador_Partido (id_estadistica, id_partido, id_jugador, puntos, rebotes, asistencias, minutos_jugados, faltas, robos) VALUES
(1, 1, 1, 25, 8, 7, 36.5, 3, 1),
(2, 1, 2, 18, 10, 3, 32.0, 4, 2),
(3, 1, 3, 22, 6, 8, 34.1, 2, 3),
(4, 1, 4, 15, 4, 2, 28.3, 5, 1),
(5, 1, 5, 10, 12, 1, 29.5, 4, 0),

(6, 1, 6, 35, 5, 9, 38.0, 2, 1),
(7, 1, 7, 20, 3, 4, 31.7, 3, 1),
(8, 1, 8, 12, 11, 8, 35.0, 2, 2),
(9, 1, 9, 16, 6, 2, 30.1, 3, 1),
(10, 1, 10, 8, 9, 0, 24.7, 5, 0),

(11, 2, 11, 32, 7, 5, 37.2, 3, 2),
(12, 2, 12, 28, 6, 7, 35.5, 4, 1),
(13, 2, 13, 18, 3, 10, 34.8, 4, 2),
(14, 2, 14, 14, 10, 3, 30.9, 5, 0),
(15, 2, 15, 12, 8, 1, 28.6, 3, 1),

(16, 2, 16, 25, 4, 6, 34.3, 2, 3),
(17, 2, 17, 22, 12, 4, 33.0, 5, 0),
(18, 2, 18, 10, 3, 11, 29.5, 3, 1),
(19, 2, 19, 15, 5, 2, 31.1, 4, 2),
(20, 2, 20, 7, 2, 1, 25.8, 2, 0),

(21, 3, 21, 28, 9, 5, 36.2, 3, 2),
(22, 3, 22, 18, 13, 3, 33.4, 4, 1),
(23, 3, 23, 17, 4, 9, 31.2, 5, 3),
(24, 3, 24, 16, 2, 2, 27.5, 3, 0),
(25, 3, 25, 14, 5, 1, 29.9, 2, 1),

(26, 3, 26, 30, 6, 8, 37.5, 3, 2),
(27, 3, 27, 24, 4, 5, 34.8, 4, 0),
(28, 3, 28, 12, 12, 2, 35.0, 5, 1),
(29, 3, 29, 18, 7, 3, 33.1, 3, 1),
(30, 3, 30, 10, 8, 1, 28.7, 4, 0),

(31, 4, 31, 32, 10, 11, 39.3, 4, 3),
(32, 4, 32, 26, 8, 3, 36.8, 3, 1),
(33, 4, 33, 19, 3, 6, 34.2, 4, 2),
(34, 4, 34, 16, 5, 2, 30.5, 5, 0),
(35, 4, 35, 10, 2, 1, 27.9, 3, 0),

(36, 4, 36, 35, 11, 7, 38.4, 4, 2),
(37, 4, 37, 18, 4, 9, 35.0, 3, 3),
(38, 4, 38, 22, 8, 2, 33.1, 2, 1),
(39, 4, 39, 12, 10, 0, 29.4, 5, 0),
(40, 4, 40, 9, 4, 1, 26.2, 3, 0),

(41, 5, 41, 30, 6, 4, 36.5, 3, 1),
(42, 5, 42, 21, 5, 6, 34.1, 2, 2),
(43, 5, 43, 17, 4, 10, 33.9, 4, 1),
(44, 5, 44, 14, 9, 1, 32.2, 5, 0),
(45, 5, 45, 8, 12, 0, 30.8, 3, 1),

(46, 5, 46, 33, 8, 4, 37.0, 3, 2),
(47, 5, 47, 18, 6, 5, 34.5, 4, 0),
(48, 5, 48, 14, 4, 8, 32.8, 3, 3),
(49, 5, 49, 10, 3, 2, 30.1, 5, 1),
(50, 5, 50, 7, 2, 1, 28.5, 2, 0);






