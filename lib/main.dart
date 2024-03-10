import 'package:crypto_price_tracker/routes/routes.dart';
import 'package:crypto_price_tracker/viewmodels/crypto_viewmodel.dart';
import 'package:crypto_price_tracker/views/crypto_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      initialRoute: AppRoutes.crypto,
      routes: {
        AppRoutes.crypto: (context) => CryptoView(),
        // Add more routes as needed
      },
    );
  }
}
