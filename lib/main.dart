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
      title: 'Crypto App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/crypto': (context) {
          final Map<String, dynamic> args = ModalRoute.of(context)!
              .settings
              .arguments as Map<String, dynamic>;
          return CryptoPage(cryptoId: args['cryptoId']);
        },
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/crypto',
                arguments: {'cryptoId': 'btc'});
          },
          child: Text('View Bitcoin Prices'),
        ),
      ),
    );
  }
}
