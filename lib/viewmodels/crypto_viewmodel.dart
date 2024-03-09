// crypto_viewmodel.dart
import 'package:flutter/foundation.dart';
import 'package:crypto_price_tracker/models/crypto_model.dart';

class CryptoViewModel extends ChangeNotifier {
  CryptoModel _cryptoData = CryptoModel(
    name: '',
    symbol: '',
    price: 0.0,
    high: 0.0,
    low: 0.0,
    percentChange: 0.0,
  );

  CryptoModel get cryptoData => _cryptoData;

  // Method to update cryptocurrency data
  void updateCryptoData({
    required String name,
    required String symbol,
    required double price,
    required double high,
    required double low,
    required double percentChange,
  }) {
    _cryptoData = CryptoModel(
      name: name,
      symbol: symbol,
      price: price,
      high: high,
      low: low,
      percentChange: percentChange,
    );

    // Notify listeners (Views) about the change
    notifyListeners();
  }

  // Example method for fetching initial data (replace with your logic)
  Future<void> fetchData() async {
    // Simulate fetching data from an API (replace with actual API calls)
    // For demonstration purposes, we're using a delay to simulate network latency
    await Future.delayed(Duration(seconds: 2));

    // Update the model with fetched data
    updateCryptoData(
      name: 'Bitcoin',
      symbol: 'BTC',
      price: 45000.0,
      high: 46000.0,
      low: 44000.0,
      percentChange: 2.0,
    );
  }

  void fetchDataForSymbol(String symbol) {}
}
