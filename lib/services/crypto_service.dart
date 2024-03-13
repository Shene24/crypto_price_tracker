import 'dart:convert';
import 'package:crypto_price_tracker/models/crypto_model.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

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
    return channel.stream.where((data) => data is String).map((data) {
      try {
        List<dynamic> jsonList = json.decode(data);
        if (jsonList is List) {
          return jsonList
              .map((jsonData) => CryptoModel.fromJson(jsonData))
              .toList();
        }
      } catch (e) {
        print('Error decoding JSON: $e');
      }

      // Return an empty list if decoding fails or the data doesn't match expectations
      return [];
    });
  }
}
