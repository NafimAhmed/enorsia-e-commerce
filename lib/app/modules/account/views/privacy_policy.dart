import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sizer/sizer.dart';

import '../controllers/account_controller.dart';

class PrivacyPolicy extends StatelessWidget {
  AccountController accountController = Get.put(AccountController());

  PrivacyPolicy({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
        backgroundColor: Colors.black,
      ),
      body: accountController.isPrivacyPolicyLoading == true
          ? const CircularProgressIndicator()
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Privacy Policy",
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Html(
                        data:
                            "${accountController.apiPrivacyPolicyMap?["data"]["description"]}")
                  ],
                ),
              ),
            ),
    );
  }
}
