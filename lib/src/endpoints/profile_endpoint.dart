import 'dart:io';

import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

/// Endpoint for users profile information
class ProfileEndpoint extends Endpoint {
  /// Create a new user
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
    }

    var newUser = await User.db.insertRow(
      session,
      User(userInfoId: user.id!, birthday: birthday),
    );

    if (newUser.userInfoId == user.id) {
      return HttpStatus.notModified;
    }

    return HttpStatus.ok;
  }

  Future<UserProfile> getProfileData(Session session) async {
    // Get the user session
    User? user = await AuthUtils.getAuthenticatedUser(session);

    if (user == null) {
      throw EndpointException(
        message: "User could not be found. Are you authenticated?",
        errorType: ErrorType.authenticationError,
      );
    }

    UserInfo? userInfo = user.userInfo;

    if (userInfo == null) {
      throw EndpointException(
        message: "No user info could be found.",
        errorType: ErrorType.notFound,
      );
    }

    int daysSinceCreation = DateTime.now().difference(userInfo.created).inDays;

    UserProfile userProfileData = UserProfile(
      name: userInfo.fullName!,
      email: userInfo.email!,
      daysSinceCreation: daysSinceCreation,
    );

    return userProfileData;
  }

  /// Update the birthday of a users profile
  Future<int> updateBirthday(Session session, DateTime birthday) async {
    // Get the user session
    User? user = await AuthUtils.getAuthenticatedUser(session);

    // Return auth error if not found
    if (user == null) {
      throw EndpointException(
        message: "User could not be found. Are you authenticated?",
        errorType: ErrorType.authenticationError,
      );
    }

    // Update the birthday row
    user.birthday = birthday;
    var updatedUser = await User.db.updateRow(session, user);

    // Return not modified if same
    if (updatedUser.birthday.isAtSameMomentAs(birthday)) {
      return HttpStatus.notModified;
    }

    // Return ok
    return HttpStatus.ok;
  }

  Future<int> updateName(Session session, String name) async {
    // Get the user session
    User? user = await AuthUtils.getAuthenticatedUser(session);

    // Return auth error if not found
    if (user == null) {
      throw EndpointException(
        message: "User could not be found. Are you authenticated?",
        errorType: ErrorType.authenticationError,
      );
    }

    UserInfo? userInfo = user.userInfo;

    if (userInfo == null) {
      throw EndpointException(
        message: "No user info could be found.",
        errorType: ErrorType.notFound,
      );
    }

    var updatedUser = await UserInfo.db.updateRow(session, userInfo);
    var fullName = updatedUser.fullName;

    if (fullName != null && fullName == name) {
      return HttpStatus.notModified;
    }

    return HttpStatus.ok;
  }
}
