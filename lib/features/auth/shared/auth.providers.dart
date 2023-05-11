import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/domain/models/application_routes.dart';
import '../../core/shared.dart';
import '../data.dart';
import '../domain.dart';
import '../shared.dart';
import 'auth_state_notifier.dart';

/// Riverpod Providers from the Auth Feature
class AuthProviders {
  // Data
  /// Authorization Remote Datasource
  static final Provider<AuthDatasource> authRemoteDatasource =
      Provider((ref) => AuthRemoteDatasource());

  // Domain
  /// Authorization Repository
  static final Provider<AuthRepository> authRepository = Provider(
    (ref) => AuthRepositoryImpl(
      appwriteProject: ref.read(
        CoreProviders.appwrite,
      ),
    ),
  );

  // Presentation

  // Shared

  /// Auth State Notifier
  static final ChangeNotifierProvider<AuthStateNotifier> authStateNotifier =
      ChangeNotifierProvider<AuthStateNotifier>((ref) {
    final authRepo = ref.read(authRepository);
    return AuthStateNotifier(userStream: authRepo.listen());
  });

  /// Authorization State
  static final StreamProvider<User?> authStateStream = StreamProvider((ref) {
    final authRepo = ref.read(authRepository);
    return authRepo.listen();
  });

  // Shared
  /// Routes
  static final Provider<ApplicationRoutes> routes =
      Provider<AuthRoutes>((_) => AuthRoutes());
}
