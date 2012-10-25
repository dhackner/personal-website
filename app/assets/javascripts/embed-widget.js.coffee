$ ->
  round = (num, dec=2) -> Math.round(num*Math.pow(10,dec))/Math.pow(10,dec)
  $.getScript('http://www.google.com/jsapi?key=ABQIAAAAdCqYebvklTBR0pZ61UFVoxQCULP4XOMyhPd8d_NrQQEO8sT8XBSWz-7GSxc5IvqTv62PoFCHY2tyyQ')
    .done (script, textStatus) ->
      if google.loader.ClientLocation is null
        srcStr = "&client_geo_failed=1"
      else
        srcStr = "&lat=" + round(google.loader.ClientLocation.latitude)
        srcStr += "&lon=" + round(google.loader.ClientLocation.longitude)
      $('body').append srcStr


