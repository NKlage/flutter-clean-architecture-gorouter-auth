import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/shared.dart' show AuthProviders;

/// Dashboard Page
class DashboardPage extends ConsumerWidget {
  /// constructor
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('Protected  Dashboard'),
            ),
            ElevatedButton(
              onPressed: () async {
                await ref
                    .read(AuthProviders.authRepository)
                    .signOut(allSessions: true);
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
