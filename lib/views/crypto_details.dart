import 'package:crypto_price_tracker/models/crypto_model.dart';
import 'package:flutter/material.dart';

class CryptoDetailsPage extends StatelessWidget {
  final String cryptoName;

  const CryptoDetailsPage({required this.cryptoName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Crypto Details')),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        color:
            Color.fromARGB(255, 15, 71, 64), // Dark shade of background color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cryptoName,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // Add more widgets to display additional details like price, percentage change, etc.
            ],
          ),
        ),
      ),
    );
  }
}
