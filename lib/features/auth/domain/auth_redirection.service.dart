import 'package:go_router/go_router.dart';

import '../domain.dart';

/// Redirection depending on whether the user is logged in or not
class AuthRedirectionService {
  /// constructor
  AuthRedirectionService({required this.authRepository});

  /// [AuthRepository]
  final AuthRepository authRepository;

  /// redirect user
  Future<String?> redirect(_, GoRouterState state) async {
    final currentUser = await authRepository.isUserAuthenticated();
    const loginRoute = '/login';

    if (null == currentUser) {
      return loginRoute;
    }

    if (loginRoute == state.location) {
      return '/';
    }

    return null;
  }
}
