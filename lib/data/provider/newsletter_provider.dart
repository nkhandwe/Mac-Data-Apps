import 'package:flutter/material.dart';
import 'package:landlord/data/model/newsletter_model.dart';
import 'package:landlord/data/model/post_newsletter_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class NewsletterProvider extends ChangeNotifier {
  NewsletterModel? newsletterData;
  String? settingValue;
  bool? newValue;
  PostNewsletterModel? postNewsletterData;

  NewsletterProvider(BuildContext context) {
    getNewsletterSettingsData(context);
  }

  String setSwitchValue(bool value) {
    if (value == true) {
      return settingValue = '1';
    } else {
      return settingValue = '0';
    }
  }

  void getNewsletterSettingsData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getNewsletterSettingApi();
    if (apiResponse != null) {
      newsletterData = apiResponse;
    }
    notifyListeners();
  }

  void postNewsletterSettingsData(
      BuildContext context, String type, String value) async {
    print(value);
    var apiResponse =
        await RepositoryImpl(context).postNewsletterApi(type, value);
    if (apiResponse?.success == true) {
      getNewsletterSettingsData(context);
      // newsletterData = apiResponse;
    }
    notifyListeners();
  }
}
