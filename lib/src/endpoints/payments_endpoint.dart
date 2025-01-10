import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class PaymentsEndpoint extends Endpoint {
  Future<DateTime?> getLimitedOffer(Session session) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

    if (user.limitedOfferEndTime != null) {
      if (user.limitedOfferEndTime!.isBefore(DateTime.now())) {
        return null;
      }
      return user.limitedOfferEndTime;
    }

    user.limitedOfferEndTime = DateTime.now().add(Duration(hours: 2));

    await User.db.updateRow(session, user);

    return user.limitedOfferEndTime;
  }

  Future<bool> canStartTrial(Session session) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

    List<PurchaseItem> purchases = await PurchaseItem.db.find(
      session,
      where: (t) => t.userId.equals(user.id),
    );

    return purchases.isEmpty;
  }

  Future<void> startTrial(Session session) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

    await PurchaseItem.db.insertRow(
      session,
      PurchaseItem(
        benefitIdentifier: Benefit.trialPremium,
        userId: user.id!,
        expiryDate: DateTime.now().add(Duration(days: 31)),
        created: DateTime.now(),
      ),
    );
  }

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
