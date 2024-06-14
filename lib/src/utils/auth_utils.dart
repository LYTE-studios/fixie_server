import 'package:fixie_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class AuthUtils {
  static Future<User?> getAuthenticatedUser(Session session) async {
    AuthenticationInfo? info = await session.authenticated;

    if (info != null) {
      return await User.db.findFirstRow(
        session,
        where: (p0) => p0.userInfoId.equals(info.userId),
      );
    }
    return null;
  }
}
