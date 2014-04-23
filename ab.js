(function (w, d) {
  AB = w.AB || {};

  AB.createTest = function (name, choices, fn) {
    post('http://localhost:4567/ab/'+name, { choices: choices }, fn);
  };

  AB.updateTest = function (name, choices, fn) {
    put('http://localhost:4567/ab/'+name, {choices: choices}, fn);
  };

  AB.chooseForUser = function (userId, testName, fn) {
    get('http://localhost:4567/ab/'+testName+'/'+userId, fn)
  };

  w.AB = AB;

  function post() {
    request.apply(this, ['POST'].concat([].slice.call(arguments)));
  }

  function put() {
    request.apply(this, ['PUT'].concat([].slice.call(arguments)));
  }

  function get() {
    request.apply(this, ['GET'].concat([].slice.call(arguments)));
  }

  function request(method, url, params, callback) {
    if (!callback && params) {
      callback = params;
      params = null;
    }

    var request = new XMLHttpRequest();
    request.open(method, url, true);
    request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    request.setRequestHeader('Accept', 'application/json');
    request.send(parseParams(params));

    request.onreadystatechange = function() {
      if (request.readyState == 4) {
        try {
          var response = JSON.parse(request.responseText);
        } catch (e) {
          var response = e;
        }

        if (request.status == 200) {
          callback(null, response);
        } else {
          callback(response, null);
        }
      }
    }
  }

  function parseParams(params, pkey) {
    var result = [];
    for (key in params) {
      var value = params[key];
      key = (pkey || []).concat([isNaN(key)?key:'']);
      if (typeof(value) === 'object') {
        result.push(parseParams(value, key));
      } else {
        key = key.reduce(function(a, b){ return a+'['+b+']'; });
        result.push(key + '=' + value);
      }
    }
    return result.join('&');
  }
})(window, document);
