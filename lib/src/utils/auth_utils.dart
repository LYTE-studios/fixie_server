import 'package:fixie_server/src/generated/protocol.dart';
import 'package:sentry/sentry.dart';
import 'package:serverpod/serverpod.dart';

class AuthUtils {
  static Future<User?> getAuthenticatedUser(Session session) async {
    AuthenticationInfo? info = await session.authenticated;

    int? authenticatedUserId = info?.userId;

    if (authenticatedUserId != null) {
      try {
        return await User.db.findFirstRow(
          session,
          where: (p0) => p0.userInfoId.equals(authenticatedUserId),
        );
      } catch (exception, stackTrace) {
        await Sentry.captureException(
          exception,
          stackTrace: stackTrace,
        );
      }
    }

    Sentry.captureMessage(
      'User was not found.',
    );

    return null;
  }
}
