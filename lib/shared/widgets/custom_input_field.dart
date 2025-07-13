// lib/shared/widgets/custom_input_field.dart

import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final int maxLines;
  final Function(String) onChanged;

  const CustomInputField({
    super.key,
    required this.label,
    this.maxLines = 1,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        maxLines: maxLines,
        validator: (val) => (val == null || val.isEmpty) ? 'Required' : null,
        onChanged: onChanged,
      ),
    );
  }
}
