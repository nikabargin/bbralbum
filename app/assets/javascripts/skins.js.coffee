$ ->
  if $('.pagination').length && $('#filterrific_results').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("Загружаются кожи...")
        $.getScript(url)
    $(window).scroll()