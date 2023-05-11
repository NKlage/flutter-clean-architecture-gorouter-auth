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
    // for custom redirect
    // final authRepository = ref.read(AuthProviders.authRepository);
    final authRedirectService = ref.read(AuthProviders.authRedirectService);

    // configure route service
    final appRouteService = ref.read(CoreProviders.appRouterService)
      ..addRoutes(
        routes: [
          // Define initial route
          GoRoute(path: '/', redirect: (_, __) => '/dashboard'),
        ],
      )
      // add a List of Route Configurations
      ..addRouteConfigurations(
        routeConfigurations: [
          ref.read(AuthProviders.routes),
          ref.read(DashboardProviders.routes)
        ],
      )
      // or add single Routes
      // ..addRouteConfiguration(
      //   routeConfiguration: ref.read(AuthProviders.routes),
      // )
      // ..addRouteConfiguration(
      //   routeConfiguration: ref.read(DashboardProviders.routes),
      // )
      ..setRefreshListenable(ref.watch(AuthProviders.authStateNotifier))
      ..setRedirect(authRedirectService.redirect);
    // or use custom implementation
    // ..setRedirect((_, GoRouterState state) async {
    //   final currentUser = await authRepository.isUserAuthenticated();
    //   const loginRoute = '/login';
    //
    //   if (null == currentUser) {
    //     return loginRoute;
    //   }
    //
    //   if (loginRoute == state.location) {
    //     return '/';
    //   }
    //
    //   return null;
    // });

    return MaterialApp.router(
      routerConfig: appRouteService.router,
    );
  }
}
