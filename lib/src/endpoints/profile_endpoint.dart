import 'dart:io';

import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

class ProfileEndpoint extends Endpoint {
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

  Future<bool> deleteAccount(Session session) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

    String? email = user.userInfo?.email;

    if (email == null) {
      return false;
    }

    List<Goal> goals = await Goal.db.find(
      session,
      where: (t) => t.userId.equals(
        user.id,
      ),
    );

    for (Goal goal in goals) {
      Goal.db.deleteRow(session, goal);
    }

    await User.db.deleteRow(session, user);

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

    String? locale = (await UserLocales.db
            .find(session, where: (t) => t.email.equals(userInfo.email)))
        .first
        .locale;

    UserProfileDto userProfileData = UserProfileDto(
      name: userInfo.fullName ?? '',
      email: userInfo.email ?? '',
      daysSinceCreation: daysSinceCreation,
      picture: userInfo.imageUrl,
      hasPassedOnboarding: user.hasPassedOnboarding ?? false,
      hasPassedGoalTutorial: user.hasPassedGoalTutorial ?? false,
      informationCollectionSetting: user.informationCollectionSetting,
      automaticRemindersSetting: user.automaticRemindersSetting,
      locale: locale,
    );

    return userProfileData;
  }

  Future<int> setEmptyLocale(
    Session session,
    String email,
    String locale,
  ) async {
    UserLocales? locales = (await UserLocales.db.find(
      session,
      where: (t) => t.email.equals(email),
    ))
        .firstOrNull;

    if (locales != null) {
      locales.locale = locale;

      await UserLocales.db.updateRow(session, locales);

      return HttpStatus.ok;
    }

    await UserLocales.db.insertRow(
      session,
      UserLocales(email: email, locale: locale),
    );

    return HttpStatus.ok;
  }

  Future<int> updateLocale(Session session, String locale) async {
    var user = await AuthUtils.getAuthenticatedUser(session);

    UserLocales? locales = (await UserLocales.db.find(
      session,
      where: (t) => t.email.equals(user.userInfo?.email),
    ))
        .firstOrNull;

    if (locales == null) {
      return await setEmptyLocale(session, user.userInfo!.email!, locale);
    }

    locales.locale = locale;

    await UserLocales.db.updateRow(session, locales);

    return HttpStatus.ok;
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

  Future<void> completeOnboarding(Session session) async {
    User? user = await AuthUtils.getAuthenticatedUser(session);

    user.hasPassedOnboarding = true;

    await User.db.updateRow(session, user);
  }

  Future<void> completeGoalTutorial(Session session) async {
    User? user = await AuthUtils.getAuthenticatedUser(session);

    user.hasPassedGoalTutorial = true;

    await User.db.updateRow(session, user);
  }

  Future<Map<String, String?>> getImageUploadDescription(
    Session session, {
    required String fileName,
  }) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

    String path = 'users/${user.id}/images/$fileName';

    String? description =
        await session.storage.createDirectFileUploadDescription(
      storageId: 'public',
      path: path,
    );

    return {
      'description': description,
      'path': path,
    };
  }

  Future<bool> verifyUpload(Session session, String path) async {
    return await session.storage.verifyDirectFileUpload(
      storageId: 'public',
      path: path,
    );
  }

  Future<int> updateProfilePicture(Session session, String url) async {
    User? user = await AuthUtils.getAuthenticatedUser(session);

    UserInfo? userInfo = user.userInfo;

    if (userInfo == null) {
      throw EndpointException(
        message: "User info not found.",
        errorType: ErrorType.notFound,
      );
    }

    userInfo.imageUrl = url;
    var updatedUser = await UserInfo.db.updateRow(session, userInfo);
    var fullUrl = updatedUser.imageUrl;

    if (fullUrl != null && fullUrl == name) {
      return HttpStatus.ok;
    } else {
      return HttpStatus.internalServerError;
    }
  }
}
