// lib/features/work_orders/screens/work_order_summary_step.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinyiresidentfrontend/features/work_orders/providers/personal_info_provider.dart';
import 'package:tinyiresidentfrontend/features/work_orders/providers/work_order_provider.dart';
import 'package:tinyiresidentfrontend/features/work_orders/screens/personal_information_step.dart';
import 'package:tinyiresidentfrontend/features/work_orders/widgets/summary_card.dart';
import 'package:tinyiresidentfrontend/features/work_orders/widgets/summary_row.dart';
import 'package:tinyiresidentfrontend/shared/widgets/back_button_widget.dart';

class WorkOrderSummaryStep extends ConsumerWidget {
  const WorkOrderSummaryStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personalInfoAsync = ref.watch(personalInfoProvider);
    final workOrderState = ref.watch(workOrderNotifierProvider);
    final notifier = ref.watch(workOrderNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Work Order')),
      body: personalInfoAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
        data: (info) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const StepIndicator(currentStep: 3),
                const SizedBox(height: 24),

                // ✅ Final submission button
                ElevatedButton(
                  onPressed: workOrderState.isLoading
                      ? null
                      : () async {
                          await notifier.submitWorkOrder(
                            jobType: workOrderState.formData.jobType ?? '',
                            areaType: workOrderState.formData.areaType ?? '',
                            areaName: workOrderState.formData.areaName ?? '',
                            description: workOrderState.formData.description,
                            permissionToEnter:
                                workOrderState.formData.permissionToEnter,
                            imageFile: workOrderState.formData.imageFile,
                          );

                          if (context.mounted && workOrderState.success) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/work-order/success',
                              (route) => false,
                            );
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: workOrderState.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Save and Send Work Order'),
                ),

                const SizedBox(height: 24),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Summary',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                SummaryCard(
                  title: 'Personal Details',
                  children: [
                    SummaryRow(label: 'Resident:', value: info.residentName),
                    SummaryRow(
                      label: 'Project Name:',
                      value: info.propertyName,
                    ),
                    SummaryRow(label: 'Building:', value: info.building),
                    SummaryRow(label: 'Address:', value: info.address),
                    SummaryRow(label: 'Unit:', value: info.unit),
                  ],
                ),
                const SizedBox(height: 16),
                SummaryCard(
                  title: 'Work Order Details',
                  children: [
                    SummaryRow(
                      label: 'Area Type:',
                      value: workOrderState.formData.areaType ?? '',
                    ),
                    SummaryRow(
                      label: 'Area:',
                      value: workOrderState.formData.areaName ?? '',
                    ),
                    SummaryRow(
                      label: 'Job:',
                      value: workOrderState.formData.jobType ?? '',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SummaryCard(
                  title: 'Notes and Attachments',
                  children: [
                    SummaryRow(
                      label: 'Notes:',
                      value: workOrderState.formData.description,
                    ),
                    if (workOrderState.formData.imageFile != null)
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.check_circle, color: Colors.green),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                workOrderState.formData.imageFile!.path
                                    .split('/')
                                    .last,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const Text('100%'),
                          ],
                        ),
                      ),
                  ],
                ),
                const Spacer(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [BackButtonWidget()],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
