import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vendor_app/screen/main/presentation/menu/profile/edit_profile/edit_profile_controller.dart';

class EditProfileScreen extends ConsumerWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerState = ref.watch(profileControllerProvider);
    final registerController = ref.read(profileControllerProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ AppBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF27AE60)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Color(0xFF27AE60),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // ✅ Profile Header + Image
            // ✅ FIXED STACK
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 160,
                  color: const Color(0xFFE9F8EF),
                ),

                // Decorative circle
                Positioned(
                  right: -50,
                  top: -40,
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(150, 255, 194, 0.3),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Container(
                      margin: EdgeInsetsGeometry.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9F8EF),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),


                // ✅ Correct way: Wrap profile in Center, camera icon as Positioned
                Positioned(
                  top: 30,
                  left: 20,
                  right: 20,
                  bottom: 30,
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFCAD3CE),
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: const Icon(Icons.person, size: 60, color: Colors.white),
                  ),
                ),

                // ✅ Camera icon must be in Stack level, NOT inside Column
                Positioned(
                  bottom: 30,
                  left: 60,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: const Color(0xFF27AE60),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),
                ),

                // 3-dot menu
                Positioned(
                  top: 20,
                  right: 20,
                  child: Container(
                    width: 28,
                    height: 26,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xFF27AE60)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(radius: 2, backgroundColor: Color(0xFF27AE60)),
                        SizedBox(height: 3),
                        CircleAvatar(radius: 2, backgroundColor: Color(0xFF27AE60)),
                        SizedBox(height: 3),
                        CircleAvatar(radius: 2, backgroundColor: Color(0xFF27AE60)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /* ---------------  FULL  NAME  --------------- */
                  _label('Full Name'),
                  _field(hint: 'Your Full Name'),
                  const SizedBox(height: 18),

                  /* ---------------  EMAIL  -------------------- */
                  _label('Your email'),
                  _field(hint: 'emaill@address.com'),
                  const SizedBox(height: 18),

                  _label('Phone Number'),
                  _phoneField(),

                  const SizedBox(height: 28),

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

                  const SizedBox(height: 40),

                  // ✅ Update Profile Button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF27AE60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Update Profile",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


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
