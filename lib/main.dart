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
    // Initialize Fluro router
    AppRoutes.configureRoutes();

    return MaterialApp(
      title: 'Crypto Price Tracker',
      onGenerateRoute: AppRoutes.router.generator,
      home: ChangeNotifierProvider(
        create: (context) => CryptoViewModel(),
        child: CryptoView(),
      ),
    );
  }
}
