import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinyiresidentfrontend/core/theme/app_colors.dart';
import 'package:tinyiresidentfrontend/features/auth/models/auth_state.dart';
import 'package:tinyiresidentfrontend/features/auth/providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text;

    await ref.read(authProvider.notifier).login(username, password);
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7AC9F5), Color(0xFF267DFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Sign In', style: theme.textTheme.titleLarge),
                const SizedBox(height: 32),
                _buildInputField(
                  controller: _usernameController,
                  label: 'Email',
                  icon: Icons.email_outlined,
                ),
                const SizedBox(height: 16),
                _buildInputField(
                  controller: _passwordController,
                  label: 'Password',
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),
                const SizedBox(height: 8),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Row(
                  children: [
                    Checkbox(value: false, onChanged: null),
                    Text(
                      'Remember me',
                      style: TextStyle(color: AppColors.textPrimary),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: authState.status == AuthStatus.loading
                        ? null
                        : _handleLogin,
                    child: authState.status == AuthStatus.loading
                        ? const CircularProgressIndicator()
                        : const Text('LOGIN'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  '- OR -',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Sign in with',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 12),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _CircleSocial(icon: Icons.facebook, color: Colors.blue),
                    SizedBox(width: 20),
                    _CircleSocial(icon: Icons.g_mobiledata, color: Colors.red),
                  ],
                ),
                const SizedBox(height: 24),
                const Text.rich(
                  TextSpan(
                    text: "Don't have an Account ? ",
                    style: TextStyle(color: AppColors.textSecondary),
                    children: [
                      TextSpan(
                        text: "Sign up",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: AppColors.textPrimary),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0x33FFFFFF),
        labelText: label,
        labelStyle: const TextStyle(color: AppColors.textSecondary),
        prefixIcon: Icon(icon, color: AppColors.textPrimary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class _CircleSocial extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _CircleSocial({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.white,
      child: Icon(icon, color: color, size: 28),
    );
  }
}
