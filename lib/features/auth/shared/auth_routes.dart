import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../core/domain.dart';
import '../presentation/login.page.dart';

/// Routes for the auth Feature
class AuthRoutes implements ApplicationRoutes {
  @override
  List<GoRoute> get routes => [
        GoRoute(
          path: '/login',
          builder: (BuildContext context, GoRouterState state) {
            return LoginPage();
          },
        ),
      ];
}
