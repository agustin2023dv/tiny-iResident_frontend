// lib/features/work_orders/models/work_order_state_model.dart

import 'package:equatable/equatable.dart';
import 'package:tinyiresidentfrontend/features/work_orders/models/work_order_form_data.dart';

class WorkOrderState extends Equatable {
  final bool isLoading;
  final bool success;
  final String? errorMessage;
  final WorkOrderFormData formData;

  const WorkOrderState({
    this.isLoading = false,
    this.success = false,
    this.errorMessage,
    WorkOrderFormData? formData,
  }) : formData = formData ?? const WorkOrderFormData();

  WorkOrderState copyWith({
    bool? isLoading,
    bool? success,
    String? errorMessage,
    WorkOrderFormData? formData,
  }) {
    return WorkOrderState(
      isLoading: isLoading ?? this.isLoading,
      success: success ?? this.success,
      errorMessage: errorMessage ?? this.errorMessage,
      formData: formData ?? this.formData,
    );
  }

  @override
  List<Object?> get props => [isLoading, success, errorMessage, formData];
}
