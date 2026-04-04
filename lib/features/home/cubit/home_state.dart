import 'package:flutter/foundation.dart';

@immutable
abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeSuccess extends HomeState {
  final List<dynamic> appointments;
  final List<dynamic> facilities;
  const HomeSuccess({required this.appointments, required this.facilities});
}

class HomeError extends HomeState {
  final String error;
  const HomeError({required this.error});
}
