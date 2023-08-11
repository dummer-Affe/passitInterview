import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passit/core/states/app_settings/app_settings.dart';
import 'package:passit/view/otp/view/otp_pin_widget.dart';
import 'package:passit/view/otp/view_model/otp_model.dart';

import '../../../core/states/app_colors/app_colors.dart';
import '../../../core/states/app_fonts/app_fonts_panel.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  var viewModel = OtpViewModel();
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSettings>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            Positioned(
                left: 100,
                child: Image.asset(
                  "assets/images/elipsbig.png",
                  width: 900,
                )),
            Positioned(
                left: 1000,
                child: Image.asset(
                  "assets/images/elipsbig.png",
                  width: 400,
                )),
            Positioned(
                left: 1000,
                top: 400,
                child: Image.asset(
                  "assets/images/elipsbig.png",
                  width: 600,
                )),
            Align(
              alignment: Alignment.center,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Align(
                    child: Container(
                      alignment: Alignment.center,
                      width: 450,
                      height: 480,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white.withOpacity(0.4),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30.0),
                            child: Text(
                              "Email Verification",
                              style: AppFontsPanel.titleLoginPages,
                            ),
                          ),
                          Image.asset("/images/email.png"),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Enter the 6 digits code you received to",
                            style: AppFontsPanel.welcomeButtonInactive,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            viewModel.email ?? "",
                            style: AppFontsPanel.emailTextStyle,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          OtpCodeWidget(viewModel: viewModel),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
