import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/domain.dart';
import '../data.dart';
import '../domain.dart';
import 'dashboard_routes.dart';

/// Dashboard Provider
class DashboardProviders {
  // Data

  /// Dashboard remote datasource
  static final Provider<DashboardDatasource> dashboardRemoteDatasource =
      Provider((ref) => DashboardRemoteDatasource());

  // Domain
  /// Dashboard Repository
  static final Provider<DashboardRepository> dashboardRepository =
      Provider((ref) => DashboardRepositoryImpl());

  // Presentation

  // Shared
  /// Routes
  static final Provider<ApplicationRoutes> routes =
      Provider<DashboardRoutes>((_) => DashboardRoutes());
}
