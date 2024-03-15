import 'dart:io' if (dart.library.js_util) 'dart:js';
import 'dart:async';
import 'dart:convert';

import 'package:united_screen_sharing/connection/signaling_requirements.dart';
import 'package:united_screen_sharing/utils/websocket.dart';

class SignalingServer {
    /// if passwordHash != null, server will require authentication. needs to be pre-hashed using md5
    String? passwordHash;

    /// ip address that the server will listen to
    String listeningAddress;
    /// port that the server will listen to
    int listeningPort;
    /// whether to use a secure protocol in the transimission of the data
    bool useSecureProtocol;

    SignalingServer(this.listeningAddress, {this.listeningPort = 19083, this.passwordHash, this.useSecureProtocol = false});

    WebSocketServer? _server;

    Future<void> startListening() async {
        _server = WebSocketServer(listeningAddress, listeningPort, onWebSocket: _onWebSocket, onConnectionFinished: onConnectionFinished);
        await _server!.initConnection();

        if (onConnectionListening != null) onConnectionListening!();
    }

    Future<void> stopListening() async {
        _server?.dispose();

        if(onConnectionFinished != null) onConnectionFinished!();
    }

    void _onWebSocket(WebSocket socket) {
        
    }

    FutureOr<void> Function()? onConnectionListening;
    FutureOr<void> Function()? onConnectionEstablished;
    FutureOr<void> Function(Error? error)? onError;
    FutureOr<void> Function()? onConnectionFinished;
}

