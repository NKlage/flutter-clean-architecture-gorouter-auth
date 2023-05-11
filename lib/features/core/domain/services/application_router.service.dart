import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../models/application_routes.dart';

/// Application routing Service
class ApplicationRouterService {
  final List<GoRoute> _routes = [];
  Listenable? _refreshListenable;
  FutureOr<String?> Function(BuildContext, GoRouterState)? _redirect;

  /// Get GoRouter instance
  GoRouter get router => GoRouter(
        routes: _routes,
        refreshListenable: _refreshListenable,
        redirect: _redirect,
      );

  /// Add additional Routes to GoRouter
  void addRoutes({required List<GoRoute> routes}) {
    _routes.addAll(routes);
  }

  /// Add route configuration from [ApplicationRoutes]
  void addRouteConfiguration({required ApplicationRoutes routeConfiguration}) {
    addRoutes(routes: routeConfiguration.routes());
  }

  /// Add a List of Route Configurations
  void addRouteConfigurations({
    required List<ApplicationRoutes> routeConfigurations,
  }) {
    for (final routeConfig in routeConfigurations) {
      addRoutes(routes: routeConfig.routes());
    }
  }

  /// set router refresh listenable
  // ignore: use_setters_to_change_properties
  void setRefreshListenable(Listenable? listenable) =>
      _refreshListenable = listenable;

  /// set redirect function callback
  // ignore: use_setters_to_change_properties
  void setRedirect(
    FutureOr<String?> Function(BuildContext, GoRouterState)? redirect,
  ) =>
      _redirect = redirect;
}
