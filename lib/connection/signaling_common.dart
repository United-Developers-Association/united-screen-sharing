import 'package:flutter_webrtc/flutter_webrtc.dart';

enum VideoType {
    videoOffer,
    videoAnswer
}

final class SignalingOffer {
    final VideoType type;
    final String targetIp;
    final String sdp;

    const SignalingOffer({
        required this.type,
        required this.targetIp,
        required this.sdp,
    });
}

enum CallState {
    open,
    ringing,
    connected,
    bye
}

final class WebRTCSession {
    RTCPeerConnection? peerConnection;
    RTCDataChannel? dataChannel;
}

enum SignalingState {
    connectionOpen,
    connectionClosed,
    connectionError
}

enum VideoSource {
    camera,
    screen,
    none,
}

enum AudioSource {
    microphone,
    desktop,
    none,
}

enum ServerState {
    /// when the http server is in the process of binding the http address
    opening,
    listening,
    connected,
    closing,
    closed
}
