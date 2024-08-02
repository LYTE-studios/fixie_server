import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class CategoriesEndpoint extends Endpoint {
  Future<Category?> addCategory(Session session, CreateCategoryDto dto) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

    Category created = await Category.db.insertRow(
      session,
      Category(
        title: dto.title,
        color: dto.color,
        icon: dto.icon,
        userId: user.id,
      ),
    );

    return created;
  }

  Future<List<Category>> getActiveCategories(Session session) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

    List<Category> categories = [];

    List<Goal> activeGoals = await Goal.db.find(
      session,
      include: Goal.include(
        category: Category.include(),
      ),
      where: (t) =>
          t.active.equals(true) &
          t.archived.equals(false) &
          t.userId.equals(user.id),
    );

    for (Goal goal in activeGoals) {
      if (goal.category == null) {
        continue;
      }
      if (categories.contains(goal.category)) {
        continue;
      }
      categories.add(goal.category!);
    }

    return categories;
  }
}
