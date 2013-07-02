import 'dart:io';
import 'dart:json' as JSON;

main() {
  var port = int.parse(Platform.environment['PORT']);
  HttpServer.bind('0.0.0.0', port).then((server) {
    print('Server started on port: ${port}');
    server.listen((HttpRequest request) {
      var resp = JSON.stringify({
        'Dart on Dokku': true,
        'Buildpack URL': 'https://github.com/igrigorik/heroku-buildpack-dart',
        'Environment': Platform.environment}
      );
      request.response..headers.set(HttpHeaders.CONTENT_TYPE, 'application/json')
                      ..write(resp)
                      ..close();
    });
  });
}