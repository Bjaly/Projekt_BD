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
-- Tworzenie tabeli opinie
CREATE TABLE opinie(
    id VARCHAR(5) PRIMARY KEY,
    id_klienta VARCHAR(3) NOT NULL,
    id_produktu CHAR(4) NOT NULL,
    tresc TEXT,
    data_opinii DATE NOT NULL,
    ocena INT NOT NULL);
-- Tworzenie tabeli produkty
CREATE TABLE produkty(
    kod_produktu CHAR(4) PRIMARY KEY,
    cena_zakupu DECIMAL(5,2) NOT NULL,
    nazwa_produktu VARCHAR(40) NOT NULL UNIQUE,
    cena_sprzedazy DECIMAL(5,2) NOT NULL,
    marza DECIMAL(5,2) NOT NULL);
-- Tworzenia tabeli sprzedaze
CREATE TABLE sprzedaze(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_klienta VARCHAR(3) NOT NULL,
    data DATE NOT NULL,
    id_platnosci VARCHAR(5) NOT NULL UNIQUE)
-- Tworzenie tabeli szczegoly_sprzedanych_pozycji
CREATE TABLE szczegoly_sprzedanych_pozycji(
    id INT PRIMARY KEY AUTO_INCREMENT,
    kod_produktu CHAR(4) NOT NULL,
    liczba_pozycji INT NOT NULL,
    id_sprzedazy INT NOT NULL);
