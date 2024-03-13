class CryptoModel {
  final String name;
  final String price;
  final String high;
  final String low;
  final String change;

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
