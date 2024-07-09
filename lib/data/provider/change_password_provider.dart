import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/data/network/repository/repository.dart';
import 'package:landlord/pages/home/home_page.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:provider/provider.dart';

class ChangePasswordProvider extends ChangeNotifier {
  final currentPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();
  BuildContext context;

  ChangePasswordProvider(this.context);

  Future<bool> changePassword() async {
    final data = {
      "current_password": currentPassController.text,
      "password": newPassController.text,
      "password_confirmation": confirmPassController.text,
    };

    RepositoryImpl(context).changePasswordApi(data).then((value) => {
          if (value)
            {
              Fluttertoast.showToast(msg: "Password change successfully"),
              context.read<LocalAuthProvider>().deleteUser(),
              Fluttertoast.showToast(msg: "Successfully Sign Out"),
              NavUtil.navigateScreen(context, const HomePage()),
            }
          else
            {
              Fluttertoast.showToast(msg: "Something went wrong"),
            }
        });

    notifyListeners();
    return false;
  }
}
