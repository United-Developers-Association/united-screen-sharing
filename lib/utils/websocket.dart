import 'dart:io' if (dart.library.js_util) 'dart:js';
import 'dart:async';

import 'package:meta/meta.dart';

import 'package:united_screen_sharing/connection/signaling_common.dart';

class WebSocketServer {
    String address;
    int port;

    WebSocketServer(this.address, this.port, {
        required this.onWebSocket,
        required this.onServerStateChange
    });

    HttpServer? _server;
    Stream<WebSocket>? _sockets;

    Future<void> initConnection() async {
        _server = await HttpServer.bind(address, port);
        _sockets = _server!.transform(WebSocketTransformer());
        _sockets!.listen(onWebSocket, onDone: () => dispose());
    }

    /// is called when the http server is about to be closed
    @mustCallSuper
    void dispose() {
        onServerStateChange(ServerState.closing);

        _server?.close();

        onServerStateChange(ServerState.closed);
    }

    /// is called when a websocket connection is made with a pair. can be called many different times
    ///
    /// in order to use, listen for websocket messages using socket.listen() or async*, or send messages using .add and .addStream
    FutureOr<void> Function(WebSocket socket) onWebSocket;
    /// is called when the http server is established and listening for connections
    FutureOr<void> Function(ServerState) onServerStateChange;
}
