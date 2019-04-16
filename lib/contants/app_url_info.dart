
abstract class AppInfos {
  static const String CLIENT_ID = 'XoL7MTbDCb3uvc2vx4nF'; //应用id
  static const String CLIENT_SECRET = '4rHQ1sJh00wDi1pvpwtyrixzNiqrJK5Q'; //应用密钥
  static const String REDIRECT_URI = 'https://www.baidu.com/'; //回调地址
}

abstract class AppUrls {
  static const String HOST = 'https://www.oschina.net';

  //授权登录 ctrl shift u
  static const String OAUTH2_AUTHORIZE = HOST + '/action/oauth2/authorize';
  //获取token
  static const String OAUTH2_TOKEN = HOST + '/action/openapi/token';
  //获取用户信息
  static const String OPENAPI_USER = HOST + '/action/openapi/user';

  static const String MY_INFORMATION = HOST + '/action/openapi/my_information';
  static const String MESSAGE_LIST = HOST + '/action/openapi/message_list';
  static const String NEWS_LIST = HOST + '/action/openapi/news_list';
}
