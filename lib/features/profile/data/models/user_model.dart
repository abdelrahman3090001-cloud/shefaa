class UserModel {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String gender;
  final String country;
  final String language;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.gender,
    required this.country,
    required this.language,
  });

  // نسخة وهمية للبيانات حالياً
  factory UserModel.mock() {
    return UserModel(
      firstName: 'Ahmed',
      lastName: 'Mostafa',
      phoneNumber: '+20 01012345678',
      email: 'Ahmed.Mostafa@email.com',
      gender: 'Male',
      country: 'Egypt',
      language: 'English',
    );
  }
}
