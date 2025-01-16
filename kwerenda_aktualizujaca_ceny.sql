-- Kwerenda aktualizuje cenę sprzedaży najgorzej sprzedających się produktów w oparciu o wulumen
UPDATE produkty
SET cena_sprzedazy = cena_sprzedazy * 0.95,
    marza = (cena_sprzedazy * 0.95) - cena_zakupu
WHERE kod_produktu IN (   
    SELECT kod_produktu
    FROM (
        SELECT p.kod_produktu
        FROM produkty AS p
        INNER JOIN szczegoly_sprzedanych_pozycji AS ssp
        ON p.kod_produktu = ssp.kod_produktu
        GROUP BY p.kod_produktu
        ORDER BY SUM(ssp.liczba_pozycji) ASC
        LIMIT 10 -- Bierzemy 10 najgorzej sprzedająych się produktów
    ) AS subquery 
)
AND (cena_sprzedazy * 0.95) >= (cena_zakupu * 1.09); -- Określamy warunki że obniżka cen spowoduje obniżenie marży nie mniej niż do 9%
