import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/work_order_repository.dart';
import '../services/work_order_api_service.dart';

final workOrderProvider = Provider((ref) {
  return WorkOrderRepository(WorkOrderApiService());
});
