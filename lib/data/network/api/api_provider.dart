class ApiProvider {
  // Private base url

  static const String privateBaseUrl = 'https://news.iisbd.io/api/private/v1';
  static String login = '$privateBaseUrl/auth/login';
  static String registration = '$privateBaseUrl/auth/register';
  static String editProfile = '$privateBaseUrl/auth/user/update';
  static String postNewsletterSettings = '$privateBaseUrl/update-setting?key=';
  static String postInterestedTopic =
      '$privateBaseUrl/reader/toggle-interested-topic/';
  static String dashboard = '$privateBaseUrl/reader/dashboard-statistics';
  static String comment = '$privateBaseUrl/reader/my-comments';
  static String myPost = '$privateBaseUrl/reader/my-news';
  static String interestedTopic = '$privateBaseUrl/reader/my-interested-topics';
  static String newsletterSettings = '$privateBaseUrl/reader/settings';
  static String savedArticle = '$privateBaseUrl/reader/my-favorite-news';
  static String updatePassword = '$privateBaseUrl/auth/update-password';
  static String postComment = '$privateBaseUrl/comments';
  static String bookmark = '$privateBaseUrl/news-bookmark';
  static String postVote = '$privateBaseUrl/submit-comment-vote';

  // Public base url

  static const String baseUrl = 'https://news.iisbd.io/api/public/v1';

  static String home = '$baseUrl/student/home';
  static String breakingNewsSlider = '$baseUrl/breaking-thumbnail-news';
  static String breakingNewsScrolling = '$baseUrl/breaking-scrolling-news';
  static String serialOneToFive = '$baseUrl/serial/1/news/5';
  static String serialSixToEight = '$baseUrl/serial/6/news/8';
  static String serialNineToTwelve = '$baseUrl/serial/9/news/12';
  static String serialThirteenToFifteen = '$baseUrl/serial/13/news/15';
  static String serialSixteenToTwenty = '$baseUrl/serial/16/news/20';
  static String serialTwentyOneTwentyThree = '$baseUrl/serial/21/news/23';
  static String currentNews = '$baseUrl/current-news';
  static String trendingNews = '$baseUrl/trending-news';
  static String categoryWiseList =
      '$baseUrl/category-wise-paginate-news-app?slug=';
  static String category = '$baseUrl/home-news-styles';
  static String newsCategory = '$baseUrl/categories';
  static String categoryListItem = '$baseUrl/category-style-wise-news/';
  static String getCountry = '$baseUrl/countries';
  static String getState = '$baseUrl/states?country_code=';
  static String getCities = '$baseUrl/cities?state_code=';
  static String getAreaWiseSearch = '$baseUrl/area-wise-paginate-news?page=1&';
  static String keywordSearch = '$baseUrl/search-by-input-app?keyword=';
  static String newsDetails = '$baseUrl/news-details/';
}
