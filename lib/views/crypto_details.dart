import 'package:crypto_price_tracker/models/crypto_model.dart';
import 'package:flutter/material.dart';

class CryptoDetailsPage extends StatelessWidget {
  final String cryptoName;

  CryptoDetailsPage({required this.cryptoName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Details'),
      ),
      body: Center(
        child: Text('Details for $cryptoName'),
      ),
    );
  }
}
