import 'package:flutter/material.dart';
import 'package:voluntary/core/controller.dart';
import 'package:voluntary/modules/login_module/controller/login_controller.dart';
import 'package:voluntary/widgets/loader.dart';

class LoginForm extends ControllerView<LoginController> {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Updater<LoginController>(
      controller: LoginController(),
      builder: (_) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: controller.login,
                decoration: const InputDecoration(
                  labelText: 'Login',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.password,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Don\'t have an account?\n'
                'Contact administration to create your account',
                textAlign: TextAlign.center,
              ),
              if (controller.isLoading) ...const [
                SizedBox(height: 16),
                Loader(),
                SizedBox(height: 16),
              ] else if (controller.errorText != null) ...[
                const SizedBox(height: 16),
                Text(
                  controller.errorText!,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 16),
              ] else
                const SizedBox(height: 32),
              ElevatedButton(
                onPressed:
                    controller.isLoading ? null : controller.handleTapLogin,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                  child: Text(
                    'Sign in',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
