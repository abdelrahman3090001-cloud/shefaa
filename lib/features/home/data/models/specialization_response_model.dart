class SpecializationResponseModel {
  final String? message;
  final List<SpecializationData?>? specializationDataList;
  final bool? status;
  final int? code;

  SpecializationResponseModel({
    this.message,
    this.specializationDataList,
    this.status,
    this.code,
  });

  factory SpecializationResponseModel.fromJson(Map<String, dynamic> json) {
    return SpecializationResponseModel(
      message: json['message'] as String?,
      specializationDataList: (json['data'] as List<dynamic>?)
          ?.map((e) => e == null ? null : SpecializationData.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool?,
      code: json['code'] as int?,
    );
  }
}

class SpecializationData {
  final int? id;
  final String? name;
  final List<Doctors?>? doctorsList;

  SpecializationData({this.id, this.name, this.doctorsList});

  factory SpecializationData.fromJson(Map<String, dynamic> json) {
    return SpecializationData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      doctorsList: (json['doctors'] as List<dynamic>?)
          ?.map((e) => e == null ? null : Doctors.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Doctors {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? photo;
  final String? gender;
  final String? address;
  final String? description;
  final int? price;

  Doctors({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.address,
    this.description,
    this.price,
  });

  factory Doctors.fromJson(Map<String, dynamic> json) {
    return Doctors(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      photo: json['photo'] as String?,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
    );
  }
}
