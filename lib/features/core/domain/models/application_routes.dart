import 'package:go_router/go_router.dart';

/// Interface to describe Routes in Application Features
abstract class ApplicationRoutes {
  /// get a list of defined [GoRoute] routes
  List<GoRoute> get routes;
  // List<GoRoute> routes();
}
