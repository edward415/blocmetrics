var blocmetrics = {
  report: function(app_id, name) {  
    var _bm_event = {
    app_id: app_id,
    name: name
  };
  
  var _bm_request = new XMLHttpRequest();
  _bm_request.open("POST", "https://blocmetrics-edc415.c9.io/api/v1/events", true);
  _bm_request.setRequestHeader('Content-Type', 'application/json');
  _bm_request.onreadystatechange = function() {
  };
  _bm_request.send(JSON.stringify(_bm_event));

  }
}