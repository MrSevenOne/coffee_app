import 'package:coffee_app/routing/app_router.dart';
import 'package:coffee_app/ui/widgets/snackBar/top_snackbar.dart';
import 'package:coffee_app/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false; // 🔹 Loading holat

  Widget _customTextField(
      String title, String hint, TextEditingController controller) {
    return Column(
      spacing: 6.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white70),
        ),
        TextFormField(
          controller: controller,
          obscureText: title == "Password",
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "$title cannot be empty";
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

  Future<void> _onSignInPressed() async {
    if (_isLoading) return; // 🔹 Bir marta bosilsa kifoya

    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true); // 🔹 Loading holatni yoqish

      TopSnackBar.show(
        context,
        message: "Account successfully login!",
        backgroundColor: Colors.green,
      );

      // 🔹 Loading imitasiya (backend kutish)
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() => _isLoading = false);
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
          // 🔹 Yuqoridagi rasm
          Positioned(
            top: 10.0,
            right: -20.0,
            child: Image.asset(
              'assets/login1.png',
              height: 250,
            ),
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .scale(begin: const Offset(0.9, 0.9), duration: 600.ms),

          // 🔹 Pastdagi rasm
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/login3.png',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          )
              .animate()
              .fadeIn(duration: 800.ms)
              .slideY(begin: 0.2, duration: 800.ms),

          // 🔹 Form
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20.0,
                  children: [
                    Text(
                      "Sign In",
                      style: context.textTheme.displaySmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 300.ms, duration: 600.ms)
                        .scale(begin: const Offset(0.9, 0.9)),

                    _customTextField(
                      'Email',
                      'Enter your email',
                      emailController,
                    )
                        .animate()
                        .fadeIn(delay: 350.ms, duration: 600.ms)
                        .scale(begin: const Offset(0.9, 0.9)),

                    _customTextField(
                      "Password",
                      'Enter your password',
                      passwordController,
                    )
                        .animate()
                        .fadeIn(delay: 400.ms, duration: 600.ms)
                        .scale(begin: const Offset(0.9, 0.9)),

                    // 🔹 Button
                    SizedBox(
                      width: double.infinity,
                      height: 55.0,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _onSignInPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              _isLoading ? Colors.grey : context.colorScheme.primary,
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                width: 25,
                                height: 25,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                ),
                              )
                            : const Text(
                                "Sign In",
                                style: TextStyle(fontSize: 18),
                              ),
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 450.ms, duration: 600.ms)
                        .scale(begin: const Offset(0.9, 0.9)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.white70),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(
                            context,
                            AppRouter.signUp,
                          ),
                          child: const Text("Sign Up"),
                        ),
                      ],
                    )
                        .animate()
                        .fadeIn(delay: 500.ms, duration: 600.ms)
                        .scale(begin: const Offset(0.9, 0.9)),
                  ],
                ),
              ),
            ),
          ).animate().fadeIn(duration: 900.ms),
        ],
      ),
    );
  }
}
