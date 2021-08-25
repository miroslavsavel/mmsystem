
//tento skript musi byt tu, externe nefunguje
//https://bootsnipp.com/snippets/AXVrV#comments
var room = 1;

function polia_zamestnanec() {
    room++;
    var objTo = document.getElementById('polia_zamestnanec')
    var divtest = document.createElement("div");
    divtest.setAttribute("class", "form-group removeclass" + room);
    var rdiv = 'removeclass' + room;
    divtest.innerHTML =
        '<div class="panel-body">' +
        '<div class="col-sm-3 nopadding">' +
        '<div class="form-group">' +
        '<label class="control-label " for="ID zamestnanca"> ID zamestnanca </label>' +
        '<input type="text" class="form-control" id="id_zamestnanca" name="id_zamestnanca[]" value="" placeholder="ID zamestnanca">' +
        '</div></div>' +

        '<div class="col-sm-3 nopadding">' +
        '<div class="form-group">' +
        '<label class="control-label " for="fixna_odmena"> Zapíš v eurách ak sa jedná o fix </label>' +
        '<input type="number" class="form-control" id="fixna_odmena" name="fixna_odmena[]" min="0" value="0" step="0.01" placeholder="fixna_odmena">' +
        '</div>' +
        '</div>' +

        '<div class="col-sm-3 nopadding">' +
        '<div class="form-group">' +
        '<label class="control-label " for="fakturovana_suma"> Fakturovaná suma ak sa jedná o fix</label>' +
        '<input type="number" class="form-control" id="fakturovana_suma" name="fakturovana_suma[]" min="0" value="0" step="0.01" placeholder="fakturovana_suma">' +
        '</div>' +
        '</div>' +

        '<div class="col-sm-3 nopadding">' +
        '<div class="form-group">' +
        '<label class="control-label " for="cas_od"> čas od </label>' +
        '<input type="text" class="form-control" id="cas_od" name="cas_od[]" value="" placeholder="DD.MM.YYYY hh:mm:ss">' +
        '</div></div>' +

        '<div class="col-sm-3 nopadding">' +
        '<div class="form-group">' +
        '<label class="control-label " for="cas_do"> čas do </label>' +
        '<input type="text" class="form-control" id="cas_do" name="cas_do[]" value="" placeholder="DD.MM.YYYY hh:mm:ss">' +
        '</div></div>' +

        '<div class="col-sm-3 nopadding">' +
        '<div class="form-group">' +
        '<label class="control-label " for="pocet_hodin"> počet hodín </label>' +
        '<input type="number" class="form-control" id="pocet_hodin" name="pocet_hodin[]" min="0" value="0" step="0.01" placeholder="pocet_hodin">' +
        '</div>' +
        '</div>' +

        '<div class="col-sm-3 nopadding">' +
        '<div class="form-group">' +
        '<label class="control-label " for="hod_noc"> hodiny cez noc </label>' +
        '<input type="number" class="form-control" id="hod_noc" name="hod_noc[]" min="0" value="0" step="0.01" placeholder="hod_noc">' +
        '</div>' +
        '</div>' +

        '<div class="col-sm-3 nopadding">' +
        '<div class="form-group">' +
        '<label class="control-label " for="hod_sobota"> hodiny sobota </label>' +
        '<input type="number" class="form-control" id="hod_sobota" name="hod_sobota[]" min="0" value="0" step="0.01" placeholder="hod_sobota">' +
        '</div>' +
        '</div>' +

        '<div class="col-sm-3 nopadding">' +
        '<div class="form-group">' +
        '<label class="control-label " for="hod_nedela"> hodiny nedela </label>' +
        '<input type="number" class="form-control" id="hod_nedela" name="hod_nedela[]" min="0" value="0" step="0.01" placeholder="hod_nedela">' +
        '</div>' +
        '</div>' +

        '<div class="col-sm-3 nopadding">' +
        '<div class="form-group">' +
        '<label class="control-label " for="hod_sviatok"> hodiny sviatok </label>' +
        '<input type="number" class="form-control" id="hod_sviatok" name="hod_sviatok[]" min="0" value="0" step="0.01" placeholder="hod_sviatok">' +
        '</div>' +
        '</div>' +

        '<div class="col-sm-3 nopadding">' +
        '<div class="form-group">' +
        '<label class="control-label " for="hod_sobota_noc"> hodiny sobota noc </label>' +
        '<input type="number" class="form-control" id="hod_sobota_noc" name="hod_sobota_noc[]" min="0" value="0" step="0.01" placeholder="hod_sobota_noc">' +
        '</div>' +
        '</div>' +

        '<div class="col-sm-3 nopadding">' +
        '<div class="form-group">' +
        '<label class="control-label " for="hod_nedela_noc"> hodiny nedela noc </label>' +
        '<input type="number" class="form-control" id="hod_nedela_noc" name="hod_nedela_noc[]" min="0" value="0" step="0.01" placeholder="hod_nedela_noc">' +
        '</div>' +
        '</div>' +

        '<div class="col-sm-3 nopadding">' +
        '<div class="form-group">' +
        '<label class="control-label " for="hod_sviatok_noc"> hodiny sviatok noc </label>' +
        '<input type="number" class="form-control" id="hod_sviatok_noc" name="hod_sviatok_noc[]" min="0" value="0" step="0.01" placeholder="hod_sviatok_noc">' +
        '</div>' +
        '</div>' +

        '<div class="col-sm-3 nopadding">' +
        '<div class="form-group">' +
        '<label class="control-label " for="hod_sobota_sviatok"> hodiny sobota sviatok </label>' +
        '<input type="number" class="form-control" id="hod_sobota_sviatok" name="hod_sobota_sviatok[]" min="0" value="0" step="0.01" placeholder="hod_sobota_sviatok">' +
        '</div>' +
        '</div>' +

        '<div class="col-sm-3 nopadding">' +
        '<div class="form-group">' +
        '<label class="control-label " for="hod_nedela_sviatok"> hodiny nedela sviatok </label>' +
        '<input type="number" class="form-control" id="hod_nedela_sviatok" name="hod_nedela_sviatok[]" min="0" value="0" step="0.01" placeholder="hod_nedela_sviatok">' +
        '</div>' +
        '</div>' +

        '<div class="col-sm-3 nopadding">' +
        '<div class="form-group">' +
        '<label class="control-label " for="hod_sobota_sviatok_noc"> hodiny sobota sviatok noc </label>' +
        '<input type="number" class="form-control" id="hod_sobota_sviatok_noc" name="hod_sobota_sviatok_noc[]" min="0" value="0" step="0.01" placeholder="hod_sobota_sviatok_noc">' +
        '</div>' +
        '</div>' +

        '<div class="col-sm-3 nopadding">' +
        '<div class="form-group">' +
        '<label class="control-label " for="hod_nedela_sviatok_noc"> hodiny nedela sviatok noc </label>' +
        '<input type="number" class="form-control" id="hod_nedela_sviatok_noc" name="hod_nedela_sviatok_noc[]" min="0" value="0" step="0.01" placeholder="hod_nedela_sviatok_noc">' +
        '</div>' +
        '</div>' +



        '<div class="col-sm-3 nopadding">' +
        '<div class="form-group">' +
        '<button class="btn btn-danger" type="button" onclick="remove_polia_zamestnanec(' + room + ');">' +
        '</div></div>' +
        '</button><div class="clear"></div>' +
        '</div>';

    objTo.appendChild(divtest)
}

function remove_polia_zamestnanec(rid) {
    $('.removeclass' + rid).remove();
}
 
function remove_polia_zamestnanec1() {
    var objTo = document.getElementById('polia_zamestnanec')
    $(objTo).remove();
}