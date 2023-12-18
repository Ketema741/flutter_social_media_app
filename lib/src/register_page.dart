import 'package:flutter/material.dart';
import 'package:social_media_app/src/widgets/button.dart';

import 'widgets/text_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({
    super.key,
    required this.onTap,
  });

  final Function()? onTap;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //  logo
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),

              const SizedBox(height: 8),

              // app name
              const Text(
                "M I N I M A L",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 45),

              // name textfield
              MyTextField(
                hintText: 'Name',
                obscureText: false,
                controller: _userNameController,
              ),

              //  Email
              MyTextField(
                hintText: 'Email',
                obscureText: false,
                controller: _emailController,
              ),

              // password
              MyTextField(
                hintText: 'Password',
                obscureText: true,
                controller: _passwordController,
              ),

              // confirm password
              MyTextField(
                hintText: 'Confirm Password',
                obscureText: true,
                controller: _confirmPasswordController,
              ),

              // forgot password textfield
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // sign in button
              MyButton(
                text: "Register",
                onTap: () {},
              ),

              const SizedBox(height: 8),
              // don't have an account? Register here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: onTap,
                    child: const Text(
                      "Signin Here",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
