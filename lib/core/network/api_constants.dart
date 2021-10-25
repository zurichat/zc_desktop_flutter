class APIConstants {
  static const String scheme = 'https';

  final String host;
  final String dmHost;
  final String channelHost;

  final int receiveTimeout = 3000;
  final int sendTimeout = 5000;

  APIConstants.production()
      : host = 'api.zuri.chat',
        dmHost = 'dm.zuri.chat',
        channelHost = 'channels.zuri.chat';

  Uri get baseUri => Uri(scheme: scheme, host: host, path: '/');

  Uri get signinUri => Uri(scheme: scheme, host: host, path: '/auth/login');

  Uri get signupUri => Uri(scheme: scheme, host: host, path: '/users');

  Uri get confirmEmailUri =>
      Uri(scheme: scheme, host: host, path: '/verify-account');

  Uri get verifyResetPasswordUri =>
      Uri(scheme: scheme, host: host, path: '/account/verify-reset-password');

  Uri get requestPasswordResetCodeUri => Uri(
      scheme: scheme, host: host, path: '/account/request-password-reset-code');

  // Organisation endpoints
  Uri getOrganizationsUri(email) =>
      Uri(scheme: scheme, host: host, path: '/users/$email/organizations');

  Uri get createOrganizationUri =>
      Uri(scheme: scheme, host: host, path: '/organizations');

  Uri getOrganisationUri(String organisationId) =>
      Uri(scheme: scheme, host: host, path: '/organizations/$organisationId');

  Uri getaddUserToOganization(orgID) =>
      Uri(scheme: scheme, host: host, path: '/organizations/$orgID/members');

  // Channels Endpoints

  Uri getcreateChannelUri(String organisationId) => Uri(
      scheme: scheme,
      host: channelHost,
      path: '/api/v1/$organisationId/channels/');

  Uri getuserChannelUri(String organisationId, String channelId) => Uri(
      scheme: scheme,
      host: channelHost,
      path: '/api/v1/$organisationId/channels/$channelId/members/');

  //DMs endpoints
  Uri get dmCreateRoom =>
      Uri(scheme: scheme, host: dmHost, path: '/api/v1/createroom');

  Uri dmSendMessage(String roomId) => Uri(
      scheme: scheme, host: dmHost, path: '/api/v1/rooms/${roomId}/message');

  Uri get dmGetRoomInfo =>
      Uri(scheme: scheme, host: dmHost, path: '/api/v1/room-info');

  Uri dmFetchRoomMessages(String roomId) =>
      Uri(scheme: scheme, host: dmHost, path: '/api/v1/messages/${roomId}');

  Uri dmMarkMessageAsRead(String messageId) =>
      Uri(scheme: scheme, host: dmHost, path: '/api/v1/${messageId}/read/new/');

  //Channnel endpoints
  Uri channelSendMessage(String channel_id, String org_id) => Uri(
      scheme: scheme,
      host: channelHost,
      path: '/api/v1/${org_id}/channels/${channel_id}/messages/');

  Uri channelFetchMessages(String channel_id, String org_id) => Uri(
      scheme: scheme,
      host: channelHost,
      path: '/api/v1/${org_id}/channels/${channel_id}/messages/');

  Uri getChannelSocketId(String channel_id, String org_id) => Uri(
      scheme: scheme,
      host: channelHost,
      path: '/api/v1/${org_id}/channels/${channel_id}/socket/');
}
