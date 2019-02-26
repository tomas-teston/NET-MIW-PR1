$(document).ready(function () {
    
    $(".burger3").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
        $(this).toggleClass("on");
    });

    //Caso en el que se presiona el sliderbar.
    $('.slidebar a').click(function (event) {
       
        //Coloco el estado del sliderbar en no activo.
        $(".slidebar li").attr("id", "");

        //Coloco el estado del sliderbar (el que pulso) en modo activo.
        $(this).parent().attr("id", "active");
    });

});