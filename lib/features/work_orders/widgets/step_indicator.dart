// lib/features/work_order/widgets/step_indicator.dart

import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;
  final List<String> labels;

  const StepIndicator({
    super.key,
    required this.currentStep,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: labels.asMap().entries.map((entry) {
        final index = entry.key;
        final label = entry.value;
        final isActive = index == currentStep;

        return Expanded(
          child: Column(
            children: [
              Icon(
                isActive
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: isActive ? Colors.blue : Colors.grey,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: isActive ? Colors.black : Colors.grey,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
