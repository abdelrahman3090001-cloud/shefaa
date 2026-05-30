import 'package:flutter/foundation.dart';

@immutable
abstract class DependentMedicalHistoryState {
  const DependentMedicalHistoryState();
}

class DependentMedicalHistoryInitial extends DependentMedicalHistoryState {
  const DependentMedicalHistoryInitial();
}

class DependentMedicalHistoryLoading extends DependentMedicalHistoryState {
  const DependentMedicalHistoryLoading();
}

class DependentMedicalHistorySuccess extends DependentMedicalHistoryState {
  const DependentMedicalHistorySuccess();
}

class DependentMedicalHistoryError extends DependentMedicalHistoryState {
  final String error;
  const DependentMedicalHistoryError({required this.error});
}
