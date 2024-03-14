import 'dart:convert';

import 'package:united_screen_sharing/connection/signaling_requirements.dart';
import 'package:united_screen_sharing/utils/websocket.dart';

class SignalingServer {
    /// If passwordHash is not null, the server will require authentication. Needs to be pre-hashed using md5
    String? passwordHash;

    // IP address and port that the server will be listening to
    String listeningAddress;
    int listeningPort = 19083;
    bool useSecureProtocol = false;

    SignalingServer(this.listeningAddress, {this.listeningPort, this.passwordHash, this.useSecureProtocol}, ...this.ipRestrictions);

    SimpleWebSocket? _socket;

    Future<void> startListening() async {
        _socket = await SimpleWebSocket(listeningAddress, listeningPort);
        await _socket.initConnection();
        onConnectionListening();

        _socket.listen(onMessageReceived, onDone: onConnectionFinished, onError: onError);
    }

    Future<void> stopListening() {
        await _socket.close();

        onConnectionFinished();
    }

    void onMessageReceived(msg) {
        
    }

    Function()? onConnectionListening;
    Function()? onConnectionEstablished;
    Function(Error? error)? onError;
    Function()? onConnectionFinished;
}

