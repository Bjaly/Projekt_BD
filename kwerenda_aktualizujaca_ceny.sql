SELECT  nazwa_produktu,(cena_sprzedazy * 0.95) as cena_obnizona , cena_zakupu 
FROM produkty as p 
WHERE p.kod_produktu IN (
	SELECT kod_produktu
	FROM (
		SELECT p.kod_produktu
		FROM produkty AS p
		INNER JOIN szczegoly_sprzedanych_pozycji AS ssp
		ON p.kod_produktu = ssp.kod_produktu
		GROUP BY p.kod_produktu
		ORDER BY SUM(ssp.liczba_pozycji)
		LIMIT 10) AS subquery)
	AND (cena_sprzedazy * 0.95) > (cena_zakupu * 1.07); -- Sprawdzamy aby marża naszego produktu wynosiła conajmniej 7% 
