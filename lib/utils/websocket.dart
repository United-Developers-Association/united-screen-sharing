import 'dart:io' if (dart.library.js_util) 'dart:js';

class SimpleWebSocket extends WebSocket {
    String address;
    int port;

    SimpleWebSocket(address, port);

    HttpServer? _server;

    Future<void> initConnection() async {
        _server = await HttpServer.bind(address, port);
        _server.transform(WebSocketTransformer()).listen(listen);
    }

    Function()? onConnectionEstablished;
    Function()? onConnectionListening;
    Function()? onConnectionFinished;
    Function()? onConnectionData;
}
