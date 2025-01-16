SELECT p.kod_produktu,p.nazwa_produktu, SUM(ssp.liczba_pozycji) as suma_pozycji
FROM produkty AS p
INNER JOIN szczegoly_sprzedanych_pozycji AS ssp
ON p.kod_produktu = ssp.kod_produktu
GROUP BY p.nazwa_produktu
ORDER BY suma_pozycji
LIMIT 5);
