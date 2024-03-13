import 'package:crypto_price_tracker/services/crypto_service.dart';
import 'package:crypto_price_tracker/views/crypto_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/crypto_bloc.dart';
import 'blocs/app_events.dart';
import 'blocs/app_states.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coin Info App',
      home: RepositoryProvider(
        create: (context) => CryptoRepo(context),
        child: CryptoView(),
      ),
    );
  }
}
