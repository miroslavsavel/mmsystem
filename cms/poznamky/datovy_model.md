# triggre pre vlozenie do fin_den_zam a fin_den_firmy
najdes vo workbenchi pod tabulkou schvalene_vykazy_zamestnanci


# wait_vykazy------------------------------------------
tu je ulozeny vykaz cakajuci na schvalenie

wait_vykazy_id
nazov_akcie
akcia_dat
firmy_id
ine_naklady

# wait_zamestnanci------------------------------------------
id_fin_den_zam
cislo_zamestnanca
schvalene_vykazy_id
meno
priezvisko
suma
typ_zaznamu
dat_ins

# accounts
tu su ulozene prihlasovacie udaje do systemu

# fin_den_zam
tu vklada trigger spusteny po inserte do schvalene_vykazy_zamestnanci

# fin_den_firmy
tu vklada trigger spusteny po inserte do schvalene_vykazy_zamestnanci
jednotlive faktury? pre firmy