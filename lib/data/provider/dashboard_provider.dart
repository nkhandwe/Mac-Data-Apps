import 'package:flutter/material.dart';
import 'package:landlord/data/model/dashboard_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class DashBoardProvider extends ChangeNotifier {
  DashboardModel? dashboardResponse;

  DashBoardProvider(BuildContext context) {
    dashboardData(context);
  }

  void dashboardData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getDashboardData();
    if (apiResponse != null) {
      dashboardResponse = apiResponse;
    }
    notifyListeners();
  }
}
