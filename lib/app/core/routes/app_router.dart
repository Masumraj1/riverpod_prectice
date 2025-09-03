import 'package:go_router/go_router.dart';

import '../../features/auth/presentaion/pages/sign_in_page.dart';
import '../../features/auth/presentaion/pages/sign_up_page.dart';
import 'route_path.dart';

class AppRouter {
  static final GoRouter initRoute = GoRouter(
    initialLocation: RoutePath.signIn.addBasePath,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: RoutePath.signIn,
        path: RoutePath.signIn.addBasePath,
        builder: (context, state) =>  SignInPage(),
      ),
      GoRoute(
        name: RoutePath.signUp,
        path: RoutePath.signUp.addBasePath,
        builder: (context, state) =>  SignUpPage(),
      ),

    ],
  );

  static GoRouter get route => initRoute;
}
