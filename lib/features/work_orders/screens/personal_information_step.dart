import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinyiresidentfrontend/core/theme/app_colors.dart';
import 'package:tinyiresidentfrontend/core/theme/app_theme.dart';
import 'package:tinyiresidentfrontend/features/work_orders/providers/personal_info_provider.dart';
import 'package:tinyiresidentfrontend/shared/widgets/back_button_widget.dart';
import 'package:tinyiresidentfrontend/shared/widgets/next_button_widget.dart';

class PersonalInformationStep extends ConsumerWidget {
  const PersonalInformationStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final personalInfoAsync = ref.watch(personalInfoProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Work Order')),
      body: personalInfoAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
        data: (info) => SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StepIndicator(currentStep: 1),
              const SizedBox(height: 24),
              Text('Personal Information', style: theme.textTheme.titleLarge),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(12),
                child: const Row(
                  children: [
                    Icon(Icons.warning, color: Colors.orange),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Personal data cannot be edited from Work Order. If you need to update them, do it from the Profile section.',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              _buildField(label: 'Resident', value: info.residentName),
              _buildField(label: 'Property Name', value: info.propertyName),
              _buildField(label: 'Building', value: info.building),
              _buildField(label: 'Unit', value: info.unit),
              _buildField(label: 'Address', value: info.address),
              const SizedBox(height: 24),

              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.darkTextPrimary,
                  backgroundColor: AppColors.primary,
                  side: BorderSide(color: colorScheme.primary),
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Confirm Information'),
              ),

              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: colorScheme.primary,
                  side: BorderSide(color: colorScheme.primary),
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Go to Profile'),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackButtonWidget(),
                  NextButtonWidget(
                    onPressed: () {
                      Navigator.pushNamed(context, '/work-order/details');
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

  Widget _buildField({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        readOnly: true,
        initialValue: value,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.transparent,
          labelStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
        ),
      ),
    );
  }
}

class StepIndicator extends StatelessWidget {
  const StepIndicator({super.key, required this.currentStep});

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const StepCircle(isDone: true, label: 'Personal\nInformation'),
        const SizedBox(width: 12),
        StepCircle(
          isActive: currentStep >= 2,
          isDone: false,
          label: 'Work Order\nDetails',
        ),
        const SizedBox(width: 12),
        StepCircle(isActive: currentStep == 3, isDone: false, label: 'Summary'),
      ],
    );
  }
}

class StepCircle extends StatelessWidget {
  final bool isDone;
  final bool isActive;
  final String label;

  const StepCircle({
    super.key,
    required this.isDone,
    this.isActive = false,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Color bgColor;
    if (isDone) {
      bgColor = Colors.white;
    } else if (isActive) {
      bgColor = Colors.blueAccent;
    } else {
      bgColor = Colors.blue;
    }

    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 26,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bgColor,
            border: Border.all(
              color: isActive && !isDone ? Colors.white : Colors.blue,
              width: 2,
            ),
          ),
          child: Icon(
            isDone ? Icons.check : Icons.circle,
            size: 16,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            color: isActive ? colorScheme.onSurface : Colors.black,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
