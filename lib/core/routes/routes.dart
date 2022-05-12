import 'package:auto_route/annotations.dart';
import 'package:netflix_ui/Homepage.dart';
import 'package:netflix_ui/screens/onboading.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(
    page: OnboadingPage,
    initial: true,
  ),
  AutoRoute(
    page: HomePage,
  ),
])
class $AppRouter {}
