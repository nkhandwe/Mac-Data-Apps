import 'package:flutter/material.dart';
import 'package:landlord/data/model/breaking_news_slider_model.dart';
import 'package:landlord/data/model/cities_model.dart';
import 'package:landlord/data/model/country_model.dart';
import 'package:landlord/data/model/state_model.dart';
import 'package:landlord/data/network/repository/repository.dart';

class SearchProvider extends ChangeNotifier {
  List<CountryData> countryData = [];
  List<StateData> stateData = [];
  List<CityData> cityData = [];
  CountryData? countryModel;
  StateData? stateModel;
  CityData? citiesModels;
  NewsResponse? newsData;
  NewsResponse? searchKeywordData;
  String? countryCode;
  String? stateCode;
  int? cityId;

  SearchProvider(BuildContext context) {
    getCountryData(context);
    getState(context, countryCode ?? '');
  }

  void getCountryData(BuildContext context) async {
    countryData = await RepositoryImpl(context).getCountryData();
    notifyListeners();
  }

  onCountrySelect({required CountryData country}) {
    countryModel = country;
    countryCode = country.code;
    // tenantBodyModel.propertyId = '${selectedTenant?.id}';
    notifyListeners();
  }

  void getState(BuildContext context, String code) async {
    stateData = await RepositoryImpl(context).getStateData(code);
    stateModel = stateData.first;
    notifyListeners();
  }

  onStateSelect({required StateData stateData}) {
    stateModel = stateData;
    stateCode = stateData.code;
    // countryCode = country.code;
    notifyListeners();
  }

  void getCities(BuildContext context, String? citiesCode) async {
    cityData = await RepositoryImpl(context).getCitiesData(citiesCode);
    citiesModels = cityData.first;
    notifyListeners();
  }

  onCitySelect({required CityData cityData}) {
    citiesModels = cityData;
    cityId = cityData.id;
    // countryCode = country.code;
    notifyListeners();
  }

  void getAreaWiseSearchData(
      {required BuildContext context,
      required String cityId,
      required String countryCode,
      required String stateCode}) async {
    var apiResponse = await RepositoryImpl(context).getAreaWiseSearchData(
        citiesCode: cityId, countryCode: countryCode, stateCode: stateCode);
    if (apiResponse != null) {
      newsData = apiResponse;
    }
    notifyListeners();
  }

  void getKeywordSearchData(
      {required BuildContext context, required String keyword}) async {
    var apiResponse =
        await RepositoryImpl(context).getKeywordSearchApi(keyword);
    if (apiResponse != null) {
      newsData = apiResponse;
    }
    notifyListeners();
  }
}
