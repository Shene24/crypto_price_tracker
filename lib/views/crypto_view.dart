import 'package:crypto_price_tracker/viewmodels/crypto_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CryptoView extends StatefulWidget {
  @override
  _CryptoViewState createState() => _CryptoViewState();
}

class _CryptoViewState extends State<CryptoView> {
  late WebSocketChannel channel; // Declare a WebSocketChannel

  @override
  void initState() {
    super.initState();
    // Initialize the WebSocket connection in the initState method
    channel = WebSocketChannel.connect(
      Uri.parse('wss://api.kraken.com/0/public/Ticker'),
    );
  }

  @override
  void dispose() {
    // Close the WebSocket connection when the widget is disposed
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use Provider to obtain the CryptoViewModel
    CryptoViewModel cryptoViewModel = Provider.of<CryptoViewModel>(context);

    // Extract the cryptocurrency symbol from the URL parameters
    final Map<String, dynamic>? params =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (params != null) {
      String symbol = params['symbol'] ?? '';
      // Fetch data for the specified cryptocurrency symbol
      cryptoViewModel.fetchDataForSymbol(symbol);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Price Tracker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display cryptocurrency data using CryptoViewModel
            // ...
            Text(
              cryptoViewModel.cryptoData.name,
              style: TextStyle(fontSize: 24),
            ),
            Text(
              cryptoViewModel.cryptoData.symbol,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Price: \$${cryptoViewModel.cryptoData.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'High: \$${cryptoViewModel.cryptoData.high.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Low: \$${cryptoViewModel.cryptoData.low.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Change: ${cryptoViewModel.cryptoData.percentChange.toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 20),
            ),

            // Display cryptocurrency data using WebSocket
          ],
        ),
      ),
    );
  }
}
