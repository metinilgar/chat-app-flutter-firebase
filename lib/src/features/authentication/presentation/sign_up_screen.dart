import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Form(
            child: Column(
              children: [
                // Text for sign up
                Text(
                  "SIGN UP",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 40),

                // TextFormField for email
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Name',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
                const SizedBox(height: 20),

                // TextFormField for password
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(height: 20),

                // TextFormField for confirm password
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ),
                const SizedBox(height: 10),

                // TextButton for sign in
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextButton(
                      onPressed: () => context.go('/signIn'),
                      style: TextButton.styleFrom(
                        minimumSize: const Size(0, 0),
                        padding: const EdgeInsets.all(0),
                      ),
                      child: Text(
                        'Sign in here.',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // ElevatedButton for sign up
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(180, 50),
                  ),
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
