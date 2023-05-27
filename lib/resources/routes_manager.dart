import 'package:flutter/material.dart';
import 'package:pro_med_test/add_page.dart';
import 'package:pro_med_test/model.dart';
import 'package:pro_med_test/profile.dart';
import 'package:pro_med_test/widgets/map.dart';

class Routes {
  static const String profileRoute = '/';
  static const String addRoute = '/add';
  static const String setLocationOnMapRoute = '/setLocationOnMap';
}

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouter()
      : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(configuration) async => {};

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      onGenerateRoute: generateRoute,
      pages: const [...[
        MaterialPage(
            name: Routes.profileRoute,
            key: ValueKey(Routes.profileRoute),
            child: ProfilePage()),
        ]
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    return true;
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.addRoute:
        return MaterialPageRoute(builder: (_) => const AddPage());
      case Routes.setLocationOnMapRoute:
        return MaterialPageRoute(builder: (_) => SetLocationOnMap(mapModel: args as MapModel,));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                body: SafeArea(child: Text('Route Error ${settings.name}'))));
    }
  }
}