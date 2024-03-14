import 'package:crypto_price_tracker/blocs/app_events.dart';
import 'package:crypto_price_tracker/models/crypto_model.dart';
import 'package:crypto_price_tracker/views/crypto_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:crypto_price_tracker/blocs/crypto_bloc.dart';
import 'package:crypto_price_tracker/blocs/app_states.dart';
import 'package:crypto_price_tracker/services/crypto_service.dart';
import 'package:flutter/material.dart';

class CryptoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:
            Color.fromARGB(255, 15, 71, 64), // Dark shade of background color
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 340, // Adjust height as needed
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/imgs/btn.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "Cryptocurrency Prices",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: CryptoListView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CryptoListView extends StatelessWidget {
  final List<String> cryptoNames = [
    'Bitcoin',
    'Ethereum',
    'Litecoin',
    'Ripple',
    'Bitcoin Cash',
    'Cardano',
    'Stellar',
    'Chainlink',
    'Polkadot',
    'Binance Coin',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cryptoNames.length,
      itemBuilder: (context, index) {
        final cryptoName = cryptoNames[index];
        return CryptoListItem(
          cryptoName: cryptoName,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CryptoDetailsPage(cryptoName: cryptoName),
              ),
            );
          },
        );
      },
    );
  }
}

class CryptoListItem extends StatelessWidget {
  final String cryptoName;
  final VoidCallback onTap;

  const CryptoListItem({
    required this.cryptoName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            cryptoName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
