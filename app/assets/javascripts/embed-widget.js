function roundNumber(num, dec) {
  return result = Math.round(num*Math.pow(10,dec))/Math.pow(10,dec);
}

var populate_geo = function(widget) {
  $.getScript("http://www.google.com/jsapi?key=ABQIAAAAdCqYebvklTBR0pZ61UFVoxQCULP4XOMyhPd8d_NrQQEO8sT8XBSWz-7GSxc5IvqTv62PoFCHY2tyyQ", function(){
    if (google.loader.ClientLocation !== null) {
      widget.data('lat', roundNumber(google.loader.ClientLocation.latitude, 2));
      widget.data('lon',  roundNumber(google.loader.ClientLocation.longitude, 2));
    }
    load_widget(widget);
  });
};

var load_widget = function(widget) {
  var args = [];
  $.each(widget.data(),function(k, v) {
    args.push(k+'='+escape(v));
  });

  $.ajax({
    url: widget.attr('href') + '?' + args.join('&') + '&callback=?',
    dataType: 'jsonp',
    success: function(data) {
      widget.html(data);
    }
  });
};

$(function () {
  var widget = $('#adioso-widget');
  populate_geo(widget);
});
