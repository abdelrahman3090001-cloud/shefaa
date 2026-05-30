import 'package:flutter/foundation.dart';
import '../data/models/facility_model.dart';

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
  final List<FacilityModel> facilities;
  const GpsSuccess({required this.facilities});
}

class GpsError extends GpsState {
  final String error;
  const GpsError({required this.error});
}
