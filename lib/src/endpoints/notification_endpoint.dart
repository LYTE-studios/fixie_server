import 'package:fixie_server/src/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

import '../generated/users/user.dart';

class NotificationEndpoint extends Endpoint {
  /// Sets the FCM token for user messaging
  Future<void> setFcmToken(
    Session session, {
    required String token,
  }) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

    user.fcmToken = token;

    User newUser = await User.db.updateRow(session, user);

    if (newUser.fcmToken == token) {
      return;
    }

    throw Exception('Could not update token');
  }
}
