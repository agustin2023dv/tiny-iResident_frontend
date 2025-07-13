// lib/features/work_order/models/personal_info_model.dart

class PersonalInfo {
  final String residentName;
  final String propertyName;
  final String building;
  final String unit;
  final String address;

  const PersonalInfo({
    required this.residentName,
    required this.propertyName,
    required this.building,
    required this.unit,
    required this.address,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return PersonalInfo(
      residentName: json['resident_name'],
      propertyName: json['property_name'],
      building: json['building'],
      unit: json['unit'],
      address: json['address'],
    );
  }
}
