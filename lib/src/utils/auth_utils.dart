import 'package:fixie_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class AuthUtils {
  static Future<User?> getAuthenticatedUser(Session session) async {
    var authenticatedUserId = await session.auth.authenticatedUserId;
    if (authenticatedUserId != null) {
      return await User.db.findFirstRow(
        session,
        where: (p0) => p0.userInfoId.equals(authenticatedUserId),
      );
    }
    return null;
  }
}
