// lib/features/work_orders/notifiers/work_order_notifier.dart

import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinyiresidentfrontend/features/work_orders/models/work_order_state_model.dart';
import 'package:tinyiresidentfrontend/features/work_orders/repositories/work_order_repository.dart';

class WorkOrderNotifier extends StateNotifier<WorkOrderState> {
  final WorkOrderRepository repository;

  WorkOrderNotifier(this.repository)
    : super(
        const WorkOrderState(
          isLoading: false,
          success: false,
          errorMessage: null,
        ),
      );

  void updateAreaType(String? value) {
    if (value == null) return;
    state = state.copyWith(formData: state.formData.copyWith(areaType: value));
  }

  void updateAreaName(String? value) {
    state = state.copyWith(formData: state.formData.copyWith(areaName: value));
  }

  void updateJobType(String? value) {
    if (value == null) return;
    state = state.copyWith(formData: state.formData.copyWith(jobType: value));
  }

  void updatePermissionToEnter(bool value) {
    state = state.copyWith(
      formData: state.formData.copyWith(permissionToEnter: value),
    );
  }

  void updateDescription(String value) {
    state = state.copyWith(
      formData: state.formData.copyWith(description: value),
    );
  }

  void updateImage(File? file) {
    state = state.copyWith(formData: state.formData.copyWith(imageFile: file));
  }

  // --- Existing submit logic remains unchanged ---
  Future<void> submitWorkOrder({
    required String jobType,
    required String areaType,
    required String areaName,
    required String description,
    required bool permissionToEnter,
    File? imageFile,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null, success: false);
    try {
      await repository.submitWorkOrder(
        jobType: jobType,
        areaType: areaType,
        areaName: areaName,
        description: description,
        permissionToEnter: permissionToEnter,
        imageFile: imageFile,
      );
      state = state.copyWith(isLoading: false, success: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}
