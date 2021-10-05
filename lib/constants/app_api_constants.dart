// Base Related

const String scheme = 'https';
const String host = 'api.zuri.chat';
const String dmHost = 'dm.zuri.chat';
const String channelHost = 'channels.zuri.chat';
const int receiveTimeout = 3000;
const int sendTimeout = 5000;
Uri baseUri = Uri(scheme: scheme, host: host, path: '/');

// Auth Endpoints

Uri signInUri = Uri(scheme: scheme, host: host, path: '/auth/login');
Uri signupUri = Uri(scheme: scheme, host: host, path: '/users');
Uri loginUri(String userId) => Uri(scheme: scheme, host: host, path: '/users/$userId');
Uri confirmEmailUri = Uri(scheme: scheme, host: host, path: '/verify-account');
Uri verifyResetPasswordUri =
    Uri(scheme: scheme, host: host, path: '/account/verify-reset-password');
Uri requestPasswordResetCodeUri = Uri(
    scheme: scheme, host: host, path: '/account/request-password-reset-code');

// Organization Endpoints

Uri getOrganizationsUri(email) =>
    Uri(scheme: scheme, host: host, path: '/users/$email/organizations');
Uri createOrganizationUri =
    Uri(scheme: scheme, host: host, path: '/organizations');

Uri getOrganisationUri(String organisationId) =>
    Uri(scheme: scheme, host: host, path: '/organizations/$organisationId');

Uri getAddUserToOrganizationUri(orgID) =>
    Uri(scheme: scheme, host: host, path: '/organizations/$orgID/members');

Uri updateUserProfile(String organizationId, String memberId) => Uri(
    scheme: scheme,
    host: host,
    path: '/organizations/$organizationId/members/$memberId/profile');

Uri updateUserProfilePicture(String organizationId, String memberId) => Uri(
    scheme: scheme,
    host: host,
    path: '/organizations​/$organizationId}/members​/$memberId​/photo');

Uri getMemberIdUri(String organizationId, String memberId) => Uri(
    scheme: scheme,
    host: host,
    path: '/organizations/$organizationId/members/$memberId');
    
// Channel Endpoints

Uri getCreateChannelUri(String organisationId) => Uri(
    scheme: scheme,
    host: channelHost,
    path: '/api/v1/$organisationId/channels/');

Uri getUserChannelUri(String organisationId, String channelId) => Uri(
    scheme: scheme,
    host: channelHost,
    path: '/api/v1/$organisationId/channels/$channelId/members/');

Uri getMemberUri(String organisationId) => Uri(
    scheme: scheme, host: host, path: '/organizations/$organisationId/members');

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

Uri getRemoveChannelMemberUri(
        String channel_id, String org_id, String member_id) =>
    Uri(
        scheme: scheme,
        host: channelHost,
        path: '/api/v1/${org_id}/channels/${channel_id}/members/${member_id}/');

// DM Endpoints

Uri dmCreateRoom(String orgId,String userId) =>
    Uri(scheme: scheme, host: dmHost, path: '/api/v1/org/${orgId}/users/${userId}/room');

Uri dmSendMessage(String roomId) =>
    Uri(scheme: scheme, host: dmHost, path: '/api/v1/rooms/${roomId}/message');

Uri get dmGetRoomInfo =>
    Uri(scheme: scheme, host: dmHost, path: '/api/v1/room-info');

Uri dmFetchRoomMessages(String roomId) =>
    Uri(scheme: scheme, host: dmHost, path: '/api/v1/messages/${roomId}');

Uri dmMarkMessageAsRead(String messageId) =>
    Uri(scheme: scheme, host: dmHost, path: '/api/v1/${messageId}/read/new/');

Uri dmFetchDMs(String orgId,String userId) =>
    Uri(scheme: scheme, host: dmHost, path: '/api/v1/org/${orgId}/users/${userId}/rooms');

Uri dmUserProfile(String orgId, String memberId) => Uri(
    scheme: scheme,
    host: dmHost,
    path: '/api/v1/org/$orgId/members/$memberId/profile');
//
