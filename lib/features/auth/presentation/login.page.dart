import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/auth.providers.dart';

/// Login Page to authenticate User in Application
class LoginPage extends ConsumerWidget {
  /// Constructor
  LoginPage({super.key});

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Login Page'),
          ),
          Form(
            child: Column(
              children: [
                TextFormField(
                  controller: _emailTextController,
                  decoration: const InputDecoration(hintText: 'eMail'),
                ),
                TextFormField(
                  controller: _passwordTextController,
                  decoration: const InputDecoration(hintText: 'Password'),
                  obscureText: true,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () async {
              await ref
                  .read(AuthProviders.authRepository)
                  .loginWithEmailAndPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text,
                  );
            },
            child: const Text('Anmelden'),
          ),
        ],
      ),
    );
  }
}
