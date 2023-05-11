import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared.dart';

/// Login Page to authenticate User in Application
class LoginPage extends ConsumerWidget {
  /// Constructor
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Login Page'),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () async {
              await ref
                  .read(AuthProviders.authRepository)
                  .loginWithEmailAndPassword(
                    email: 'test@user.dev',
                    password: 'Start-1234',
                  );
            },
            child: const Text('Anmelden'),
          ),
        ],
      ),
    );
  }
}
