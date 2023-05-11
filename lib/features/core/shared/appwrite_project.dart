import 'package:appwrite/appwrite.dart';

/// Configure Appwrite Client for Project and deliver Appwrite Services e.g.
/// [Account], [Databases] ...
class AppwriteProject {
  static String get _apiUrl => 'https://your-appwrite-instance/v1';
  static String get _projectKey => 'your project key';

  static Client? _client;
  static Account? _account;

  /// Get Appwrite Client
  Client get client =>
      _client ?? Client(endPoint: _apiUrl).setProject(_projectKey);

  /// Get Appwrite Account
  Account get account => _account ?? Account(client);
}
