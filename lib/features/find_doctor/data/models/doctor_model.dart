class DoctorModel {
  final String name;
  final String specialization;
  final String rating;
  final String image;
  final String description;
  final String location;
  final String price;
  final List<String> availableTimes;

  DoctorModel({
    required this.name,
    required this.specialization,
    required this.rating,
    required this.image,
    required this.description,
    required this.location,
    required this.price,
    required this.availableTimes,
  });
}
