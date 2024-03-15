import 'dart:async';

import 'package:flutter_webrtc/flutter_webrtc.dart';

import 'package:united_screen_sharing/connection/signaling_requirements.dart';

class PeerConnection {
    String ipAddress;
    int port;
    SignalingRequirements? requirements;

    PeerConnection(this.ipAddress, {
            this.port = 19084,
            this.requirements,
            this.onVideoData,
            this.onBinaryData,
            this.onConnectionEstablished,
            this.onConnectionFinished,
    });

    Future<void> attemptConnection() async {
        
    }

    Future<void> finishConnection() async {
        
    }

    // FIXME: what type is video and binary data?
    FutureOr<void> Function(Object videoData)? onVideoData;
    FutureOr<void> Function(Object binaryData)? onBinaryData;
    FutureOr<void> Function()? onConnectionEstablished;
    FutureOr<void> Function()? onConnectionFinished;
}

