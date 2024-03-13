class CryptoModel {
  final String name;
  final double price;
  final double high;
  final double low;
  final double change;

  CryptoModel({
    required this.name,
    required this.price,
    required this.high,
    required this.low,
    required this.change,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
      name: json['Name'],
      price: json['Price'],
      high: json['High'],
      low: json['Low'],
      change: json['Change'],
    );
  }
}
