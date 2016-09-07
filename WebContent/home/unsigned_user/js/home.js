/* author : AmirH Qasemi <amirghasemi1375@gmail.com> */

/**
 *  This file needs following in order to function:
 *      1-JQuery
 */

 $(function(){


   var isSignInPanelOpen = false;
   var isRegisPanelOpen = false;

   $("#signin-button").on("click", function(){
     if(isRegisPanelOpen){
       $("#registration-panel").animate({
               height: 'toggle'
           });
           isRegisPanelOpen = false;
     }


     if(!isSignInPanelOpen){
       $("#signin-panel").animate({
               height: 'toggle'
           });
           isSignInPanelOpen = true;
     } else{
       $("#signin-panel").animate({
               height: 'toggle'
           });
           isSignInPanelOpen = false;
     }

   });

   $("#registration-button").on("click", function(){
     if(isSignInPanelOpen){
       $("#signin-panel").animate({
               height: 'toggle'
           });
           console.log("signin-panel Closing");
           isSignInPanelOpen = false;
     }

     if(!isRegisPanelOpen){
       $("#registration-panel").animate({
               height: 'toggle'
           });
           isRegisPanelOpen = true;
     } else {
       $("#registration-panel").animate({
               height: 'toggle'
           });
           isRegisPanelOpen =false;
     }
   });

   // Highlight the top nav as scrolling occurs
    $('body').scrollspy({
        target: '.navbar-fixed-top',
        offset: 51
    });


    //The scroll listener
    $(window).scroll(
        {
          previousTop: 0, //This part is to figure out wether we are scrolling down or up
          isNavbarTransparent: true,
          isNavbarLarge: true
        },
        function () {

          //Making the elements apear with animation.
          $(".slideanim").each(function(){
              var pos = $(this).offset().top;

              var winTop = $(window).scrollTop();
              if (pos < winTop + 600) {
                $(this).addClass("slide");
              }
            });

          var currentTop = $(window).scrollTop();

          //If the page top is around topmost part of the scrolling section then make the nav a liitle bit larger. Else, make them smaller.
          if(currentTop <= 70){
              if(this.isNavbarLarge === undefined || !this.isNavbarLarge){
                $(".navbar .navbar-header a").addClass("custom-navbar-header-lg", 500);
                $(".navbar ul li").addClass("custom-navbar-item-lg", 500);

                this.isNavbarLarge = true;
              }
          } else{
            if(this.isNavbarLarge === undefined || this.isNavbarLarge){
              $(".navbar .navbar-header a").removeClass("custom-navbar-header-lg" , 500);
              $(".navbar li").removeClass("custom-navbar-item-lg" , 500);

              this.isNavbarLarge = false;
            }
          }


          //If the page top has lefted the header, opaque the navbar. Else, make it transparent.
          if(currentTop >= 700){
            if(this.isNavbarTransparent === undefined || this.isNavbarTransparent){
              $("nav").removeClass("navbar-custom-transparent");
              $("nav").addClass("navbar-custome-opaque");

              this.isNavbarTransparent = false;
            }
          } else {
            if(this.isNavbarTransparent === undefined || !this.isNavbarTransparent){
              $("nav").removeClass("navbar-custome-opaque");
              $("nav").addClass("navbar-custom-transparent");

              this.isNavbarTransparent = true;
            }
          }


          //if we are scrolling up
          if (currentTop < this.previousTop) {

          } else { //if we are scrolling down

          }
          this.previousTop = currentTop;
        }
    );
    //end of scroll listener


    //Triggering the scroll event to adjust the styles dependent to the place of the scrollbar.
    $(window).scroll();

    // Add smooth scrolling to all links in navbar + footer link
    $(".navbar a, footer a[href='#index']").on('click', function(event) {

      // Make sure this.hash has a value before overriding default behavior
      if (this.hash !== "") {

        // Prevent default anchor click behavior
        event.preventDefault();

        // Store hash
        var hash = this.hash;

        // Using jQuery's animate() method to add smooth page scroll
        // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
        $('html, body').animate({
          scrollTop: $(hash).offset().top
        }, 900, function(){

          // Add hash (#) to URL when done scrolling (default click behavior)
          window.location.hash = hash;
        });
      } // End if
    });
    //End of smooth scrolling



    //The Map
    var myCenter = new google.maps.LatLng(36.6830045,48.5087209);

    function initialize() {
      var mapProp = {
        center:myCenter,
        zoom:12,
        scrollwheel:false,
        draggable:false,
        mapTypeId:google.maps.MapTypeId.ROADMAP
      };

      var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);

      var marker = new google.maps.Marker({
        position:myCenter,
      });

      marker.setMap(map);
    }

    google.maps.event.addDomListener(window, 'load', initialize);
    //End of Map

    // Initialize Tooltip
    $('[data-toggle="tooltip"]').tooltip();

});
