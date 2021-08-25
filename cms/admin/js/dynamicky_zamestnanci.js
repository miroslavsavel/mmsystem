
//tento skript musi byt tu, externe nefunguje
//https://bootsnipp.com/snippets/AXVrV#comments
var room = 1;

function polia_zamestnanecX() {
    room++;
    var objTo = document.getElementById('vykaz')
    var divtest = document.createElement("div");
    divtest.setAttribute("class", "form-group removeclass" + room);
    var rdiv = 'removeclass' + room;
    divtest.innerHTML =
    '<div class="panel panel-default" id="vykaz">'+
        '<div class="panel-heading">'+
            'Zamestnanec č.' + room +
        '</div>'+
        '<div class="panel-body" id="polia_zamestnanec" >'+
            '<span class="form-group">'+
                '<p>'+
                    '<!-- Meno zamestnanca -->'+
                    '<label class="control-label " for="meno"> meno: </label>'+
                    '<input type="text" id="meno" name="meno[]" value="" placeholder="Meno">'+
                    '<!-- Priezvisko zamestnanca -->'+
                    '<label class="control-label " for="meno"> priezvisko: </label>'+
                    '<input type="text" id="priezvisko" name="priezvisko[]" value="" placeholder="Priezvisko">'+
                '</p>'+
            '</span>'+
            '<div class="form-group">'+
                '<!--  Fixna odmena -->'+
                '<p>'+
                    '<label class="control-label " for="fixna_odmena"> zapíš v eurách ak sa jedná o fix: </label>'+
                    '<input type="number" id="fixna_odmena" name="fixna_odmena[]" min="0" value="0" step="0.01" placeholder="fixna_odmena">'+
                    '<!--  Fakturovaná suma -->'+
                    '<label class="control-label " for="fakturovana_suma"> fakturovaná suma ak sa jedná o fix: </label>'+
                    '<input type="number" id="fakturovana_suma" name="fakturovana_suma[]" min="0" value="0" step="0.01" placeholder="fakturovana_suma">'+
                '</p>'+
            '</div>'+
            '<div class="form-group">'+
                '<p>'+
                    '<!--  cas od -->'+
                    '<label class="control-label " for="cas_od"> čas od: </label>'+
                    '<input type="text" id="cas_od" name="cas_od[]" value="" placeholder="DD.MM.YYYY hh:mm:ss">'+
                    '<!--  cas do -->'+
                    '<label class="control-label " for="cas_do"> čas do: </label>'+
                    '<input type="text" id="cas_do" name="cas_do[]" value="" placeholder="DD.MM.YYYY hh:mm:ss">'+
                    '<!--  pocet hodin -->'+
                    '<label class="control-label " for="pocet_hodin"> celkový počet hodín: </label>'+
                    '<input type="number" id="pocet_hodin" name="pocet_hodin[]" min="0" value="0" step="0.01" placeholder="pocet_hodin" style="width: 4em">'+
                '</p>'+
                '<p>'+
                    '<!--  noc -->'+
                    '<label class="control-label " for="hod_noc"> noc:</label>'+
                    '<input type="number" id="hod_noc" name="hod_noc[]" min="0" value="0" step="0.01" placeholder="hod_noc" style="width: 4em">'+
                    '<!--  sobota -->'+
                    '<label class="control-label " for="hod_noc"> sobota:</label>'+
                    '<input type="number" id="hod_sobota" name="hod_sobota[]" min="0" value="0" step="0.01" placeholder="hod_sobota" style="width: 4em">'+
                    '<!--  nedela -->'+
                    '<label class="control-label " for="hod_nedela"> nedela:</label>'+
                    '<input type="number" id="hod_nedela" name="hod_nedela[]" min="0" value="0" step="0.01" placeholder="hod_nedela" style="width: 4em">'+
                    '<!--  sviatok -->'+
                    '<label class="control-label " for="hod_sviatok"> sviatok:</label>'+
                    '<input type="number" id="hod_sviatok" name="hod_sviatok[]" min="0" value="0" step="0.01" placeholder="hod_sviatok" style="width: 4em">'+
                    '<!--  sobota_noc -->'+
                    '<label class="control-label " for="hod_sobota_noc"> sobota noc:</label>'+
                    '<input type="number" id="hod_sobota_noc" name="hod_sobota_noc[]" min="0" value="0" step="0.01" placeholder="hod_sobota_noc" style="width: 4em">'+
                    '<!--  nedela_noc -->'+
                    '<label class="control-label " for="hod_nedela_noc"> nedela noc:</label>'+
                    '<input type="number" id="hod_nedela_noc" name="hod_nedela_noc[]" min="0" value="0" step="0.01" placeholder="hod_nedela_noc" style="width: 4em">'+
                    '<!--  sviatok_noc -->'+
                    '<label class="control-label " for="hod_sviatok_noc"> sviatok noc:</label>'+
                    '<input type="number" id="hod_sviatok_noc" name="hod_sviatok_noc[]" min="0" value="0" step="0.01" placeholder="hod_sviatok_noc" style="width: 4em">'+
                    '<!--  sobota_sviatok -->'+
                    '<label class="control-label " for="hod_sobota_sviatok"> sobota sviatok:</label>'+
                    '<input type="number" id="hod_sobota_sviatok" name="hod_sobota_sviatok[]" min="0" value="0" step="0.01" placeholder="hod_sobota_sviatok" style="width: 4em">'+
                    '<!--  nedela_sviatok -->'+
                    '<label class="control-label " for="hod_nedela_sviatok"> nedela sviatok:</label>'+
                    '<input type="number" id="hod_nedela_sviatok" name="hod_nedela_sviatok[]" min="0" value="0" step="0.01" placeholder="hod_nedela_sviatok" style="width: 4em">'+
                    '<!--  sobota_sviatok_noc -->'+
                    '<label class="control-label " for="hod_sobota_sviatok_noc"> sobota sviatok noc:</label>'+
                    '<input type="number" id="hod_sobota_sviatok_noc" name="hod_sobota_sviatok_noc[]" min="0" value="0" step="0.01" placeholder="hod_sobota_sviatok_noc" style="width: 4em">'+
                    '<!--  nedela_sviatok_noc -->'+
                    '<label class="control-label " for="hod_nedela_sviatok_noc"> nedela sviatok noc:</label>'+
                    '<input type="number" id="hod_nedela_sviatok_noc" name="hod_nedela_sviatok_noc[]" min="0" value="0" step="0.01" placeholder="hod_nedela_sviatok_noc" style="width: 4em">'+
                '</p>'+
            '</div>'+
            '<button class="btn btn-danger" type="button" onclick="remove_polia_zamestnanec(' + room + ');">' +
        '</div>'+
    '</div>';


    //objTo.appendChild(divtest)
    document.getElementById("vykaz").appendChild(divtest);
}

function remove_polia_zamestnanec(rid) {
    $('.removeclass' + rid).remove();
}
 
function remove_polia_zamestnanec1() {
    var objTo = document.getElementById('polia_zamestnanec')
    $(objTo).remove();
}


