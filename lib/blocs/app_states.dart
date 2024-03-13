import 'package:crypto_price_tracker/models/crypto_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AppState {}

class AppLoadingState extends AppState {}

class AppLoadedState extends AppState {
  final CryptoModel data;
  AppLoadedState(this.data);
}

class ExchangeErrorState extends AppState {
  final String error;
  ExchangeErrorState(this.error);
}
