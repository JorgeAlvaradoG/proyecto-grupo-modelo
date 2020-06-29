/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    $('#submit').click(function (event) {
        var nombreVar = $('#nombre').val();
        var apellidoVar = $('#apellido').val();
        var edadVar = $('#edad').val();
        // Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
        $.get('controlador.do', {
            nombre: nombreVar,
            apellido: apellidoVar,
            edad: edadVar
        }, function (responseText) {
            $('#tabla').html(responseText);
        });
    });
});

