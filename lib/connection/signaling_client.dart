import 'dart:async';

import 'package:united_screen_sharing/connection/signaling_common.dart';

final class SignalingClient {
    final String address;
    final int port;

    const SignalingClient(this.address, {
        this.port = 19083,
        required this.onConnectionStateChange,
        required this.onPasswordPrompt
    });

    FutureOr<void> initiateConnection() async {}
    FutureOr<void> finishConnection() async {}

    final FutureOr<void> Function(String password) onPasswordPrompt;
    final FutureOr<void> Function(ServerState) onConnectionStateChange;
}

