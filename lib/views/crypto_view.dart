import 'package:crypto_price_tracker/blocs/app_events.dart';
import 'package:crypto_price_tracker/models/crypto_model.dart';
import 'package:crypto_price_tracker/views/crypto_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:crypto_price_tracker/blocs/crypto_bloc.dart';
import 'package:crypto_price_tracker/blocs/app_states.dart';
import 'package:crypto_price_tracker/services/crypto_service.dart';

@override
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
            SizedBox(
                height: 20), // Add some space between the image and the list
            Expanded(
              child: CryptoListView(), // List of the top 10 currencies
            ),
            CryptoSlider(), // Slider of each currency at the bottom
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
        return ListTile(
          title: Text(cryptoName),
          onTap: () {
            // Perform action when tapped, for example, navigate to details page
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CryptoDetailsPage(cryptoName: cryptoName)),
            );
          },
        );
      },
    );
  }
}

class CryptoSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You can implement a slider here with details of each currency
    return Container(
        // Slider implementation
        );
  }
}
