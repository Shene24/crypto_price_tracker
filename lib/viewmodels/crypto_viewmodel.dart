import 'dart:convert';
import 'package:web_socket_channel/io.dart';

class CryptoViewModel {
  late IOWebSocketChannel _channel;

  CryptoViewModel() {
    _channel = IOWebSocketChannel.connect('wss://ws.kraken.com');
  }

  Stream<Map<String, dynamic>> get cryptoDataStream {
    return _channel.stream.map((event) {
      final Map<String, dynamic> data = json.decode(event);
      return data;
    });
  }

  void closeWebSocket() {
    _channel.sink.close();
  }
}
