import 'package:chat_app_flutter_firebase/src/features/authentication/presentation/auth_controller.dart';
import 'package:chat_app_flutter_firebase/src/features/authentication/presentation/validation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final validation = ref.read(validationControllerProvider.notifier);

    String? email;
    String? password;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  // Text for sign in
                  Text(
                    "SIGN IN",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 40),

                  // TextFormField for email
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                    validator: (value) => validation.emailValidation(value),
                    onSaved: (value) => email = value,
                  ),
                  const SizedBox(height: 20),

                  // TextFormField for password
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                    validator: (value) => validation.passwordValidation(value),
                    onSaved: (value) => password = value,
                  ),
                  const SizedBox(height: 10),

                  // TextButton for register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextButton(
                        onPressed: () => context.go('/signUp'),
                        style: TextButton.styleFrom(
                          minimumSize: const Size(0, 0),
                          padding: const EdgeInsets.all(0),
                        ),
                        child: Text(
                          'Register here.',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  // ElevatedButton for sign in
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        ref.read(authControllerProvider.notifier).signIn(
                              email: email!,
                              password: password!,
                            );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(180, 50),
                    ),
                    child: const Text(
                      'SIGN IN',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
