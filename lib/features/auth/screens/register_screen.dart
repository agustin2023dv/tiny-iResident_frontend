import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register'), centerTitle: true),
      body: const Center(
        child: Text('Registration screen here', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
