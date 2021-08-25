 <!-- Dynamicke pridavanie zamestnancov -->
 <script>
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
             '<button class="btn btn-danger" type="button" onclick="remove_polia_zamestnanec(' + room + ');">' +
             '</div></div>' +
             '</button><div class="clear"></div>' +
             '</div>';

         objTo.appendChild(divtest)
     }

     function remove_polia_zamestnanec(rid) {
         $('.removeclass' + rid).remove();
     }
 </script>


 <div class="panel panel-default">
     <div class="panel-heading">Pridať zamestnancov zúčastnených na pracovnej akcii</div>
     <div class="panel-body">
         <div id="polia_zamestnanec">
         </div>
         <!-- ID_zamestnanca -->
         <div class="col-sm-3 nopadding">
             <div class="form-group">
                 <label class="control-label " for="ID zamestnanca"> ID zamestnanca </label>
                 <input type="text" class="form-control" id="ID zamestnanca" name="id_zamestnanca[]" value="" placeholder="ID zamestnanca">
             </div>
         </div>
         <div class="panel-footer"><small>Pridať <span class="glyphicon glyphicon-plus gs"></span></small>,
             <small>Odstrániť <span class="glyphicon glyphicon-minus gs"></span></small>
        </div>
     </div>
    </div>