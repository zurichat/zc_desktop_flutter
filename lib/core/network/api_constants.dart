class APIConstants {
  static const String scheme = 'https';

  final String host;

  final int receiveTimeout = 3000;
  final int sendTimeout = 5000;

  APIConstants.production() : host = 'api.zuri.chat';

  Uri get baseUri => Uri(scheme: scheme, host: host, path: '/');

  Uri get createChannelUri => Uri(scheme: scheme, host: 'channels.zuri.chat', path: '/api/v1/614679ee1a5607b13c00bcb7/channels/');

  Uri get signinUri => Uri(scheme: scheme, host: host, path: '/auth/login');

  Uri get signupUri => Uri(scheme: scheme, host: host, path: '/users');

  Uri get confirmEmailUri =>
      Uri(scheme: scheme, host: host, path: '/verify-account');

  Uri get verifyResetPasswordUri =>
      Uri(scheme: scheme, host: host, path: '/account/verify-reset-password');

  Uri get requestPasswordResetCodeUri => Uri(
      scheme: scheme, host: host, path: '/account/request-password-reset-code');
}
