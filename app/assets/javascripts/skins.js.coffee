$ ->
  if $('.pagination').length && $('#content-block').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 100
        $('.pagination').text("")
        $.getScript(url)
    $(window).scroll()