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
