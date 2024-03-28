import 'dart:io';

import 'package:fixie_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

class ProfileEndpoint extends Endpoint {
  Future<UserProfile> getProfileData(Session session) async {
    int? authenticatedUserId = await session.auth.authenticatedUserId;
    UserInfo? user = await UserInfo.db.findById(session, authenticatedUserId!);

    if (user != null) {
      int daysSinceCreation = DateTime.now().difference(user.created).inDays;
      UserProfile userProfileData = UserProfile(
          name: user.fullName!,
          email: user.email!,
          daysSinceCreation: daysSinceCreation);
      return userProfileData;
    } else {
      throw Exception("User is null");
    }
  }

  Future<int> updateBirthday(Session session, DateTime birthday) async {
    int? authenticatedUserId = await session.auth.authenticatedUserId;
    User? user = await User.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(authenticatedUserId),
    );
    if (user != null) {
      user.birthday = birthday;
      var updatedUser = await User.db.updateRow(session, user);
      if (updatedUser.birthday.isAtSameMomentAs(birthday)) {
        return HttpStatus.ok;
      } else {
        return HttpStatus.notModified;
      }
    } else {
      throw Exception("User can't be null.");
    }
  }

  Future<int> updateName(Session session, String name) async {
    int? authenticatedUserId = await session.auth.authenticatedUserId;
    UserInfo? user = await UserInfo.db.findFirstRow(
      session,
      where: (t) => t.id.equals(authenticatedUserId),
    );
    if (user != null) {
      user.fullName = name;
      var updatedUser = await UserInfo.db.updateRow(session, user);
      var fullName = updatedUser.fullName;
      if (fullName != null && fullName == name) {
        return HttpStatus.ok;
      } else {
        return HttpStatus.notModified;
      }
    } else {
      throw Exception("User can't be null.");
    }
  }
}
