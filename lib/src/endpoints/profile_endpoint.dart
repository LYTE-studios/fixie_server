import 'dart:io';

import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

class ProfileEndpoint extends Endpoint {
  Future<bool> deleteAccount(Session session) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

    String? email = user.userInfo?.email;

    if (email == null) {
      return false;
    }

    await UserInfo.db.deleteRow(
      session,
      user.userInfo!,
    );

    await EmailAuth.db
        .deleteWhere(session, where: (t) => t.email.equals(email));
    await EmailCreateAccountRequest.db
        .deleteWhere(session, where: (t) => t.email.equals(email));
    await EmailFailedSignIn.db
        .deleteWhere(session, where: (t) => t.email.equals(email));
    await EmailReset.db
        .deleteWhere(session, where: (t) => t.userId.equals(user.userInfoId));
    await AuthKey.db
        .deleteWhere(session, where: (t) => t.userId.equals(user.userInfoId));
    await EmailAuth.db
        .deleteWhere(session, where: (t) => t.email.equals(email));

    return true;
  }

  Future<int> createUser(
    Session session,
    UserInfo? user,
    DateTime birthday,
  ) async {
    if (user == null) {
      throw EndpointException(
        message: "User could not be found. Are you authenticated?",
        errorType: ErrorType.authenticationError,
      );
    } else {
      var newUser = await User.db.insertRow(
        session,
        User(
          userInfoId: user.id!,
          birthday: birthday,
        ),
      );
      if (newUser.userInfoId == user.id) {
        return HttpStatus.ok;
      } else {
        return HttpStatus.notModified;
      }
    }
  }

  Future<UserProfileDto> getProfileData(Session session) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

    UserInfo? userInfo = user.userInfo;

    if (userInfo == null) {
      throw EndpointException(
        message: "User info not found.",
        errorType: ErrorType.notFound,
      );
    }

    int daysSinceCreation = DateTime.now().difference(userInfo.created).inDays;

    UserProfileDto userProfileData = UserProfileDto(
      name: userInfo.fullName ?? '',
      email: userInfo.email ?? '',
      daysSinceCreation: daysSinceCreation,
    );

    return userProfileData;
  }

  Future<int> updateBirthday(Session session, DateTime birthday) async {
    var user = await AuthUtils.getAuthenticatedUser(session);

    user.birthday = birthday;

    var updatedUser = await User.db.updateRow(session, user);

    if (updatedUser.birthday?.isAtSameMomentAs(birthday) ?? false) {
      return HttpStatus.ok;
    } else {
      return HttpStatus.internalServerError;
    }
  }

  Future<int> updateName(Session session, String name) async {
    User? user = await AuthUtils.getAuthenticatedUser(session);

    UserInfo? userInfo = user.userInfo;

    if (userInfo == null) {
      throw EndpointException(
        message: "User info not found.",
        errorType: ErrorType.notFound,
      );
    }

    userInfo.fullName = name;
    var updatedUser = await UserInfo.db.updateRow(session, userInfo);
    var fullName = updatedUser.fullName;

    if (fullName != null && fullName == name) {
      return HttpStatus.ok;
    } else {
      return HttpStatus.internalServerError;
    }
  }
}
