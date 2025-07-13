// lib/shared/widgets/back_button_widget.dart

import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;

  const BackButtonWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed ?? () => Navigator.pop(context),
      child: const Text('Back'),
    );
  }
}
