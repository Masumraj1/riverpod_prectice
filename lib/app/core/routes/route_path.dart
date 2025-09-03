class RoutePath {
  static const String basePath = '/';
  static const String signIn = 'sign_in';
  static const String signUp = 'sign_up';
  static const String home = 'home';
}

extension RouteBasePathExt on String {
  String get addBasePath => RoutePath.basePath + this;
}
