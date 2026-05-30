import '../data/models/user_profile_model.dart';

abstract class Profil2State {}

class Profil2Initial extends Profil2State {}

class Profil2Loading extends Profil2State {}

class Profil2Success extends Profil2State {
  final UserProfileModel userProfile;
  Profil2Success(this.userProfile);
}

class Profil2Error extends Profil2State {
  final String error;
  Profil2Error(this.error);
}

class ChangePasswordLoading extends Profil2State {}

class ChangePasswordSuccess extends Profil2State {}

class ChangePasswordError extends Profil2State {
  final String error;
  ChangePasswordError(this.error);
}
