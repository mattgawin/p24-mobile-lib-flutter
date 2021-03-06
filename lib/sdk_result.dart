class SdkResult {
  final SdkStatus _status;
  final String _payload;

  SdkResult({SdkStatus status, String payload})
      : this._status = status,
        this._payload = payload;

  SdkStatus get status => _status;
  String get payload => _payload;

  factory SdkResult.fromMap(Map<dynamic, dynamic> map) {
    return SdkResult(
        status: SdkResult.getStatusFrom(map["status"]),
        payload: map["payload"]);
  }

  static SdkStatus getStatusFrom(String result) {
    switch (result) {
      case "cancel":
        return SdkStatus.cancel;
        break;
      case "success":
        return SdkStatus.success;
        break;
      case "error":
        return SdkStatus.error;
        break;
      default:
        return SdkStatus.cancel;
        break;
    }
  }
}

enum SdkStatus { success, error, cancel }
