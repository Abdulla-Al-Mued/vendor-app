import 'package:flutter/material.dart';

import '../../../../../../asset_helper/ic_img_path.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final dialogWidth = width * 0.85;

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        width: dialogWidth,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xffF8F8F8), width: 0.4),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              blurRadius: 1.5,
              offset: const Offset(0, 1.5),
            )
          ],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            /// DELETE ICON
            Container(
              width: 46,
              height: 46,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(deleteProfile),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// TITLE
            const Text(
              "Are you sure, want to delete account?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff1A252F),
                letterSpacing: -0.02,
              ),
            ),

            const SizedBox(height: 10),

            /// SUBTEXT
            const Text(
              "If once you delete your vendor account, you’ll be lost your vendor forever.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xff606060),
                height: 1.25,
                letterSpacing: -0.02,
              ),
            ),

            const SizedBox(height: 25),

            /// BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // NO BUTTON
                Container(
                  width: dialogWidth * 0.28,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffECF0F1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "No",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff606060),
                    ),
                  ),
                ),

                const SizedBox(width: 20),

                // YES BUTTON
                Container(
                  width: dialogWidth * 0.28,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xffFD5A5B),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Yes",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
