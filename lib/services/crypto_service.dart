import 'dart:convert';
import 'package:crypto_price_tracker/models/crypto_model.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:http/http.dart';

class CryptoRepo {
  final BuildContext context;
  final WebSocketChannel channel;

  CryptoRepo(this.context)
      : channel = WebSocketChannel.connect(
          Uri.parse('wss://ws.kraken.com'),
        ) {
    channel.sink.add(
      '{"event":"subscribe", "pair":["XBT/USD"], "subscription":{"name":"ticker"}}',
    );
  }

  Stream<List<CryptoModel>> getExchangeStream() {
    return channel.stream
        .where((data) => data is String && data.startsWith("["))
        .map((data) {
      try {
        List<dynamic> jsonData = json.decode(data);
        if (jsonData.length > 1) {
          // Skip the first item (handle based on Kraken API documentation)
          List<CryptoModel> cryptoList = jsonData
              .sublist(1)
              .map((jsonItem) {
                try {
                  return CryptoModel.fromJson(jsonItem);
                } catch (e) {
                  print('Error creating CryptoModel: $e');
                  return null;
                }
              })
              .whereType<CryptoModel>()
              .toList();

          return cryptoList;
        } else {
          print('Unexpected JSON format or insufficient data: $jsonData');
        }
      } catch (e) {
        print('Error decoding JSON: $e');
      }
      return []; // Return empty list on error or unexpected data
    });
  }

  void closeConnection() {
    channel.sink.close();
  }
}
