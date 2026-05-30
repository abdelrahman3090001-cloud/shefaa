import 'package:flutter/foundation.dart';

@immutable
abstract class DependentAppointmentsState {
  const DependentAppointmentsState();
}

class DependentAppointmentsInitial extends DependentAppointmentsState {
  const DependentAppointmentsInitial();
}

class DependentAppointmentsLoading extends DependentAppointmentsState {
  const DependentAppointmentsLoading();
}

class DependentAppointmentsSuccess extends DependentAppointmentsState {
  const DependentAppointmentsSuccess();
}

class DependentAppointmentsError extends DependentAppointmentsState {
  final String error;
  const DependentAppointmentsError({required this.error});
}
