import 'package:fixie_server/src/generated/protocol.dart';
import 'package:sentry/sentry.dart';
import 'package:serverpod/serverpod.dart';

class AuthUtils {
  static Future<User> createUserProfileForId(
    Session session,
    int userId,
  ) async {
    Sentry.captureMessage(
      'Creating new user profile with id $userId',
    );

    return User.db.insertRow(
      session,
      User(
        userInfoId: userId,
        birthday: DateTime.now(),
      ),
    );
  }

  static Future<User?> getAuthenticatedUser(Session session) async {
    AuthenticationInfo? info = await session.authenticated;

    int? authenticatedUserId = info?.userId;

    if (authenticatedUserId != null) {
      try {
        User? fetchedUser = await User.db.findFirstRow(
          session,
          where: (p0) => p0.userInfoId.equals(authenticatedUserId),
        );

        if (fetchedUser == null) {
          // In case a user has been authenticated, but a profile has not yet been made, create a profile
          return await createUserProfileForId(
            session,
            authenticatedUserId,
          );
        }

        return fetchedUser;
      } catch (exception, stackTrace) {
        await Sentry.captureException(
          exception,
          stackTrace: stackTrace,
        );
      }
    }

    return null;
  }
}
