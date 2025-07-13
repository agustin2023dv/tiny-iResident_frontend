// lib/shared/widgets/next_button_widget.dart

import 'package:flutter/material.dart';

class NextButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const NextButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Row(
        children: [
          Text('Next'),
          SizedBox(width: 4),
          Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}
