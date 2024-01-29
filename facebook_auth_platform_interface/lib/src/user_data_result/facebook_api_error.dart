part of user_data_result;

/// See [Facebook Graph API Errors](https://developers.facebook.com/docs/graph-api/guides/error-handling/)
final class FacebookApiError implements FacebookUserDataResult, Exception {
  const FacebookApiError({
    required this.code,
    required this.subCode,
    required this.message,
  });

  factory FacebookApiError.fromJson(Map<String, dynamic> json) {
    return FacebookApiError(
      code: json['code'] as int? ?? -1,
      subCode: json['error_subcode'] as int? ?? -1,
      message: json['message'] as String? ?? '',
    );
  }

  static const FacebookApiError unknown = FacebookApiError(
    code: -1,
    subCode: -1,
    message: '',
  );

  final int code;

  final int subCode;

  /// Might be empty
  final String message;

  @override
  String toString() => message.isNotEmpty ? message : 'Facebook Error $code';
}
