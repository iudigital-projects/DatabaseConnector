CREATE DATABASE IF NOT EXISTS jardineria;
USE jardineria;

DROP TABLE IF EXISTS cliente;

CREATE TABLE cliente (
  ID_cliente INT NOT NULL,
  nombre_cliente VARCHAR(100) NOT NULL,
  pais VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID_cliente)
);

INSERT INTO cliente (ID_cliente, nombre_cliente, pais) VALUES
  (1, 'Ana Torres', 'Colombia'),
  (2, 'Luis Gómez', 'México'),
  (3, 'María Rodríguez', 'España'),
  (4, 'Carlos Pérez', 'Argentina'),
  (5, 'Sofía Martínez', 'Chile'),
  (6, 'Juan Ramírez', 'Perú'),
  (7, 'Emma López', 'Ecuador'),
  (8, 'Diego Herrera', 'Venezuela'),
  (9, 'Valentina Castro', 'Uruguay'),
  (10, 'Andrés Silva', 'Brasil');
