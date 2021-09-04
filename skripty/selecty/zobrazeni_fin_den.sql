SELECT F.id_fin_den_zam, S.nazov_akcie, S.akcia_dat, S.firmy_id, F.suma, F.typ_zaznamu, Fi.nazov_firmy 
FROM cms.fin_den_zam F
INNER JOIN cms.schvalene_vykazy S ON S.schvalene_vykazy_id = F.schvalene_vykazy_id
INNER JOIN cms.firmy Fi ON S.firmy_id = Fi.firmy_id
WHERE cislo_zamestnanca = 111;

--https://stackoverflow.com/questions/5808522/get-sum-of-mysql-column-in-php/5808565
SELECT SUM(F.suma) AS value_sum
            FROM fin_den_zam F
            WHERE cislo_zamestnanca = {$id_zamestnanca}
            AND typ_zaznamu = 'false';

UPDATE Customers
SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
WHERE CustomerID = 1;
