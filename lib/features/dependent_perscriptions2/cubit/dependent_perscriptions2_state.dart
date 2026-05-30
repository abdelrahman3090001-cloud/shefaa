import 'package:flutter/foundation.dart';

@immutable
abstract class DependentPrescriptions2State {
  const DependentPrescriptions2State();
}

class DependentPrescriptions2Initial extends DependentPrescriptions2State {
  const DependentPrescriptions2Initial();
}

class DependentPrescriptions2Loading extends DependentPrescriptions2State {
  const DependentPrescriptions2Loading();
}

class DependentPrescriptions2Success extends DependentPrescriptions2State {
  const DependentPrescriptions2Success();
}

class DependentPrescriptions2Error extends DependentPrescriptions2State {
  final String error;
  const DependentPrescriptions2Error({required this.error});
}
