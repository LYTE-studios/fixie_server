import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class PaymentsEndpoint extends Endpoint {
  Future<List<PurchaseItem>> fetchActivePurchases(Session session) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

    List<PurchaseItem> items = await PurchaseItem.db.find(
      session,
      where: (t) =>
          t.userId.equals(user.id) &
          t.expiryDate.between(
            DateTime.now(),
            DateTime(2100),
          ),
    );

    return items;
  }
}
