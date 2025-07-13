// lib/shared/widgets/step_indicator.dart

import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepIndicator({
    super.key,
    required this.currentStep,
    this.totalSteps = 3,
  });

  @override
  Widget build(BuildContext context) {
    const List<String> stepLabels = [
      'Personal\nInformation',
      'Work Order\nDetails',
      'Summary',
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        final bool isDone = index < currentStep - 1;
        final bool isActive = index == currentStep - 1;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: isDone
                    ? Colors.green
                    : isActive
                    ? Colors.blue
                    : Colors.grey,
                radius: 12,
                child: Icon(
                  isDone ? Icons.check : Icons.circle,
                  size: 14,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                stepLabels[index],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        );
      }),
    );
  }
}
