import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain.dart'
    show ApplicationRouterService, ApplicationRouterServiceImpl;
import 'appwrite_project.dart';

/// Riverpod Providers from the Core Feature
class CoreProviders {
  // Data

  // Domain

  // Presentation

  // Shared
  /// Appwrite Client and Services
  static final Provider<AppwriteProject> appwrite = Provider(
    (ref) => AppwriteProject(),
  );

  /// Application Router Service
  static final Provider<ApplicationRouterService> appRouterService =
      Provider((ref) => ApplicationRouterServiceImpl());
}
