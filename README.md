# Projekt Baza Danych Hurtownia Fitness
Baza danych zawiera dane sprzedażowe przykładowej hurtowni fitness. Baza zawiera 7 tabel: klienci, opinie, produkty, sprzedaże, płatności, adresy i szczegóły_sprzedanych_pozycji. Dane zostały wygenerowane z pomocą sztucznej inteligencji.
#### Diagram ERD Bazy
![alt text](https://github.com/Bjaly/Projekt_BD/blob/main/Diagram_ERD.png?raw=true)
#### Wykorzystane narzędzia:
  * MySQL 8.0
  * Hosting - Amazon Web Services RDS
  * RDMS - DBeaver    
  * Generowanie danych - ChatGPT4o
  * Raporty - Tableau
  * Tworzenie diagramów ERD - dbdiagram.io
  * Tworzenie formularzy - ReTool

#### Dostęp do bazy:
 Aby połączyć się z bazą potrzebujemy programu do obsługi relacyjnych baz danych np. Visual Studio Code, Dbeaver, bądź  MySQL Workbench.  
  ##### Dane do logowania:
   * Server Host:   projekt-bd.cdosuwi2amoa.eu-north-1.rds.amazonaws.com
   * Port: 3306
   * Database: hurtownia_fit
   * Username: gosc
   * Password: gosc123

#### Kwerendy:
Kwerendy po połączeniu z bazą są widoczne jako views, aby samodzielnie sprawdzić działanie kwerendy wystarczy skopiować kod plików z kwerendami usuwając funkcje CREATE VIEW __ AS i nawiasy na początku i końcu,

#### Autorzy
 * Maciej Trybulski, S200004
 * Dawid Zariczny, S199976
