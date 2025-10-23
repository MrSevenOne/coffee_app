import 'package:another_flushbar/flushbar.dart';
import 'package:coffee_app/routing/app_router.dart';
import 'package:coffee_app/ui/widgets/snackBar/top_snackbar.dart';
import 'package:coffee_app/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController configPasswordController =
      TextEditingController();

  Widget _customTextField(
      String title, String hint, TextEditingController controller) {
    return Column(
      spacing: 6.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(
            color: Colors.white70,
          ),
        ),
        TextFormField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          obscureText: title == "Password" || title == "Config password",
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "$title cannot be empty";
            }
            if (title == "Config password" &&
                value != passwordController.text) {
              return "Passwords do not match";
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          ),
        ),
      ],
    );
  }

  void _onSignUpPressed() async {
    if (_formKey.currentState!.validate()) {
      TopSnackBar.show(
        context,
        message: "Account successfully created!",
        backgroundColor: Colors.green,
      );

      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRouter.home);
      }
    } else {
      TopSnackBar.show(
        context,
        message: "Please fill in all fields correctly!",
        backgroundColor: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/login3.png',
              height: 250,
            ),
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .scale(begin: const Offset(0.9, 0.9), duration: 600.ms),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20.0,
                  children: [
                    Text(
                      "Sign Up",
                      style: context.textTheme.displaySmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 300.ms, duration: 600.ms)
                        .scale(begin: const Offset(0.9, 0.9)),
                    _customTextField('Name', "Enter your name", nameController)
                        .animate()
                        .fadeIn(delay: 200.ms, duration: 600.ms)
                        .slideY(begin: 0.1, duration: 600.ms),
                    _customTextField(
                            'Email', "Enter your email", emailController)
                        .animate()
                        .fadeIn(delay: 300.ms, duration: 600.ms)
                        .slideY(begin: 0.1, duration: 600.ms),
                    _customTextField('Password', "Enter your password",
                            passwordController)
                        .animate()
                        .fadeIn(delay: 400.ms, duration: 600.ms)
                        .slideY(begin: 0.1, duration: 600.ms),
                    _customTextField(
                            'Config password',
                            "Enter your config password",
                            configPasswordController)
                        .animate()
                        .fadeIn(delay: 500.ms, duration: 600.ms)
                        .slideY(begin: 0.1, duration: 600.ms),
                    SizedBox(
                      width: double.infinity,
                      height: 55.0,
                      child: ElevatedButton(
                        onPressed: _onSignUpPressed,
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 600.ms, duration: 600.ms)
                        .scale(begin: const Offset(0.9, 0.9)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(
                            context,
                            AppRouter.login,
                          ),
                          child: const Text("Sign In"),
                        ),
                      ],
                    )
                        .animate()
                        .fadeIn(delay: 700.ms, duration: 600.ms)
                        .slideY(begin: 0.1, duration: 600.ms),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
