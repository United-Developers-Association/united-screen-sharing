import 'package:flutter_webrtc/flutter_webrtc.dart';

import 'package:united_screen_sharing/connection/signaling_requirements.dart';

class PeerConnection {
    String ipAddress;
    int port = 19084;
    SignalingRequirements requirements = SignalingRequirements();

    PeerConnection(this.ipAddress, {this.port, this.requirements});

    Future<void> attemptConnection() {
        
    }

    Future<void> finishConnection() {
        
    }

    Function(videoData)? onVideoData;
    Function(binaryData)? onBinaryData;
    Function()? onConnectionEstablished;
    Function()? onConnectionFinished;
}

