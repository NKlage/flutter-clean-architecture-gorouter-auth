import 'package:appwrite/appwrite.dart';

/// Configure Appwrite Client for Project and deliver Appwrite Services e.g.
/// [Account], [Databases] ...
class AppwriteProject {
  static String get _apiUrl => const String.fromEnvironment('APPWRITE_URL');
  static String get _projectKey => const String.fromEnvironment('PROJECT_ID');

  /// Get Appwrite Client
  Client get client => Client(endPoint: _apiUrl).setProject(_projectKey);

  /// Get Appwrite Account
  Account get account => Account(client);
}
