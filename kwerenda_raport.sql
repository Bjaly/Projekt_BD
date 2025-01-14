SELECT  DISTINCT CONCAT(k.imie,' ', k.nazwisko) as "Imie i Nazwisko",
CASE WHEN k.id = op.id_klienta THEN 'Tak'
ELSE 'Nie' END AS "Czy opinia?"
FROM klienci AS k
LEFT JOIN opinie AS op
ON k.id = op.id_klienta; 

