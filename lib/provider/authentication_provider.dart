class AuthenticationCredentials {
  String cookie;
  String accessToken;
  DateTime expiration;

  bool get isExpired => DateTime.now().isAfter(expiration);

  AuthenticationCredentials({
    required this.cookie,
    required this.accessToken,
    required this.expiration,
  });
}
