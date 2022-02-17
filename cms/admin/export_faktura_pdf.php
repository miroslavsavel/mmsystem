<?php 
    include "includes/admin_header.php";
    // Include mpdf library file
    require_once __DIR__ . '/vendor/autoload.php';
    //$mpdf = new \Mpdf\Mpdf();
    //landscape orientacia
    //https://mpdf.github.io/paging/page-size-orientation.html
    $mpdf = new \Mpdf\Mpdf(['orientation' => 'L']);
    
    // Database Connection 
    $conn = new mysqli('127.0.0.1', 'root', '', 'cms');
    //Check for connection error
    if($conn->connect_error){
        die("Error in DB connection: ".$conn->connect_errno." : ".$conn->connect_error);    
    }
    // id_faktury je ulozene v $_GET['detail']
    $id_faktury = $_GET['detail'];

    //Vyberiem si firmy_id
    $query_faktury = "SELECT firmy_id, zakl_taxa, praca_noc, praca_sob, praca_ned, praca_svia, praca_sob_noc,
                                praca_ned_noc, praca_svia_noc, praca_sob_svia, praca_ned_svia, praca_sob_svia_noc, praca_ned_svia_noc,
                                 sum_pocet_hod, sum_noc, sum_sob, sum_ned, sum_svia, sum_sob_noc, sum_ned_noc, sum_svia_noc, sum_sob_svia,
                                 sum_ned_svia, sum_sob_svia_noc, sum_ned_svia_noc, sum_pocet_km, sum_pausal, sum_taxi_vlak_ine,
                                 eur_hod_celkom, eur_pausal, eur_bez_dph, eur_dph, eur_s_dph
                        FROM `faktury` WHERE id_faktury = {$id_faktury}";
    $select_faktury = mysqli_query($connection, $query_faktury);
    while($row = mysqli_fetch_assoc($select_faktury))
    {
        $firmy_id = $row['firmy_id'];
        $bezna_taxa = $row['zakl_taxa'];
        $praca_noc = $row['praca_noc'];
        $praca_sob = $row['praca_sob'];
        $praca_ned = $row['praca_ned'];
        $praca_svia = $row['praca_svia'];
        $praca_sob_noc = $row['praca_sob_noc'];
        $praca_ned_noc = $row['praca_ned_noc'];
        $praca_svia_noc = $row['praca_svia_noc'];
        $praca_sob_svia = $row['praca_sob_svia'];
        $praca_ned_svia = $row['praca_ned_svia'];
        $praca_sob_svia_noc = $row['praca_sob_svia_noc'];
        $praca_ned_svia_noc = $row['praca_ned_svia_noc'];

        $sum_pocet_hod = $row['sum_pocet_hod'];
        $sum_noc = $row['sum_noc'];
        $sum_sob = $row['sum_sob'];
        $sum_ned = $row['sum_ned'];
        $sum_svia = $row['sum_svia'];
        $sum_sob_noc = $row['sum_sob_noc'];
        $sum_ned_noc = $row['sum_ned_noc'];
        $sum_svia_noc = $row['sum_svia_noc'];
        $sum_sob_svia = $row['sum_sob_svia'];
        $sum_ned_svia = $row['sum_ned_svia'];
        $sum_sob_svia_noc = $row['sum_sob_svia_noc'];
        $sum_ned_svia_noc = $row['sum_ned_svia_noc'];
        $sum_pocet_km = $row['sum_pocet_km'];
        $sum_pausal = $row['sum_pausal'];
        $sum_taxi_vlak_ine = $row['sum_taxi_vlak_ine'];
        $eur_hod_celkom = $row['eur_hod_celkom'];
        $eur_pausal = $row['eur_pausal'];
        $eur_bez_dph = $row['eur_bez_dph'];
        $eur_dph = $row['eur_dph'];
        $eur_s_dph = $row['eur_s_dph'];
    }
    //Vyberiem si nazov firmy
    $query_nazov_firmy = "SELECT nazov_firmy FROM `firmy` WHERE firmy_id = {$firmy_id}"; 
    $select_nazov_firmy = mysqli_query($connection, $query_nazov_firmy);
    while($row = mysqli_fetch_assoc($select_nazov_firmy))
    {
        $nazov_firmy = $row['nazov_firmy'];
    }
    //Vyberiem si data z tabulky faktury - mam uz v prvom selecte
    
    //Vyberiem si data z tabulky faktury_zamestnanci
    $select_faktury_zamestnanci = "SELECT DATE(cas_od) as datum_akcie, nazov_akcie, meno, priezvisko,
                                    cas_od, cas_do, pocet_hodin, hod_noc, hod_sob, hod_ned, hod_svia,
                                    hod_sob_noc, hod_ned_noc, hod_svia_noc, hod_sob_svia, hod_ned_svia,
                                    hod_sob_svia_noc, hod_ned_svia_noc, km, pausal, taxi_vlak_ine
                                     FROM `faktury_zamestnanci` WHERE id_faktury = {$id_faktury}";
    $result = $conn->query($select_faktury_zamestnanci);
    $data_faktury_zamestnanci = array();
    while($row = $result->fetch_object()){
        $data_faktury_zamestnanci .= '<tr>'
            .'<td>'.$row->datum_akcie.'</td>'
            .'<td>'.$row->nazov_akcie.'</td>'
            .'<td>'.$row->meno.'</td>'
            .'<td>'.$row->priezvisko.'</td>'
            .'<td>'.$row->cas_od.'</td>'
            .'<td>'.$row->cas_do.'</td>'
            .'<td>'.$row->pocet_hodin.'</td>'
            .'<td>'.$row->hod_noc.'</td>'
            .'<td>'.$row->hod_sob.'</td>'
            .'<td>'.$row->hod_ned.'</td>'
            .'<td>'.$row->hod_svia.'</td>'
            .'<td>'.$row->hod_sob_noc.'</td>'
            .'<td>'.$row->hod_ned_noc.'</td>'
            .'<td>'.$row->hod_svia_noc.'</td>'
            .'<td>'.$row->hod_sob_svia.'</td>'
            .'<td>'.$row->hod_ned_svia.'</td>'
            .'<td>'.$row->hod_sob_svia_noc.'</td>'
            .'<td>'.$row->hod_ned_svia_noc.'</td>'
            .'<td>'.$row->km.'</td>'
            .'<td>'.$row->pausal.'</td>'
            .'<td>'.$row->taxi_vlak_ine.'</td></tr>';
    }



    //viem pouzit aj css?

    // Select data from MySQL database
    $select = "SELECT nazov_firmy, ico, dic FROM `firmy`";
    $result = $conn->query($select);
    $data = array();
    while($row = $result->fetch_object()){
        $data .= '<tr>'
            .'<td>'.$row->nazov_firmy.'</td>'
            .'<td>'.$row->ico.'</td>'
            .'<td>'.$row->dic.'</td></tr>';
    }
    
    $pdfcontent = '<h1 class="page-header">Hodinová taxa a príplatky pre firmu: '.$nazov_firmy.'</h1>';
    $pdfcontent = $pdfcontent . '<p class="fs-6">'.
                                    "Štandardná taxa: " . $bezna_taxa . " eur/hod"."<br>".
                                    "Práca v noci: " . $praca_noc . " eur/hod"."<br>".
                                    "Práca v sobotu: " . $praca_sob . " eur/hod"."<br>".
                                    "Práca v nedeľu: " . $praca_ned . " eur/hod"."<br>".
                                    "Práca cez sviatok: " . $praca_svia . " eur/hod"."<br>".
                                    "Práca v sobotu v noci: " . $praca_sob_noc . " eur/hod"."<br>".
                                    "Práca v nedeľu v noci: " . $praca_ned_noc . " eur/hod"."<br>".
                                    "Práca cez sviatok v noci: " . $praca_svia_noc . " eur/hod"."<br>".
                                    "Práca v sobotu cez sviatok: " . $praca_sob_svia . " eur/hod"."<br>".
                                    "Práca v nedeľu cez sviatok: " . $praca_ned_svia . " eur/hod"."<br>".
                                    "Práca v sobotu cez sviatok v noci: " . $praca_sob_svia_noc . " eur/hod"."<br>".
                                    "Práca v nedeľu cez sviatok v noci: " . $praca_ned_svia_noc . " eur/hod"."<br>".
                                '</p>';
    $pdfcontent = $pdfcontent.'<h1>Prehľad za jednotlivých pracovníkov</h1>
                                <table autosize="1">
                                <tr>
                                <td style="width: 33%"><strong>Dátum akcie</strong></td>
                                <td style="width: 36%"><strong>Názov akcie</strong></td>
                                <td style="width: 30%"><strong>Meno</strong></td>
                                <td style="width: 30%"><strong>Priezvisko</strong></td>
                                <td style="width: 30%"><strong>Čas od</strong></td>
                                <td style="width: 30%"><strong>Čas do</strong></td>
                                <td style="width: 30%"><strong>Počet hodín</strong></td>
                                <td style="width: 30%"><strong>Noc</strong></td>
                                <td style="width: 30%"><strong>Sobota</strong></td>
                                <td style="width: 30%"><strong>Nedeľa</strong></td>
                                <td style="width: 30%"><strong>Sviatok</strong></td>
                                <td style="width: 30%"><strong>Sobota v noci</strong></td>
                                <td style="width: 30%"><strong>Nedeľa v noci</strong></td>
                                <td style="width: 30%"><strong>Sviatok v noci</strong></td>
                                <td style="width: 30%"><strong>Sobota cez sviatok</strong></td>
                                <td style="width: 30%"><strong>Nedeľa cez sviatok</strong></td>
                                <td style="width: 30%"><strong>Sobota cez sviatok v noci</strong></td>
                                <td style="width: 30%"><strong>Nedeľa cez sviatok v noci</strong></td>
                                <td style="width: 30%"><strong>Km</strong></td>
                                <td style="width: 30%"><strong>Paušál</strong></td>
                                <td style="width: 30%"><strong>Taxi-vlak-iné</strong></td>
                                </tr>
                                '.$data_faktury_zamestnanci.'
                                </table>';

    $pdfcontent = $pdfcontent.'<h1>Celkový sumár</h1>
                                <table autosize="1">
                                <tr>
                                <td style="width: 33%"><strong>Celkový počet hodín</strong></td>
                                <td style="width: 30%"><strong>Noc</strong></td>
                                <td style="width: 30%"><strong>Sobota</strong></td>
                                <td style="width: 30%"><strong>Nedeľa</strong></td>
                                <td style="width: 30%"><strong>Sviatok</strong></td>
                                <td style="width: 30%"><strong>Sobota v noci</strong></td>
                                <td style="width: 30%"><strong>Nedeľa v noci</strong></td>
                                <td style="width: 30%"><strong>Sviatok v noci</strong></td>
                                <td style="width: 30%"><strong>Sobota cez sviatok</strong></td>
                                <td style="width: 30%"><strong>Nedeľa cez sviatok</strong></td>
                                <td style="width: 30%"><strong>Sobota cez sviatok v noci</strong></td>
                                <td style="width: 30%"><strong>Nedeľa cez sviatok v noci</strong></td>
                                <td style="width: 30%"><strong>Celkový počet najazdených km</strong></td>
                                <td style="width: 30%"><strong>Paušál spolu</strong></td>
                                <td style="width: 30%"><strong>Taxi-vlak-iné</strong></td>
                                </tr>
                                <tr>'.
                                    '<td>'.$sum_pocet_hod.'</td>'.
                                    '<td>'.$sum_noc.'</td>'.
                                    '<td>'.$sum_sob.'</td>'.
                                    '<td>'.$sum_ned.'</td>'.
                                    '<td>'.$sum_svia.'</td>'.
                                    '<td>'.$sum_sob_noc.'</td>'.
                                    '<td>'.$sum_ned_noc.'</td>'.
                                    '<td>'.$sum_svia_noc.'</td>'.
                                    '<td>'.$sum_sob_svia.'</td>'.
                                    '<td>'.$sum_ned_svia.'</td>'.
                                    '<td>'.$sum_sob_svia_noc .'</td>'.
                                    '<td>'.$sum_ned_svia_noc.'</td>'.
                                    '<td>'.$sum_pocet_km.'</td>'.
                                    '<td>'.$sum_pausal.'</td>'.
                                    '<td>'.$sum_taxi_vlak_ine.'</td>'.
                                '</tr>'
                                .'</table>';


    // Eura suma
    //https://www.codegrepper.com/code-examples/php/divide+page+in+pdf+with+page+break+using+php
    //https://css-tricks.com/almanac/properties/p/page-break/
    $pdfcontent = $pdfcontent.'<div style="page-break-before: always;">'.
                                    '<h1>Výsledná fakturovaná suma</h1>'.
                                    '<p>'. '<strong>'.
                                    "Za hodiny celkom: " . $eur_hod_celkom . " eur"."<br>".
                                    "Za paušál celkom: " . $eur_pausal . " eur"."<br>".
                                    "Suma bez DPH: " . $eur_bez_dph . " eur"."<br>".
                                    "DPH: " . $eur_dph . " eur"."<br>".
                                    "Suma s DPH: " . $eur_s_dph . " eur"."<br>".
                                    '</strong>'.'</p>'.
                                '</div>';

    $mpdf->WriteHTML($pdfcontent);

    $mpdf->SetDisplayMode('fullpage');
    $mpdf->list_indent_first_level = 0; 

    //call watermark content and image
    // $mpdf->SetWatermarkText('etutorialspoint');
    // $mpdf->showWatermarkText = true;
    // $mpdf->watermarkTextAlpha = 0.1;

    //output in browser
    $mpdf->Output();		
?>