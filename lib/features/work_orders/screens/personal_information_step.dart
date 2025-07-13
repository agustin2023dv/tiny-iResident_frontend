import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinyiresidentfrontend/features/work_orders/providers/personal_info_provider.dart';
import 'package:tinyiresidentfrontend/shared/widgets/back_button_widget.dart';
import 'package:tinyiresidentfrontend/shared/widgets/next_button_widget.dart';

class PersonalInformationStep extends ConsumerWidget {
  const PersonalInformationStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personalInfoAsync = ref.watch(personalInfoProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Work Order')),
      body: personalInfoAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
        data: (info) => Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const StepIndicator(),
              const SizedBox(height: 24),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Personal Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
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
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildField(label: 'Resident', value: info.residentName),
              _buildField(label: 'Property Name', value: info.propertyName),
              _buildField(label: 'Building', value: info.building),
              _buildField(label: 'Unit', value: info.unit),
              _buildField(label: 'Address', value: info.address),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Optionally confirm data
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.indigo,
                ),
                child: const Text('Confirm Information'),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('Go to Profile'),
              ),
              const Spacer(),
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
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        readOnly: true,
        initialValue: value,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}

class StepIndicator extends StatelessWidget {
  const StepIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StepCircle(isDone: true, label: 'Personal\nInformation'),
        SizedBox(width: 8),
        StepCircle(isDone: false, label: 'Work Order\nDetails'),
        SizedBox(width: 8),
        StepCircle(isDone: false, label: 'Summary'),
      ],
    );
  }
}

class StepCircle extends StatelessWidget {
  final bool isDone;
  final String label;

  const StepCircle({super.key, required this.isDone, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: isDone ? Colors.green : Colors.blue,
          radius: 12,
          child: Icon(
            isDone ? Icons.check : Icons.circle,
            size: 14,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
