
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../register/presentation/register_screen.dart';
import '../application/login_controller.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginControllerProvider);
    final loginController = ref.read(loginControllerProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),

                    // Logo and Brand Name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/logo.png',
                          width: 61.42,
                          height: 62.84,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/ic_v_log.png',
                              width: 31.42,
                              height: 32.84,
                              fit: BoxFit.contain,
                            ),
                            const Text(
                              'Welcom to Dotvalley Vendor App',
                              style: TextStyle(
                                fontFamily: 'Noto Serif Gujarati',
                                fontWeight: FontWeight.w500,
                                fontSize: 17.26,
                                letterSpacing: -0.56,
                                color: Color(0xFF18AF60),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 73),

                    // Email/Phone Field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email\Phone',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 11.95,
                            color: Color(0xFF1A252F),
                          ),
                        ),
                        const SizedBox(height: 11),
                        Container(
                          height: 46,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: const Color(0xFFECECEE), width: 2.24),
                            borderRadius: BorderRadius.circular(8.96),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: 'emaill@address.com',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 11.95,
                                color: Color(0xFFA3A3A3),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 19.81, vertical: 16),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Password Field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 11.95,
                            color: Color(0xFF1A252F),
                          ),
                        ),
                        const SizedBox(height: 11),
                        Container(
                          height: 46,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: const Color(0xFFECECEE), width: 2.24),
                            borderRadius: BorderRadius.circular(8.96),
                          ),
                          child: TextField(
                            obscureText: loginState.obscurePassword,
                            decoration: InputDecoration(
                              hintText: '8+Characters required',
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 11.95,
                                color: Color(0xFFA3A3A3),
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 18.03, vertical: 16),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  loginState.obscurePassword ? Icons.visibility_off : Icons.visibility,
                                  color: const Color(0xFFA6A6A6),
                                  size: 14.94,
                                ),
                                onPressed: loginController.togglePasswordVisibility,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // Remember Me and Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 13.37,
                              height: 12.67,
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xFF27AE60), width: 1),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Checkbox(
                                value: loginState.rememberMe,
                                onChanged: loginController.toggleRememberMe,
                                activeColor: const Color(0xFF27AE60),
                                side: BorderSide.none,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Remember Me?',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: Color(0xFF27AE60),
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle forgot password
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Color(0xFF27AE60),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 23),

                    // Or Divider
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 0.65,
                            color: const Color(0xFFECECEE),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.61),
                          child: Text(
                            'Or',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.05,
                              color: Color(0xFFA5A5A5),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 0.65,
                            color: const Color(0xFFECECEE),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // Continue with Google
                    Container(
                      height: 45.38,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFECECEE), width: 1.96),
                        borderRadius: BorderRadius.circular(7.83),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // Handle Google login
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/ic_google.png', width: 17.97, height: 17.97),
                            const SizedBox(width: 8),
                            const Text(
                              'Continue with Google',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13.05,
                                color: Color(0xFF1A252F),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Continue with Facebook
                    Container(
                      height: 44.92,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFECECEE), width: 1.96),
                        borderRadius: BorderRadius.circular(7.83),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // Handle Facebook login
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/ic_facebook.png', width: 22.73, height: 22.73),
                            const SizedBox(width: 8),
                            const Text(
                              'Continue with Facebook',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13.05,
                                color: Color(0xFF1A252F),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 49.02,
                      child: ElevatedButton(
                        onPressed: () {
                          context.push("/main_screen");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF27AE60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.83),
                            side: const BorderSide(color: Color(0xFF27AE60), width: 1.96),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Don't Have an Account? Register
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                      },
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 11.75,
                            color: Color(0xFFA6A6A6),
                          ),
                          children: [
                            TextSpan(text: "Don't Have an Account? "),
                            TextSpan(
                              text: 'Register',
                              style: TextStyle(color: Color(0xFF27AE60)),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Continue as Guest
                    TextButton(
                      onPressed: () {
                        // Handle guest login
                      },
                      child: const Text(
                        'Continue as Guest',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 11.75,
                          color: Color(0xFFA6A6A6),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                icon: Image.asset('assets/icons/ic_back_login.png', width: 24, height: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
