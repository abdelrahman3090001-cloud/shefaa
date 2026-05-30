import 'package:flutter/foundation.dart';

@immutable
abstract class GuardianHomeState {
  const GuardianHomeState();
}

class GuardianHomeInitial extends GuardianHomeState {
  const GuardianHomeInitial();
}

class GuardianHomeLoading extends GuardianHomeState {
  const GuardianHomeLoading();
}

class GuardianHomeSuccess extends GuardianHomeState {
  const GuardianHomeSuccess();
}

class GuardianHomeError extends GuardianHomeState {
  final String error;
  const GuardianHomeError({required this.error});
}
