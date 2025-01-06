-- Tworzenie bazy danych
CREATE DATABASE hurtownia_fit;
--- Tworzenie tabeli Klienci
CREATE TABLE klienci (
    id VARCHAR(3) PRIMARY KEY COMMENT 'Klucz podstawowy - K1, K2',
    imie VARCHAR(30) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    data_urodzenia DATE,
    email VARCHAR(50) NOT NULL UNIQUE,
    data_rejestracji DATE NOT NULL DEFAULT(CURRENT_DATE),
    id_adres VARCHAR(5) NOT NULL COMMENT 'Klucz obcy'
);
-- Tworzenie tabeli adresy
CREATE TABLE adresy(
    id VARCHAR(3) PRIMARY KEY,
    miasto VARCHAR(30) NOT NULL,
    ulica VARCHAR(50) NOT NULL,
    kod_pocztowy CHAR(6) NOT NULL CHECK (kod_pocztowy REGEXP '^[0-9]{2}-[0-9]{3}$'),
    numer_mieszkania INT NOT NULL);
