-- 1. Creación de la tabla Rol
CREATE TABLE Rol (
    Id_Rol SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL UNIQUE
);

-- 2. Creación de la tabla Modalidad
CREATE TABLE Modalidad (
    Id_Modalidad SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL UNIQUE
);

-- 3. Creación de la tabla Campus
CREATE TABLE Campus (
    Id_Campus SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL UNIQUE
);

-- 4. Creación de la tabla Promocion
CREATE TABLE Promocion (
    Id_Promocion SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL UNIQUE
);

-- 5. Creación de la tabla Vertical
CREATE TABLE Vertical (
    Id_Vertical SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL UNIQUE
);

-- 6. Creación de la tabla Proyecto
CREATE TABLE Proyecto (
    Id_Proyecto SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL
);

-- 7. Creación de la tabla Profesor
CREATE TABLE Profesor (
    Id_Profesor SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    -- Claves Foráneas
    Id_Promocion INT NOT NULL REFERENCES Promocion(Id_Promocion),
    Id_Vertical INT NOT NULL REFERENCES Vertical(Id_Vertical),
    Id_Campus INT NOT NULL REFERENCES Campus(Id_Campus),
    Id_Rol INT NOT NULL REFERENCES Rol(Id_Rol),
    Id_Modalidad INT NOT NULL REFERENCES Modalidad(Id_Modalidad)
);

-- 8. Creación de la tabla Alumno
CREATE TABLE Alumno (
    Id_Alumno SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Fecha_comienzo DATE,
    -- Claves Foráneas
    Id_Promocion INT NOT NULL REFERENCES Promocion(Id_Promocion),
    Id_Campus INT NOT NULL REFERENCES Campus(Id_Campus)
);

-- 9. Creación de la tabla Proyecto_Alumno (Tabla de relación N:M)
CREATE TABLE Proyecto_Alumno (
    Id_Alumno INT NOT NULL REFERENCES Alumno(Id_Alumno),
    Id_Proyecto INT NOT NULL REFERENCES Proyecto(Id_Proyecto),
    Calificacion VARCHAR(255),
    -- Definición de la clave primaria compuesta
    PRIMARY KEY (Id_Alumno, Id_Proyecto)
);