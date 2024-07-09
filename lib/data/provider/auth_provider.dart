import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landlord/data/model/registration_model.dart';
import 'package:landlord/data/model/user_model.dart';
import 'package:landlord/data/network/repository/repository.dart';
import 'package:landlord/pages/profile/view/profile_screen.dart';
import 'package:landlord/utils/dialog/loading_dialog.dart';
import 'package:landlord/utils/global_state.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:provider/provider.dart';
import '../local/local_auth_provider.dart';

UserModel? userResponse;

class AuthProvider {
  void login(
      {required UserLogin userLogin, required BuildContext context}) async {
    RepositoryImpl(context).login(userLogin).then((user) {
      if (user != null) {
        GlobalState.instance.set('token', user.token);
        LoadingDialog.showToastNotification(
          "User Login Successfully",
        );
        context.read<LocalAuthProvider>().updateUser(user);
        NavUtil.pushAndRemoveUntil(context, const ProfileScreen());
      } else {
        LoadingDialog.showToastNotification(
          "Something went wrong",
        );
      }
    });
  }

  void registration(
      {required UserRegistration userRegistration,
      required BuildContext context}) async {
    await RepositoryImpl(context).registration(userRegistration).then((user) {
      if (user != null) {
        GlobalState.instance.set('token', user.token);
        LoadingDialog.showToastNotification(
          "User Login Successfully",
        );
        context.read<LocalAuthProvider>().updateUser(user);
        NavUtil.pushAndRemoveUntil(context, const ProfileScreen());
      }
    });
  }
}
