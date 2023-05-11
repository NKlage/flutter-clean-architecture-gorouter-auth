import 'package:go_router/go_router.dart';

/// Interface to describe Routes in Application Features
// ignore: one_member_abstracts
abstract class ApplicationRoutes {
  /// get a list of defined [GoRoute] routes
  List<GoRoute> routes();
}
