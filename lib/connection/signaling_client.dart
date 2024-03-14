

class SignalingConnection {
    String address;
    int port = 19083;
    SignalingConnection(this.address, {this.port});
    Future<void> initiateConnection();
    Future<void> finishConnection();
    Future<void> close();
    Function(msg) onMessageReceived;
    Function() onConnectionEstablished;
    Function() onConnectionFinished;
    Function(requirements SignalingRequirements) onRequirementsReceived;
}

