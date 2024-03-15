enum VideoCodec {
    vp9,
    vp8,
    avc,
}

enum AudioCodec {
    opus,
    g711pcmAlaw,
    g711pcmMlaw,
}

enum Video {
    screen,
    camera
}

final class SignalingRequirements {
    final bool video;
    final bool audio;

    // TODO: check minimum width imposed by webrtc
    /// min width of <X> imposed by WebRTC specification
    final int minWidth;
    final int? maxWidth;
    // TODO: check minimum height imposed by webrtc
    /// min height of <X> imposed by WebRTC specification
    final int minHeight;
    final int? maxHeight;

    // preference of the codecs goes in order
    final List<VideoCodec> supportedVideoCodecs;
    final List<AudioCodec> supportedAudioCodecs;

    const SignalingRequirements({
        required this.audio,
        required this.video,
        this.minWidth = 320,
        this.maxWidth,
        this.minHeight = 120,
        this.maxHeight,
        // FIXME: fix error "The property 'VideoCodec' can't be accessed on the type 'VideoCodec' in a constant expression"
        // "The property 'VideoCodec' can't be accessed on the type 'VideoCodec' in a constant expression"
        this.supportedVideoCodecs = const [VideoCodec.avc, VideoCodec.vp9. VideoCodec.vp8],
        this.supportedAudioCodecs = const [AudioCodec.opus, AudioCodec.g711pcmAlaw, AudioCodec.g711pcmMlaw],
    });
}
