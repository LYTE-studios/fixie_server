import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/auth_utils.dart';
import 'package:sentry/sentry.dart';
import 'package:serverpod/serverpod.dart';

class CategoriesEndpoint extends Endpoint {
  Future<Category?> addCategory(Session session, CreateCategoryDto dto) async {
    await AuthUtils.getAuthenticatedUser(session);

    Category created = await Category.db.insertRow(
      session,
      Category(
        title: dto.title,
        color: dto.color,
        icon: dto.icon,
        userId: dto.userId,
      ),
    );

    return created;
  }

  Future<List<Category>> getActiveCategories(Session session) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

    Sentry.captureException(user.id);

    List<Category> categories = [];

    List<Goal> activeGoals = await Goal.db.find(
      session,
      where: (t) =>
          t.active.equals(true) &
          t.archived.equals(false) &
          t.userId.equals(user.id),
    );

    for (Goal goal in activeGoals) {
      if (goal.category == null) {
        continue;
      }
      categories.add(goal.category!);
    }

    return categories;
  }
}
