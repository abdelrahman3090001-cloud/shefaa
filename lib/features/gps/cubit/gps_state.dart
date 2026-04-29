import 'package:flutter/foundation.dart';

@immutable
abstract class GpsState {
  const GpsState();
}

class GpsInitial extends GpsState {
  const GpsInitial();
}

class GpsLoading extends GpsState {
  const GpsLoading();
}

class GpsSuccess extends GpsState {
  final List<dynamic> facilities;
  const GpsSuccess({required this.facilities});
}

class GpsError extends GpsState {
  final String error;
  const GpsError({required this.error});
}
