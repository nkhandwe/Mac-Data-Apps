part of 'repository.dart';

class RepositoryMethods {
  final BuildContext context;
  int? userId = GlobalState.instance.get("Student_id");

  RepositoryMethods(this.context);

  String getParam() {
    return '?student_id=${userId ?? ''}';
  }

  Future<UserModel?> login({required UserLogin userLogin}) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: userLogin.toJson(),
        showLoader: true,
        toJsonFunc: (json) => UserModel.fromJson(json['data']),
        returnDataFun: (data) => data,
        name: ApiProvider.login);
  }

  Future<UserModel?> registration({required UserRegistration userLogin}) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: userLogin.toJson(),
        toJsonFunc: (json) => UserModel.editFromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.registration);
  }

  Future<DashboardModel?> getDashboardData() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => DashboardModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.dashboard);
  }

  Future<NewsDetailsModel?> getNewDetailsData(String slug) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => NewsDetailsModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: "${ApiProvider.newsDetails}$slug");
  }

  Future<CommentsModel?> getCommentsApi() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => CommentsModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.comment);
  }

  Future<NewsResponse?> getMyPostApi() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => NewsResponse.fromJson(json),
        returnDataFun: (data) => data['data'],
        showLoader: true,
        name: ApiProvider.myPost);
  }

  Future<LoginModel> loginApi({required data}) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: data,
        showLoader: true,
        toJsonFunc: (json) => json,
        returnDataFun: (data) => data,
        name: ApiProvider.updatePassword);
  }

  Future<PostCommentModel> postComment({required data}) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: data,
        showLoader: true,
        toJsonFunc: (json) => PostCommentModel.fromJson(json),
        returnDataFun: (data) => data,
        name: ApiProvider.postComment);
  }


  Future<VoteResponseModel> postVote({required data}) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: data,
        showLoader: true,
        toJsonFunc: (json) => VoteResponseModel.fromJson(json),
        returnDataFun: (data) => data,
        name: ApiProvider.postVote);
  }


  Future<BookmarkModel> bookmarkApi({required data}) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: data,
        showLoader: true,
        toJsonFunc: (json) => BookmarkModel.fromJson(json),
        returnDataFun: (data) => data,
        name: ApiProvider.bookmark);
  }

  Future<bool> changePasswordApi({required data}) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: data,
        showLoader: true,
        toJsonFunc: (json) => json,
        returnDataFun: (data) => data != null,
        name: ApiProvider.updatePassword);
  }

  Future<UserModel?> editProfileApi(data) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: data,
        showLoader: true,
        toJsonFunc: (json) => UserModel.editFromJson(json['data']),
        returnDataFun: (data) => data,
        name: ApiProvider.editProfile);
  }

  Future<NewsResponse?> getBreakingNewsSliderApi() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => NewsResponse.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.breakingNewsSlider);
  }

  Future<NewsResponse?> getBreakingScrollingNewsApi() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => NewsResponse.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.breakingNewsScrolling);
  }

  Future<NewsResponse?> getSerialOneToFiveNewsApi() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => NewsResponse.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.serialOneToFive);
  }

  Future<NewsResponse?> getSerialSixToEightNewsApi() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => NewsResponse.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.serialSixToEight);
  }

  Future<NewsResponse?> getSerialNineToTwelveNewsApi() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => NewsResponse.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.serialNineToTwelve);
  }

  Future<NewsResponse?> getSerialThirteenToFifteenNewsApi() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => NewsResponse.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.serialThirteenToFifteen);
  }

  Future<NewsResponse?> getSerialSixteenToTwentyNewsApi() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => NewsResponse.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.serialSixteenToTwenty);
  }

  Future<NewsResponse?> getSerialTwentyOneTwentyThreeNewsApi() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => NewsResponse.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.serialTwentyOneTwentyThree);
  }

  Future<NewsResponse?> getCurrentNewsApi() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => NewsResponse.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.currentNews);
  }

  Future<NewsResponse?> getTrendingNewsApi() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => NewsResponse.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.trendingNews);
  }

  Future<NewsResponse?> getCategoryWiseListApi(slug) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => NewsResponse.fromJson(json),
        returnDataFun: (data) => data['data'],
        showLoader: true,
        name: "${ApiProvider.categoryWiseList}$slug");
  }

  Future<CategoryModel?> getCategoryApi() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => CategoryModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.category);
  }

  Future<NewsCategoryModel?> getNewsCategoryApi() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => NewsCategoryModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.newsCategory);
  }

  Future<SubCategoryModel?> getCategoryNewsApi(slug) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => SubCategoryModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: "${ApiProvider.categoryListItem}$slug");
  }

  Future<List<CountryData>> getCountryApi() async {
    return await GenericHttp<CountryData>(context).callApi(
        returnType: ReturnType.list,
        methodType: MethodType.get,
        toJsonFunc: (json) => CountryData.fromJson(json),
        returnDataFun: (data) => data['data'],
        showLoader: true,
        name: ApiProvider.getCountry) as List<CountryData>;
  }

  Future<List<StateData>> getStateApi(data) async {
    return await GenericHttp<StateData>(context).callApi(
        returnType: ReturnType.list,
        methodType: MethodType.get,
        toJsonFunc: (json) => StateData.fromJson(json),
        returnDataFun: (data) => data['data'],
        showLoader: true,
        name: "${ApiProvider.getState}$data") as List<StateData>;
  }

  Future<List<CityData>> getCitiesApi(data) async {
    return await GenericHttp<CityData>(context).callApi(
        returnType: ReturnType.list,
        methodType: MethodType.get,
        toJsonFunc: (json) => CityData.fromJson(json),
        returnDataFun: (data) => data['data'],
        showLoader: true,
        name: "${ApiProvider.getCities}$data") as List<CityData>;
  }

  Future<NewsResponse?> getAreaWiseSearchApi(
      String countryCode, String stateCode, String cityId) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => NewsResponse.fromJson(json),
        returnDataFun: (data) => data['data'],
        showLoader: true,
        name:
            "${ApiProvider.getAreaWiseSearch}country=$countryCode&state=$stateCode&city=1$cityId");
  }

  Future<NewsResponse?> getKeywordSearchApi(String keyword) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => NewsResponse.fromJson(json),
        returnDataFun: (data) => data['data'],
        showLoader: true,
        name: "${ApiProvider.keywordSearch}$keyword");
  }

  Future<InterestedTopicModel?> getInterestedTopicApi() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => InterestedTopicModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.interestedTopic);
  }

  Future<InterestedTopicModel?> postInterestedTopic() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        toJsonFunc: (json) => InterestedTopicModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.interestedTopic);
  }

  Future<NewsletterModel?> getNewsletterSettingApi() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => NewsletterModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.newsletterSettings);
  }

  Future<PostNewsletterModel?> postNewsletterApi(type, value) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        showLoader: true,
        toJsonFunc: (json) => PostNewsletterModel.fromJson(json),
        returnDataFun: (data) => data,
        name: "${ApiProvider.postNewsletterSettings}$type&value=$value");
  }

  Future<PostNewsletterModel?> postInterestedTopicApi(id) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        showLoader: true,
        toJsonFunc: (json) => PostNewsletterModel.fromJson(json),
        returnDataFun: (data) => data,
        name: "${ApiProvider.postInterestedTopic}$id");
  }

  Future<NewsResponse?> getSavedArticleApi() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => NewsResponse.fromJson(json),
        returnDataFun: (data) => data['data'],
        showLoader: true,
        name: ApiProvider.savedArticle);
  }
}
