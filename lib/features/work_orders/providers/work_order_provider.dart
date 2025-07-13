import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinyiresidentfrontend/features/work_orders/models/work_order_state_model.dart';
import 'package:tinyiresidentfrontend/features/work_orders/notifiers/work_order_notifier.dart';
import 'package:tinyiresidentfrontend/features/work_orders/repositories/work_order_repository.dart';
import 'package:tinyiresidentfrontend/features/work_orders/services/work_order_api_service.dart';

final workOrderNotifierProvider =
    StateNotifierProvider<WorkOrderNotifier, WorkOrderState>((ref) {
      final apiService = WorkOrderApiService();
      final repository = WorkOrderRepository(apiService);
      return WorkOrderNotifier(repository);
    });
