import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../core/domain.dart' show ApplicationRoutes;
import '../presentation.dart';

/// Routes for the auth Feature
class DashboardRoutes implements ApplicationRoutes {
  @override
  List<GoRoute> routes() => [
        GoRoute(
          path: '/dashboard',
          builder: (BuildContext context, GoRouterState state) {
            return const DashboardPage();
          },
        ),
      ];
}
