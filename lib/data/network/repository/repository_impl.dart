part of 'repository.dart';

class RepositoryImpl {
  late BuildContext _context;
  late RepositoryMethods _repositoryMethods;

  RepositoryImpl(BuildContext context) {
    _context = context;
    _repositoryMethods = RepositoryMethods(_context);
  }
  // Future<UserModel?> login(UserLogin userLogin) =>
  //     _repositoryMethods.login(userLogin: userLogin);
  Future<UserModel?> registration(UserRegistration userRegistration) =>
      _repositoryMethods.registration(userLogin: userRegistration);

  Future<UserModel?> login(UserLogin userLogin) =>
      _repositoryMethods.login(userLogin: userLogin);

  Future loginApi(data) => _repositoryMethods.loginApi(data: data);

  Future<UserModel?> editProfileApi(data) =>
      _repositoryMethods.editProfileApi(data);

  Future changePasswordApi<bool>(data) =>
      _repositoryMethods.changePasswordApi(data: data);

  Future<DashboardModel?> getDashboardData() =>
      _repositoryMethods.getDashboardData();

  Future<NewsDetailsModel?> getNewsDetailsData(String slug) =>
      _repositoryMethods.getNewDetailsData(slug);

  Future<PostCommentModel> postComment(data) =>
      _repositoryMethods.postComment(data: data);

  Future<VoteResponseModel> postVote(data) =>
      _repositoryMethods.postVote(data: data);

  Future<BookmarkModel> bookmarkApi(data) =>
      _repositoryMethods.bookmarkApi(data: data);

  Future<CommentsModel?> getCommentsData() =>
      _repositoryMethods.getCommentsApi();

  Future<NewsResponse?> getMyPostData() => _repositoryMethods.getMyPostApi();

  Future<InterestedTopicModel?> getInterestedTopicData() =>
      _repositoryMethods.getInterestedTopicApi();

  Future<NewsletterModel?> getNewsletterSettingApi() =>
      _repositoryMethods.getNewsletterSettingApi();

  Future<PostNewsletterModel?> postNewsletterApi(type, value) =>
      _repositoryMethods.postNewsletterApi(type, value);

  Future<PostNewsletterModel?> postInterestedTopicApi(id) =>
      _repositoryMethods.postInterestedTopicApi(id);

  Future<NewsResponse?> getSavedArticleData() =>
      _repositoryMethods.getSavedArticleApi();

  Future<NewsResponse?> getBreakingNewsSliderData() =>
      _repositoryMethods.getBreakingNewsSliderApi();

  Future<NewsResponse?> getBreakingScrollingNewsData() =>
      _repositoryMethods.getBreakingScrollingNewsApi();

  Future<NewsResponse?> getSerialOneToFiveNewsData() =>
      _repositoryMethods.getSerialOneToFiveNewsApi();

  Future<NewsResponse?> getSerialSixToEightNewsData() =>
      _repositoryMethods.getSerialSixToEightNewsApi();

  Future<NewsResponse?> getSerialNineToTwelveNewsData() =>
      _repositoryMethods.getSerialNineToTwelveNewsApi();

  Future<NewsResponse?> getSerialThirteenToFifteenNewsData() =>
      _repositoryMethods.getSerialThirteenToFifteenNewsApi();

  Future<NewsResponse?> getSerialSixteenToTwentyNewsData() =>
      _repositoryMethods.getSerialSixteenToTwentyNewsApi();

  Future<NewsResponse?> getSerialTwentyOneTwentyThreeNewsData() =>
      _repositoryMethods.getSerialTwentyOneTwentyThreeNewsApi();

  Future<NewsResponse?> getCurrentNewsData() =>
      _repositoryMethods.getCurrentNewsApi();

  Future<NewsResponse?> getTrendingNewsData() =>
      _repositoryMethods.getTrendingNewsApi();

  Future<NewsResponse?> getCategoryWiseListApi(slug) =>
      _repositoryMethods.getCategoryWiseListApi(slug);
  Future<CategoryModel?> getCategoryData() =>
      _repositoryMethods.getCategoryApi();

  Future<NewsCategoryModel?> getNewsCategoryData() =>
      _repositoryMethods.getNewsCategoryApi();

  Future<SubCategoryModel?> getCategoryListData(slug) =>
      _repositoryMethods.getCategoryNewsApi(slug);

  Future<List<CountryData>> getCountryData() =>
      _repositoryMethods.getCountryApi();

  Future<List<StateData>> getStateData(data) =>
      _repositoryMethods.getStateApi(data);

  Future<List<CityData>> getCitiesData(data) =>
      _repositoryMethods.getCitiesApi(data);

  Future<NewsResponse?> getAreaWiseSearchData(
          {countryCode, stateCode, citiesCode}) =>
      _repositoryMethods.getAreaWiseSearchApi(
          countryCode, stateCode, citiesCode);

  Future<NewsResponse?> getKeywordSearchApi(keyword) =>
      _repositoryMethods.getKeywordSearchApi(keyword);
}
