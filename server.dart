import 'dart:io';

final File file = File('index.html');
Future main() async{
  var myServer = await HttpServer.bind('127.0.0.1', 9000);
  print('The server is alive on '
      '${myServer.address.host} and listening on port '
      '${myServer.port}');

  await for (HttpRequest request in myServer){
    if (await file.exists()){
      print("Serving $file");
      request.response.headers.contentType = ContentType.html;

      await file.openRead().pipe(request.response);
    }
  }

  myServer.listen((HttpRequest request) {
    request.response..write("Hello From Server")..close();
  });
}