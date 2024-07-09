import 'package:flutter/material.dart';
import 'package:landlord/data/model/login_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class RegisterProvider extends ChangeNotifier {
  final currentPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();
  LoginModel? loginData;
  BuildContext context;

  RegisterProvider(this.context);

  Future<bool> changePassword() async {
    final data = {
      "email": currentPassController.text,
      "password": newPassController.text,
    };

    var apiResponse = await RepositoryImpl(context).loginApi(data);
    if (apiResponse != null) {
      loginData = apiResponse;
    }
    notifyListeners();
    return false;
  }
}
