class AuthResponse {
  const AuthResponse({
    required this.accessToken,
    required this.userID,
    required this.expiresIn,
    required this.signedRequest,
  });

  final String accessToken;
  final String userID;
  final String expiresIn;
  final String signedRequest;
}
