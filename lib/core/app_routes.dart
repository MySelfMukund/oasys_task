import 'package:flutter/material.dart';
import 'package:pokemon_card_list/presentations/ui/home_page/home_page.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      case HomePage.routeName:
        return HomePage.route(settings);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        //appBar: AppBar(title: const Text('Error')),
        body: Center(child: Text('Error Page')),
      ),
    );
  }
}
