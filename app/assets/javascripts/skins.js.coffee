$(window).on 'scroll', ->
  if $('.pagination').length
    @url = $('.pagination .next_page').attr('href')
    if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
      $('.pagination').remove()
      $('#filterrific_results').append('<div class="container-fluid">')
      $('#filterrific_results div').last().load @url+' #filterrific_results', ->
          if $('.next_page.disabled').length
            $('.pagination').remove()