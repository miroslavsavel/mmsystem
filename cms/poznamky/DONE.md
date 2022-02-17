# 4.10.2021----------------

# tabula faktury_zamestnanci
- tu ulozim udaje o jednotlivych zamestnancoch - dokonci stlpce

# ulozenie faktury
inserty vo funkcii
-button ulozit fakturu -> nove dve tabulky faktura, faktura_zamestnanci
//

# MAkov
- tabula zemstnanci_faktury


# 20210921tabula faktury
- tu budu koef firmy a prepocitane celkove udaje


# ako si poslem $_REQUEST aby som vedel ze ktore fin_den_firmy_id
tie ktore si vybral potrebujem teraz poslat do 
- vyriesim to cez input hidden polia

# vytvorenie faktury podla danovej predlohy xlsx -> NAHLAD
- doplnit vsetky stlpce do selectu
- doplnit stlpec nazov akcie -> tahaj ju z tabulky schvalene vykazy
- doplnit tabulku sumar a rozpisane celkove hodiny
- doplnit tabulku koeficienty firmy

# save as pdf
- pozri poznamky generovaniepdf.md
-dnes dorob tabulu koef, urob sucetovu tabulku
-dnes urob export do pdf

# insert fin den firmy
-navrhni tabulku fin_den_firmy
-pridaj stlpec do tabule firmy pre koef kilometrov pre zamestnanca?

# do fin den firmy pridaj stlpce
akcia_dat DATE,
cislo_zamestnanca_id
--meno
--priezvisko
cas prace od 
cas prace do
pocet_hodin
hod_noc
hod_sobota
hod_nedela
hod_sviatok
hod_sobota_noc
hod_nedela_noc
hod_sviatok_noc
hod_nedela_sviatok
hod_sobota_sviatok_noc
hod_nedela_sviatok_noc
fixna odmena (pausalovy)
taxi_vlak_ine
km



Datum akcie vo formate date - aby sa dalo lahko zoradovat
aj hodiny sem dat? asi hej
dam tam rovno aj koeficienty pre danu firmu, lebo tie sa asi mozu menit v case
- zmenit trigger ins fin_den_firmy
- mysql alter table
https://www.mysqltutorial.org/mysql-add-column/
- urobim ale drop table a vytvorim novu tabulu
DROP TABLE fin_den_firmy;

# chyba alexander dubcek
sviatok 8 hod odrobil a ma tam 8e
ale mal mat 8*4 + 8 = 40

28.8 - 29.8 tabula fin_den_firmy, trigger insert fin den firmy

# Financny dennik firmy
show_firmy.php