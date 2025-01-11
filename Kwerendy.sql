--Kwerenda grupuje zysk ze sprzedaży, najdroższy sprzedany element koszyka, czyli dany produkt pomnożony przez liczbę pozycji tego produktu w koszyku, najtańszy sprzedany element oraz średnią cenę elementów koszyka.
--Pogrupowane według mężczyzn oraz kobiet i metod płatności dla każdej płci. Dodatkowo liczy wartości tylko dla produktów o cenie zakupu pomiędzy 2 a 45zł i tylko dla elementów koszyka, w których liczba pozycji musi być równa jednej z 6 pierwszych liczb ciągu Fibonacciego. 
--Wartości są posortowane od najmniejszej sumy zysków ze sprzedaży ogółem.
CREATE VIEW podzial_plec_metoda_sprzedaz AS
SELECT tk.plec AS plec, 
	CONCAT(UPPER(SUBSTRING(tk.mp,1,1)), LOWER(SUBSTRING(tk.mp,2))) AS metoda_platnosci, 
	CONCAT(tk.zzso, ' zl') AS zysk_ze_sprzedazy_ogolem, 
	CONCAT(tk.hval, ' zl') AS najdrozszy_element_koszyka,
	CONCAT(tk.lval, ' zl') AS najtanszy_element_koszyka,
	CONCAT(tk.ap, ' zl' ) AS srednia_cena_elementow_koszyka
FROM (SELECT 'Mezczyzna' AS plec, 
	pl.metoda AS mp, 
	SUM(p.marza*ssp.liczba_pozycji) AS zzso, /*suma zysków ze sprzedaży*/
	MAX(p.cena_sprzedazy*ssp.liczba_pozycji) AS hval, /*najdroższy sprzedany element koszyka, czyli dany produkt pomnożony przez liczbę pozycji tego produktu w koszyku*/
	MIN(p.cena_sprzedazy*ssp.liczba_pozycji) AS lval, /*analogicznie dla najdroższy_element_koszyka*/
	ROUND(AVG(p.cena_sprzedazy*ssp.liczba_pozycji),2) AS ap /*średnia cena elementów koszyka*/
FROM szczegoly_sprzedanych_pozycji AS ssp
INNER JOIN produkty AS p
	ON ssp.kod_produktu = p.kod_produktu
INNER JOIN sprzedaze AS s
	ON ssp.id_sprzedazy = s.id
INNER JOIN klienci AS k
	ON s.id_klienta = k.id
INNER JOIN platnosci AS pl
	ON s.id_platnosci = pl.id
WHERE k.imie NOT LIKE '%a' AND (p.cena_zakupu BETWEEN 2 AND 45) AND ssp.liczba_pozycji IN(1,2,3,5,8,13)
GROUP BY plec, pl.metoda
UNION ALL /*Łączę wyniki dla mężczyzn i kobiet*/
SELECT 'Kobieta' AS plec, 
	pl.metoda AS mp, 
	SUM(p.marza*ssp.liczba_pozycji) AS zzso, /*suma zysków ze sprzedaży*/
	MAX(p.cena_sprzedazy*ssp.liczba_pozycji) AS hval, /*najdroższy sprzedany element koszyka, czyli dany produkt pomnożony przez liczbę pozycji tego produktu w koszyku*/
	MIN(p.cena_sprzedazy*ssp.liczba_pozycji) AS lval, /*analogicznie dla najdroższy_element_koszyka*/
	ROUND(AVG(p.cena_sprzedazy*ssp.liczba_pozycji),2) AS ap /*średnia cena elementów koszyka*/
FROM szczegoly_sprzedanych_pozycji AS ssp
INNER JOIN produkty AS p
	ON ssp.kod_produktu = p.kod_produktu
INNER JOIN sprzedaze AS s
	ON ssp.id_sprzedazy = s.id
INNER JOIN klienci AS k
	ON s.id_klienta = k.id
INNER JOIN platnosci AS pl
	ON s.id_platnosci = pl.id
WHERE k.imie LIKE '%a' AND (p.cena_zakupu BETWEEN 2 AND 45) AND ssp.liczba_pozycji IN(1,2,3,5,8,13)
GROUP BY plec, pl.metoda
ORDER BY zzso ASC) AS tk;
