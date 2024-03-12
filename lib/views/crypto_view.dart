import 'package:crypto_price_tracker/viewmodels/crypto_viewmodel.dart';
import 'package:flutter/material.dart';

class CryptoPage extends StatefulWidget {
  final String cryptoId;

  CryptoPage({required this.cryptoId});

  @override
  _CryptoPageState createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  late CryptoViewModel _cryptoViewModel;
  late Stream<Map<String, dynamic>> _cryptoDataStream;

  @override
  void initState() {
    super.initState();
    _cryptoViewModel = CryptoViewModel();
    _cryptoDataStream = _cryptoViewModel.cryptoDataStream;
  }

  @override
  void dispose() {
    _cryptoViewModel.closeWebSocket();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Prices'),
      ),
      body: Center(
        child: StreamBuilder<Map<String, dynamic>>(
          stream: _cryptoDataStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final cryptoData = snapshot.data!;
              // Adjust keys based on the actual structure of Kraken API response
              final currentPrice =
                  cryptoData['result'][widget.cryptoId]['c'][0];
              final high = cryptoData['result'][widget.cryptoId]['h'][0];
              final low = cryptoData['result'][widget.cryptoId]['l'][0];
              final percentageChange =
                  cryptoData['result'][widget.cryptoId]['p'][0];

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Current Price: $currentPrice'),
                  Text('High: $high'),
                  Text('Low: $low'),
                  Text('Percentage Change: $percentageChange'),
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
