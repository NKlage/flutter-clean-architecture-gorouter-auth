import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/shared.dart';

/// Dashboard Page
class DashboardPage extends ConsumerWidget {
  /// constructor
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Protected  Dashboard'),
          ElevatedButton(
            onPressed: () async {
              await ref.read(AuthProviders.authRepository).signOut();
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
