enum VideoCodec {
    VP9,
    VP8,
    AVC,
}

enum AudioCodec {
    OPUS,
    G711pcmAlaw,
    G711pcmMlaw,
}

enum Video {
    Screen,
    Camera
}

final class SignalingRequirements {
    bool video;
    bool audio;

    int minWidth = 320;
    int? maxWidth;
    int minHeight = 120;
    int? maxHeight;

    // preference of the codecs goes in order
    VideoCodec[] supportedVideoCodecs = [VideoCodec.AVC, VideoCodec.VP9. VideoCodec.VP8];
    AudioCodec[] supportedAudioCodecs = [AudioCodec.OPUS, AudioCodec.G711pcmAlaw, AudioCodec.G711pcmMlaw];

    final SignalingRequirements({
        this.minWidth,
        this.maxWidth,
        this.minHeight,
        this.maxHeight,
        this.supportedVideoCodecs,
        this.supportedAudioCodecs,
    });
}
