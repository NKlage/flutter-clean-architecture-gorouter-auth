import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'features/auth/shared.dart';
import 'features/core/shared.dart';
import 'features/dashboard/shared.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MainApp()));
}

/// Main Application
class MainApp extends ConsumerWidget {
  /// constructor
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.read(AuthProviders.authRepository);

    final appRouteService = ref.read(CoreProviders.appRouterService)
      ..addRoutes(
        routes: [
          // Define initial route
          GoRoute(path: '/', redirect: (_, __) => '/dashboard'),
        ],
      )
      ..addRouteConfiguration(
        routeConfiguration: ref.read(AuthProviders.routes),
      )
      ..addRouteConfiguration(
        routeConfiguration: ref.read(DashboardProviders.routes),
      )
      ..setRefreshListenable(ref.watch(AuthProviders.authStateNotifier))
      // Comes from the auth feature or a custom implementation
      ..setRedirect((_, GoRouterState state) async {
        final currentUser = await authService.isUserAuthenticated();
        const loginRoute = '/login';

        if (null == currentUser) {
          return loginRoute;
        }

        if (loginRoute == state.location) {
          return '/';
        }

        return null;
      });

    return MaterialApp.router(
      routerConfig: appRouteService.router,
    );
  }
}
