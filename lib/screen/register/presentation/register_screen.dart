import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/register_controller.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final registerState = ref.watch(registerControllerProvider);
    final registerController = ref.read(registerControllerProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Header: Background, Overlay, Logo, and Title
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: screenHeight * 0.28,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('assets/images/background_su.png', fit: BoxFit.cover),
                  Container(color: const Color(0xDB27AE60)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/logo.png',
                            width: 41.42,
                            height: 42.84,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 14),
                          const Text(
                            'Dotvalley',
                            style: TextStyle(
                              fontFamily: 'NotoSerifGujarati',
                              fontWeight: FontWeight.w600,
                              fontSize: 28.2635,
                              letterSpacing: -0.02 * 28.2635,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Register',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: MediaQuery.of(context).padding.top,
                    left: 10,
                    child: IconButton(
                      icon: Image.asset('assets/icons/ic_back_login.png', width: 24, height: 24, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            ),
            
            // White Card with the Form
            Positioned(
              top: screenHeight * 0.22,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                child: _form(ref),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /* ===============================================================
                                 FORM
     =============================================================== */
  Widget _form(WidgetRef ref) {
    final registerState = ref.watch(registerControllerProvider);
    final registerController = ref.read(registerControllerProvider.notifier);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 27.34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 28.56),

          /* ---------------  FULL  NAME  --------------- */
          _label('Full Name'),
          _field(hint: 'Your Full Name'),
          const SizedBox(height: 18),

          /* ---------------  EMAIL  -------------------- */
          _label('Your email'),
          _field(hint: 'emaill@address.com'),
          const SizedBox(height: 18),

          /* ---------------  PHONE  -------------------- */
          _label('Phone Number'),
          _phoneField(),
          const SizedBox(height: 18),

          /* ---------------  PASSWORD  ----------------- */
          _label('Password'),
          _passField(
              hint: '8+Characters required',
              obs: registerState.obscurePassword1,
              toggle: registerController.togglePassword1Visibility),
          const SizedBox(height: 18),

          /* ---------------  CONFIRM  PASS  ------------ */
          _label('Confirm Password'),
          _passField(
              hint: '8+Characters required',
              obs: registerState.obscurePassword2,
              toggle: registerController.togglePassword2Visibility),
          const SizedBox(height: 18),

          /* ---------------  REFERRAL  ----------------- */
          _label('Referral Code (Optional)'),
          _field(hint: 'Enter Referra Code'),
          const SizedBox(height: 18),

          /* ---------------  CHECKBOX  ----------------- */
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 13.16,
                height: 13,
                child: Checkbox(
                  value: registerState.agreeToTerms,
                  onChanged: registerController.setAgreeToTerms,
                  side:
                      const BorderSide(color: Color(0xFF606060), width: .75),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              const SizedBox(width: 9),
              const Text(
                'I agree with the Terms & Conditions',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 10.46,
                  color: Color(0xFFA3A3A3),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          /* ---------------  BUTTON  ------------------- */
          SizedBox(
            height: 52.28,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF27AE60),
                side: const BorderSide(color: Color(0xFF27AE60)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.96)),
              ),
              onPressed: () {},
              child: const Text(
                'Register',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.94,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 22),

          /* ---------------  FOOTER  ------------------- */
          Center(
            child: RichText(
              text: TextSpan(
                text: 'Already have an account? ',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 13.44,
                  color: Color(0xFFA6A6A6),
                ),
                children: [
                  TextSpan(
                    text: 'Login',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF27AE60),
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigator.of(context).pop();
                      },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40), // bottom padding
        ],
      ),
    );
  }

  /* ------------------------------------------------------------------ */
  /* ------------------------  HELPERS  ------------------------------- */
  /* ------------------------------------------------------------------ */
  Widget _label(String txt) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          txt,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 11.95,
            color: Color(0xFF1A252F),
          ),
        ),
      );

  Widget _field({required String hint}) => Container(
        height: 51.93,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 19.81),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFECECEE), width: 2.24),
          borderRadius: BorderRadius.circular(8.96),
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 11.95,
              color: Color(0xFFA3A3A3),
            ),
          ),
        ),
      );

  Widget _phoneField() => Row(
        children: [
          Container(
            width: 95.7,
            height: 51.93,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFECF0F1),
              border:
                  Border.all(color: const Color(0xFFECECEE), width: 2.23),
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(8.9)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BD+880',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 10.39,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 4),
                Icon(Icons.keyboard_arrow_down, size: 17.8),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 51.93,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 19.81),
              decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: const Color(0xFFECECEE), width: 2.24),
                borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(8.96)),
              ),
              child: const TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your phone',
                  hintStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 11.95,
                    color: Color(0xFFA3A3A3),
                  ),
                ),
              ),
            ),
          ),
        ],
      );

  Widget _passField(
          {required String hint,
          required bool obs,
          required VoidCallback toggle}) =>
      Container(
        height: 52.28,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 19.81, right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFECECEE), width: 2.24),
          borderRadius: BorderRadius.circular(8.96),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                obscureText: obs,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 11.95,
                    color: Color(0xFFA3A3A3),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: toggle,
              child: const Icon(Icons.visibility_outlined,
                  size: 17, color: Color(0xFFA6A6A6)),
            ),
          ],
        ),
      );
}
