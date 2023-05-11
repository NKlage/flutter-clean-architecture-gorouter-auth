import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/services/application_router.service.dart';
import 'appwrite_project.dart';

/// Riverpod Providers from the Core Feature
class CoreProviders {
  // Data

  // Domain

  // Presentation

  // Shared
  /// Appwrite Project Client and Services
  static final Provider<AppwriteProject> appwrite = Provider(
    (ref) => AppwriteProject(),
  );

  /// Application Router Service
  static final Provider<ApplicationRouterService> appRouterService =
      Provider((ref) => ApplicationRouterService());
}
