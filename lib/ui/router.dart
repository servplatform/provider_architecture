import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider_start/core/constant/view_routes.dart';
import 'package:provider_start/ui/views/login/login_view.dart';
import 'package:provider_start/ui/views/main_view.dart';

/// Class that generates routes for the application
///   - Routes are generated by the list of routes in the app
///   - Routes can also require paramaters. e.g. `PostDetailView(post: post)`
class Router {
  static Route<dynamic> generateRoute(
    BuildContext context,
    RouteSettings settings,
  ) {
    return platformPageRoute(
      context: context,
      settings: RouteSettings(name: settings.name),
      builder: (context) => _generateView(settings),
      fullscreenDialog: _fullScreenDialogs.contains(settings.name),
    );
  }

  static Widget _generateView(RouteSettings settings) {
    switch (settings.name) {

      // Tab Views
      case ViewRoutes.main:
        return MainView();
      case ViewRoutes.login:
        return LoginView();

      default:
        return Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }
  }

  // Add routes that should behave as fullScreenDialogs
  static final _fullScreenDialogs = [
    // Routes.route_1,
    // Routes.route_2,
  ];
}
