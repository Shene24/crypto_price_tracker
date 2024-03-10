import 'package:crypto_price_tracker/views/crypto_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/crypto':
        // Extract parameter from settings.arguments
        final crypto = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => CryptoView(crypto: crypto),
        );
      // Add more routes as needed
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Route not found'),
            ),
          ),
        );
    }
  }
}
