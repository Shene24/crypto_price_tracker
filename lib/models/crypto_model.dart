// crypto_model.dart
class CryptoModel {
  String name;
  String symbol;
  double price;
  double high;
  double low;
  double percentChange;

  CryptoModel({
    required this.name,
    required this.symbol,
    required this.price,
    required this.high,
    required this.low,
    required this.percentChange,
  });
}
