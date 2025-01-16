-- Kwerenda obniża ceny najgorzej sprzedających się produktów o 5%
-- Tworzymy CTE ktore znajduje 10 najgorzej sprzedajacych sie produktow wedlug wolumenu sprzedazy
WITH najgorzej_sprzedajace AS (
    SELECT p.kod_produktu
    FROM produkty AS p
    INNER JOIN szczegoly_sprzedanych_pozycji AS ssp
    ON p.kod_produktu = ssp.kod_produktu
    GROUP BY p.kod_produktu
    ORDER BY SUM(ssp.liczba_pozycji) ASC
    LIMIT 10
)
UPDATE produkty
SET cena_sprzedazy = cena_sprzedazy * 0.95,
    marza = (cena_sprzedazy * 0.95) - cena_zakupu
WHERE kod_produktu IN (SELECT kod_produktu FROM NajgorzejSprzedajace)
AND (cena_sprzedazy * 0.95) >= (cena_zakupu * 1.09); -- Sprawdzamy aby produkt po obnizonej cenie mial marze conajmniej 9% (nie chcemy sprzedawać produktów na których nie zarobimy
