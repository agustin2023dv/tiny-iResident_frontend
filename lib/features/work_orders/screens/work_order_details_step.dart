// lib/features/work_orders/screens/work_order_details_step.dart

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tinyiresidentfrontend/core/navigation/app_routes.dart';
import 'package:tinyiresidentfrontend/features/work_orders/providers/work_order_provider.dart';
import 'package:tinyiresidentfrontend/shared/widgets/back_button_widget.dart';
import 'package:tinyiresidentfrontend/shared/widgets/next_button_widget.dart';
import 'package:tinyiresidentfrontend/shared/widgets/custom_dropdown.dart';
import 'package:tinyiresidentfrontend/shared/widgets/custom_input_field.dart';
import 'package:tinyiresidentfrontend/shared/widgets/step_indicator.dart';
import 'package:tinyiresidentfrontend/features/work_orders/widgets/title_widget.dart';

class WorkOrderDetailsStep extends ConsumerStatefulWidget {
  const WorkOrderDetailsStep({super.key});

  @override
  ConsumerState<WorkOrderDetailsStep> createState() =>
      _WorkOrderDetailsStepState();
}

class _WorkOrderDetailsStepState extends ConsumerState<WorkOrderDetailsStep> {
  final _formKey = GlobalKey<FormState>();

  String? _areaType;
  String? _areaName;
  String? _jobType;
  bool _permissionToEnter = false;
  String? _description;
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _selectedImage = File(picked.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(workOrderNotifierProvider.notifier);
    final navigator = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Work Order')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const StepIndicator(currentStep: 2),
              const SizedBox(height: 24),
              const TitleWidget(text: 'Work Order Details'),
              CustomDropdown(
                label: 'Area Type',
                value: _areaType,
                items: const ['UNIT', 'COMMON_AREA'],
                onChanged: (val) => setState(() => _areaType = val),
              ),
              CustomInputField(
                label: 'Area',
                onChanged: (val) => _areaName = val,
              ),
              CustomDropdown(
                label: 'Job',
                value: _jobType,
                items: const ['plumbing', 'electrical', 'hvac', 'other'],
                onChanged: (val) => setState(() => _jobType = val),
              ),
              CheckboxListTile(
                title: const Text('Permission to enter'),
                value: _permissionToEnter,
                onChanged: (val) =>
                    setState(() => _permissionToEnter = val ?? false),
              ),
              const SizedBox(height: 16),
              const TitleWidget(text: 'Notes and Attachments'),
              CustomInputField(
                label: 'Job Notes',
                maxLines: 3,
                onChanged: (val) => _description = val,
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _selectedImage != null
                      ? Image.file(_selectedImage!, fit: BoxFit.cover)
                      : const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image_outlined),
                              SizedBox(height: 4),
                              Text(
                                'Upload a photo\nFiles supported: JPG, PNG',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButtonWidget(onPressed: () => navigator.pop()),
                  NextButtonWidget(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await notifier.submitWorkOrder(
                          jobType: _jobType!,
                          areaType: _areaType!,
                          areaName: _areaName!,
                          description: _description ?? '',
                          permissionToEnter: _permissionToEnter,
                          imageFile: _selectedImage,
                        );
                        if (mounted &&
                            ref.read(workOrderNotifierProvider).success) {
                          navigator.pushNamed(AppRoutes.workOrderSummary);
                        }
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
