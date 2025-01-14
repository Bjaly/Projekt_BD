WITH srednia_klientow AS (
SELECT k.imie,k.nazwisko,k.id, AVG(p.kwota) as srednia_klienta
FROM klienci AS k
INNER JOIN sprzedaze AS s
ON k.id = s.id_klienta
INNER JOIN platnosci AS p
ON s.id_platnosci  = p.id
GROUP BY k.imie,k.nazwisko)
SELECT  DISTINCT CONCAT(k.imie,' ', k.nazwisko) as "Imie i Nazwisko", 
CASE WHEN k.id = op.id_klienta THEN 'Tak'
	ELSE 'Nie' END AS "Czy opinia?",
((SELECT AVG(kwota) 
FROM platnosci) - srednia_klientow.srednia_klienta) AS roznica_miedzy_srednia
FROM klienci AS k
LEFT JOIN opinie AS op
ON k.id = op.id_klienta
INNER JOIN srednia_klientow
ON k.id  = srednia_klientow.id
;
