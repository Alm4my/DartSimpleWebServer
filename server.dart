import 'dart:io';

Future main() async{
  var myServer = await HttpServer.bind('127.0.0.1', 9000);
  print('The server is alive on '
      '${myServer.address.host} and listening on port '
      '${myServer.port}');

  myServer.listen((HttpRequest request) {
    request.response..write("Hello From Server")..close();
  });
}