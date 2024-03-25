import 'dart:io' if (dart.library.js_util) 'dart:js';
import 'dart:async';
import 'dart:convert';

import 'package:flutter_webrtc/flutter_webrtc.dart';

import 'package:united_screen_sharing/connection/signaling_common.dart';
import 'package:united_screen_sharing/utils/websocket.dart';

/// blackbox which connects to the peer, sends and receives given data. has no info about local system.
final class Session {
    /// the given ip address will be allowed to connect unprompted
    final String authorizedIp;
    final ServerState connectionState;
    final RTCRtpSender senders;

    const Session({
        required this.authorizedIp,
        required this.connectionState,
        required this.senders,
    });
}

/// blackbox to begin the signaling exchange in desktop platforms
///
/// starts an ws server and waits for handshake from other party
/// when handshake is done, connects to other peer and begins sending/receiving data
/// from here, you can select the input/output devices, mute yourself, stop sending screens, set a password for your server, start listening a webrtc client in the local network...
class SignalingServer {
    /// if passwordHash != null, server will require authentication. needs to be pre-hashed using md5
    String? passwordHash;

    /// ip address that the server will listen to
    String listeningAddress;
    /// port that the server will listen to
    int listeningPort;
    /// whether to use a secure protocol in the transimission of the data
    bool useSecureProtocol;

    SignalingServer(this.listeningAddress, {this.listeningPort = 19083, this.passwordHash, this.useSecureProtocol = false, required this.onServerStateChange, this.onError});

    WebSocketServer? _server;

    Future<void> startListening() async {
        _server = WebSocketServer(listeningAddress, listeningPort, onWebSocket: _onWebSocket, onServerStateChange: onServerStateChange);

        onServerStateChange(ServerState.opening);

        await _server!.initConnection();

        onServerStateChange(ServerState.listening);
    }

    Future<void> stopListening() async {
        onServerStateChange(ServerState.closing);
        _server?.dispose();

        onServerStateChange(ServerState.closed);
    }

    void _onWebSocket(WebSocket socket) {
        
    }

    /// will be called when the server starts listening
    FutureOr<void> Function(ServerState) onServerStateChange;
    /// will be called when there is an error with
    FutureOr<void> Function(Error? error)? onError;
}

