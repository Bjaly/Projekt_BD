WITH srednia_klientow AS (
SELECT k.imie,k.nazwisko,k.id, AVG(p.kwota) as srednia
FROM klienci AS k
INNER JOIN sprzedaze AS s
ON k.id = s.id_klienta
INNER JOIN platnosci AS p
ON s.id_platnosci  = p.id
GROUP BY k.imie,k.nazwisko)
SELECT DISTINCT CONCAT(k.imie,' ', k.nazwisko) as "Imie i Nazwisko", 
CASE WHEN k.id = op.id_klienta THEN 'Tak'
	ELSE 'Nie' END AS "Czy opinia?",
CONCAT(FORMAT(srednia_klientow.srednia - (SELECT AVG(kwota) FROM platnosci), 2), " zł") AS "Różnica od  średniej"
FROM klienci AS k
LEFT JOIN opinie AS op
ON k.id = op.id_klienta
INNER JOIN srednia_klientow
ON k.id  = srednia_klientow.id
ORDER BY srednia_klientow.srednia - (SELECT AVG(kwota) FROM platnosci) DESC
;
