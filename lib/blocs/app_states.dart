import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AppState extends Equatable {}

//data loading state
class AppLoadingState extends AppState {
  @override
  List<Object> get props => [];
}

//data loaded state
class AppLoadedState extends AppState {
  @override
  List<Object> get props => [];
}

//data error state
class AppErrorState extends AppState {
  final String error;

  AppErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
