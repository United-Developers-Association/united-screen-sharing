import 'dart:io' if (dart.library.js_util) 'dart:js';
import 'dart:async';

import 'package:meta/meta.dart';

class WebSocketServer {
    String address;
    int port;

    WebSocketServer(this.address, this.port);

    HttpServer? _server;
    Stream<WebSocket>? _sockets;

    Future<void> initConnection() async {
        _server = await HttpServer.bind(address, port);
        _sockets = _server!.transform(WebSocketTransformer());
        _sockets!.listen(onConnectionEstablished, onDone: () => dispose());
    }

    /// is called when the http server is about to be closed
    @mustCallSuper
    void dispose() {
        
    }

    /// is called when a websocket connection is made with a pair. can be called many different times
    ///
    /// in order to use, listen for websocket messages using socket.listen() or async*, or send messages using .add and .addStream
    FutureOr<void> Function(WebSocket socket)? onConnectionEstablished;
    /// is called when the http server is established and listening for connections
    FutureOr<void> Function()? onConnectionListening;
    /// is called when a websocket connection is closed (can be called many times)
    FutureOr<void> Function(int? closeCode, String? closeReason)? onConnectionFinished;
}
