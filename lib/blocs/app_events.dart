import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AppEvent extends Equatable {
  const AppEvent();
}

//event to load data
class AppLoad extends AppEvent {
  @override
  List<Object> get props => [];
}
