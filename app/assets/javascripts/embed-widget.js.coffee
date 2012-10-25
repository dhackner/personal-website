roundNumber = (num, dec=2) ->
  result = Math.round(num * Math.pow(10, dec)) / Math.pow(10, dec)

populate_geo = (widget) ->
  $.getScript "http://www.google.com/jsapi?key=ABQIAAAAdCqYebvklTBR0pZ61UFVoxQCULP4XOMyhPd8d_NrQQEO8sT8XBSWz-7GSxc5IvqTv62PoFCHY2tyyQ", ->
    if google.loader.ClientLocation isnt null
      widget.data "lat", roundNumber(google.loader.ClientLocation.latitude)
      widget.data "lon", roundNumber(google.loader.ClientLocation.longitude)
    load_widget widget

load_widget = (widget) ->
  args = []
  $.each widget.data(), (k, v) ->
    args.push k + "=" + escape(v)

  $.ajax
    url: widget.attr("href") + "?" + args.join("&") + "&callback=?"
    dataType: "jsonp"
    success: (data) ->
      widget.html data

$ ->
  widget = $("#adioso-widget")
  populate_geo widget
