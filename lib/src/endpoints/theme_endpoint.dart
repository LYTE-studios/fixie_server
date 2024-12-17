import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class ThemeEndpoint extends Endpoint {
  Future<void> updatePrivacySettings(
    Session session, {
    bool? informationCollection,
    bool? automaticReminders,
  }) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

    user.informationCollectionSetting = informationCollection;
    user.automaticRemindersSetting = automaticReminders;

    await User.db.updateRow(session, user);
  }
}
