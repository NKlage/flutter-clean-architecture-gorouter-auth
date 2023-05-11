import 'dart:async';

import 'package:appwrite/models.dart';
import 'package:flutter/foundation.dart';

import '../../core/shared.dart';
import '../domain/auth.repository.dart';

/// Auth Repository implementation, implements [AuthRepository]
class AuthRepositoryImpl implements AuthRepository {
  /// Constructor
  AuthRepositoryImpl({required this.appwriteProject});

  // Note: Use auth.datasource.dart instead AppwriteProject Object
  /// Appwrite Project Configurations and Service
  final AppwriteProject appwriteProject;

  final StreamController<User?> _userStreamController = StreamController();
  User? _currentUser;
  Session? _currentSession;

  @override
  Future<User?> isUserAuthenticated() async {
    try {
      final user = await appwriteProject.account.get();

      // Missing hash and equals implementations in Appwrite User model,
      // so user id is checked
      if (_currentUser?.$id != user.$id) {
        _currentUser = user;
        _userStreamController.add(_currentUser);
      }
    } catch (e) {
      if (null != _currentUser) {
        _currentUser = null;
        _userStreamController.add(_currentUser);
      }
    }

    return _currentUser;
  }

  @override
  Stream<User?> listen() => _userStreamController.stream;

  @override
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      _currentSession = await appwriteProject.account.createEmailSession(
        email: email,
        password: password,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
    await isUserAuthenticated();
  }

  @override
  Future<void> signOut({bool allSessions = false}) async {
    dynamic result;
    try {
      if (allSessions) {
        result = await appwriteProject.account.deleteSessions();
      } else {
        final sessionId = _currentSession?.$id ?? 'default';
        result =
            await appwriteProject.account.deleteSession(sessionId: sessionId);
      }
      _currentUser = null;
      _currentSession = null;
      _userStreamController.add(null);
      debugPrint('Delete Session Result: $result');
    } catch (e) {
      _currentUser = null;
      _currentSession = null;
      _userStreamController.add(null);
    }
  }

  @override
  void dispose() {
    _userStreamController.close();
  }

  @override
  User? get currentUser => _currentUser;

  @override
  Session? get userSession => _currentSession;
}
