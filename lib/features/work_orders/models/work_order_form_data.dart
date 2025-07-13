// lib/features/work_orders/models/work_order_form_data.dart

import 'package:equatable/equatable.dart';
import 'dart:io';

class WorkOrderFormData extends Equatable {
  final String? areaType;
  final String? areaName;
  final String? jobType;
  final bool permissionToEnter;
  final String description;
  final File? imageFile;

  const WorkOrderFormData({
    this.areaType,
    this.areaName,
    this.jobType,
    this.permissionToEnter = false,
    this.description = '',
    this.imageFile,
  });

  WorkOrderFormData copyWith({
    String? areaType,
    String? areaName,
    String? jobType,
    bool? permissionToEnter,
    String? description,
    File? imageFile,
  }) {
    return WorkOrderFormData(
      areaType: areaType ?? this.areaType,
      areaName: areaName ?? this.areaName,
      jobType: jobType ?? this.jobType,
      permissionToEnter: permissionToEnter ?? this.permissionToEnter,
      description: description ?? this.description,
      imageFile: imageFile ?? this.imageFile,
    );
  }

  @override
  List<Object?> get props => [
    areaType,
    areaName,
    jobType,
    permissionToEnter,
    description,
    imageFile,
  ];
}
