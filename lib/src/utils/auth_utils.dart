import 'package:fixie_server/src/generated/protocol.dart';
import 'package:sentry/sentry.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class AuthUtils {
  static Future<User?> createUserProfileForId(
    Session session,
    int userId,
  ) async {
    User user = await User.db.insertRow(
      session,
      User(
        userInfoId: userId,
      ),
    );

    assert(user.id != null);

    return User.db.findById(session, user.id!);
  }

  static Future<User> getAuthenticatedUser(Session session) async {
    AuthenticationInfo? info = await session.authenticated;

    int? authenticatedUserId = info?.userId;

    if (authenticatedUserId != null) {
      try {
        User? fetchedUser = await User.db.findFirstRow(
          session,
          include: User.include(
            userInfo: UserInfo.include(),
          ),
          where: (p0) => p0.userInfoId.equals(authenticatedUserId),
        );

        if (fetchedUser == null) {
          // In case a user has been authenticated, but a profile has not yet been made, create a profile
          User? createdUser = await createUserProfileForId(
            session,
            authenticatedUserId,
          );

          if (createdUser == null) {
            throw Exception('User could not be created');
          }

          return createdUser;
        }

        return fetchedUser;
      } catch (exception, stackTrace) {
        await Sentry.captureException(
          exception,
          stackTrace: stackTrace,
        );
      }
    }

    throw EndpointException(
      message: "User could not be found. Are you authenticated?",
      errorType: ErrorType.authenticationError,
    );
  }
}
