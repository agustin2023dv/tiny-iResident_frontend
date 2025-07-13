import 'dart:io';

class WorkOrderFormController {
  String? areaType;
  String? areaName;
  String? jobType;
  bool permissionToEnter = false;
  String? description;
  File? imageFile;

  bool get isValid => areaType != null && areaName != null && jobType != null;

  void updateAreaType(String? value) => areaType = value;
  void updateAreaName(String? value) => areaName = value;
  void updateJobType(String? value) => jobType = value;
  void updatePermission(bool value) => permissionToEnter = value;
  void updateDescription(String? value) => description = value;
  void updateImage(File? file) => imageFile = file;
}
