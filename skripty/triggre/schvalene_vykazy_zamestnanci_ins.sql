INSERT INTO schvalene_vykazy_zamestnanci
                (
                    schvalene_vykazy_zamestnanci_id,
                    schvalene_vykazy_id,
                    meno, 
                    priezvisko, 
                    cislo_zamestnanca_id, 
                    fixna_odmena,
                    fakturovana_suma,
                    cas_od,
                    cas_do,
                    pocet_hodin,
                    hod_noc,
                    hod_sobota,
                    hod_nedela,
                    hod_sviatok,
                    hod_sobota_noc,
                    hod_nedela_noc,
                    hod_sviatok_noc,
                    hod_sobota_sviatok,
                    hod_nedela_sviatok,
                    hod_sobota_sviatok_noc,
                    hod_nedela_sviatok_noc
                     ) 
         VALUES 
                (
                    NULL,
                    17,
                    "miro",
                    "savel",
                    111,
                    0,
                    0,
                    "2020-09-01 19:00:00",
                    "2020-09-02 04:00:00",
                    9.000,
                    6.000,
                    3.000,
                    0.000,
                    0.000,
                    3.000,
                    0.000,
                    0.000,
                    0.000,
                    0.000,
                    0.000,
                    0.000
                    ); 