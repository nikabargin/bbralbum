document.addEventListener("turbolinks:load", function() {

	// Navigation Slider
  function navSlide() {
    const filterButton = document.querySelector('#filterButton');
    const filterText = document.querySelector('#filterText');
    const filterIcon = document.querySelector('#filterIcon');
    const filterNav = document.querySelector('#filterNav');

    filterButton.addEventListener('click', () => {
      filterNav.classList.toggle('nav-active');
      $('body').toggleClass("hidden");

      if (filterText.innerHTML === "Фильтры") {
        filterText.innerHTML = "Посмотреть кожи";
      } else {
        filterText.innerHTML = "Фильтры";
      }
    });

  };
  
  if (($(window).width() < 1200) && ($("#filterButton")[0])) {
   	navSlide();
  }

	/* Toggle Video Modal
  -----------------------------------------*/
	function toggle_video_modal() {
    $(".js-trigger-video-modal").on("click", function(e){
        e.preventDefault();
        var id = $(this).attr('data-youtube-id');
        var autoplay = '?autoplay=1';
        var related_no = '&rel=0';
        var src = '//www.youtube.com/embed/'+id+autoplay+related_no;
        $("#youtube").attr('src', src);
        $("body").addClass("show-video-modal noscroll");
    
    });

    function close_video_modal() {
      event.preventDefault();
      $("body").removeClass("show-video-modal noscroll");
      $("#youtube").attr('src', '');
    }
	  
	  $('body').on('click', '.close-video-modal, .video-modal .overlay', function(event) {
     	close_video_modal();
	  });
      
    $('body').keyup(function(e) {
      if (e.keyCode == 27) { 
      	close_video_modal();
      }
    });
	}
	toggle_video_modal();

  AOS.init({
    offset: 0,
    duration: 1000,
    easing: 'ease-in-out',
    delay: 200,
    disable: 'mobile',
    once: 'false'
  });

});

document.addEventListener("turbolinks:load", function() {
  $(".selectpicker").selectpicker()
});

document.addEventListener("turbolinks:before-cache", function() {
  $('.selectpicker').selectpicker('destroy').addClass('selectpicker')
});

