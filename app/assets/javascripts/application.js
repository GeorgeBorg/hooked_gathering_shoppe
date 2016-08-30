// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

/* ------------------------------------------------------------------------------------------------------------------------------------------------------
   Cover gif
------------------------------------------------------------------------------------------------------------------------------------------------------ */

setTimeout(function(){     
    $(".loader").fadeOut("slow");
    $(".topbar").fadeIn("slow");
    $('html, body').css({
        'overflow': 'auto',
        'height': 'auto'
    }) 
}, 3000);


/* ------------------------------------------------------------------------------------------------------------------------------------------------------
   Countdown
------------------------------------------------------------------------------------------------------------------------------------------------------ */
$(document).on('ready page:load', function () {
    $("#countdown").countdown("2016/12/16", function(event) {
        $(this).text(
          event.strftime('%D days %H:%M:%S')
        );
    });
});

/* ------------------------------------------------------------------------------------------------------------------------------------------------------
   Show/Hide Topbar nav using bars
------------------------------------------------------------------------------------------------------------------------------------------------------ */
$(document).on('ready page:load', function () {
    $(".topbar__menu").click(function(e) {
        $(".nav").toggle();
        if ($(".topbar__menu").hasClass("fa-hand-peace-o")) {
            $(".topbar__menu").removeClass("fa-hand-peace-o");
            $(".topbar__menu").addClass("fa-hand-scissors-o");
         } else {
            $(".topbar__menu").addClass("fa-hand-peace-o");
            $(".topbar__menu").removeClass("fa-hand-scissors-o");
         }
        e.stopPropagation();
    });

    $(document).click(function(e) {
        if (!$(e.target).is('.nav, .nav*')) {
            $(".nav").hide();
            $(".topbar__menu").addClass("fa-hand-peace-o");
            $(".topbar__menu").removeClass("fa-hand-scissors-o");
        }
    });


$("#countdown").countdown("2017/01/01", function(event) {
    $(this).text(
      event.strftime('%D days %H:%M:%S')
    );
});
});


/* ------------------------------------------------------------------------------------------------------------------------------------------------------
   Nav Scroll Function
------------------------------------------------------------------------------------------------------------------------------------------------------ */
$(document).on('ready page:load', function () {
      $(".home-link").click(function() {
        $('html,body').animate({
            scrollTop: $("#home").offset().top},
            2000,'easeOutQuart')
        });

      $(".news-link").click(function() {
        $('html,body').animate({
            scrollTop: $("#news").offset().top},
            2000,'easeOutQuart')
        });

      $(".lineup-link").click(function() {
        $('html,body').animate({
            scrollTop: $("#lineup").offset().top},
            2000,'easeOutQuart')
        });

      $(".info-link").click(function() {
        $('html,body').animate({
            scrollTop: $("#info").offset().top},
            2000,'easeOutQuart')
        });

      $(".ticket-link").click(function() {
        $('html,body').animate({
            scrollTop: $("#tickets").offset().top},
            2000,'easeOutQuart')
        });
});



/* ------------------------------------------------------------------------------------------------------------------------------------------------------
   Slider Initialize
------------------------------------------------------------------------------------------------------------------------------------------------------ */
$(document).on('ready page:load', function () {
    $('.guest-slider').slick({
      infinite: true,
      slidesPerRow: 4,
      rows: 2,
      responsive: [
          {
            breakpoint: 800,
            settings: {
              infinite: true,
              slidesPerRow: 3,
              rows: 2,
            }
          },
          {
            breakpoint: 600,
            settings: {
              infinite: true,
              slidesPerRow: 2,
              rows: 2,
            }
          },
          {
            breakpoint: 480,
            settings: {
              infinite: true,
              slidesPerRow: 1,
              rows: 2,
            }
          }
          // You can unslick at a given breakpoint now by adding:
          // settings: "unslick"
          // instead of a settings object
        ]
    });
});

$(document).on('ready page:load', function () {
    $('.sponsor-slider').slick({
      infinite: true,
      slidesToShow: 4,
      slidesToScroll: 4,
      autoplay: true,
      autoplaySpeed: 2000,
      arrows: false,
    });
});


/* --------------------------------------------------
   Hide Flash Messages
-------------------------------------------------- */

$(document).on('ready page:load', function () {
    $("#flash-notice").delay(1500).fadeOut(600);
    $(".flash").delay(1500).fadeOut(600);
});

/* ------------------------------------------------------------------------------------------------------------------------------------------------------
   Accordion
------------------------------------------------------------------------------------------------------------------------------------------------------ */   

  $( function() {
    $( "#accordion1" ).accordion({
        heightStyle: "content",
        collapsible: true,
        active: false,
    });
    $( "#accordion2" ).accordion({
        heightStyle: "content",
        active: false,
        collapsible: true
    });
    $( "#accordion3" ).accordion({
        heightStyle: "content",
        active: false,
        collapsible: true
    });
  } );