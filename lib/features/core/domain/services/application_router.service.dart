import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../domain.dart';

/// Application routing Service
// ignore_for_file: use_setters_to_change_properties
abstract class ApplicationRouterService {
  /// Get GoRouter instance
  GoRouter get router;

  /// Add additional Routes to GoRouter
  void addRoutes({required List<GoRoute> routes});

  /// Add route configuration from [ApplicationRoutes]
  void addRouteConfiguration({required ApplicationRoutes routeConfiguration});

  /// Add a List of Route Configurations
  void addRouteConfigurations({
    required List<ApplicationRoutes> routeConfigurations,
  });

  /// set router refresh listenable
  void setRefreshListenable(Listenable? listenable);

  /// set redirect function callback
  void setRedirect(
    FutureOr<String?> Function(BuildContext, GoRouterState)? redirect,
  );
}
