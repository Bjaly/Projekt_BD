UPDATE produkty
SET cena_sprzedazy = cena_sprzedazy * 0.95,
	marza = (cena_sprzedazy * 0.95) - cena_zakupu

FROM produkty as p 
WHERE p.kod_produktu IN (
SELECT kod_produktu 
FROM (					 -- Subquery zwraca 10 najgorzej sprzedawanych produtków pod względem wolumenu sprzedaży
	SELECT p.kod_produktu
	FROM produkty AS p
	INNER JOIN szczegoly_sprzedanych_pozycji AS ssp
	ON p.kod_produktu = ssp.kod_produktu
	GROUP BY p.kod_produktu
	ORDER BY SUM(ssp.liczba_pozycji) ASC
	LIMIT 10) AS subquery)
AND (cena_sprzedazy * 0.95) > (cena_zakupu * 1.09); -- Sprawdzamy aby marża naszego produktu wynosiła conajmniej 9% 
