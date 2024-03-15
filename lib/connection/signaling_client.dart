import 'dart:async';

import 'package:united_screen_sharing/connection/signaling_requirements.dart';

enum MessageType {
    informationRequest,
    passwordRequest,
    passwordReject,
    acceptHandshake,
    rejectHandshake
}

class SignalingConnection {
    String address;
    int port;

    SignalingConnection(this.address, {
        this.port = 19083,
        this.onMessageReceived,
        this.onConnectionEstablished,
        this.onConnectionFinished,
        this.onRequirementsReceived
    });

    FutureOr<void> initiateConnection() async {}
    FutureOr<void> finishConnection() async {}

    FutureOr<void> Function(MessageType type, Object? info)? onMessageReceived;
    FutureOr<void> Function()? onConnectionEstablished;
    FutureOr<void> Function()? onConnectionFinished;
    FutureOr<void> Function(SignalingRequirements requirements)? onRequirementsReceived;
}

