import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:passit/core/enums/navigation_enums.dart';
import 'package:passit/core/states/app_colors/app_colors.dart';
import 'package:passit/core/states/app_fonts/app_fonts_panel.dart';
import 'package:pinput/pinput.dart';

import '../../../product/model/otp/otp_request.dart';
import '../view_model/otp_model.dart';

class OtpCodeWidget extends StatefulWidget {
  final OtpViewModel viewModel;
  const OtpCodeWidget({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<OtpCodeWidget> createState() => _OtpCodeWidgetState();
}

class _OtpCodeWidgetState extends State<OtpCodeWidget> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  String? currentPin;
  bool checkingOtp = false;
  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const fillColor = Color.fromRGBO(243, 246, 249, 0);

    final defaultPinTheme = PinTheme(
      width: 42,
      height: 42,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: AppColors.otpColor.withOpacity(0.4)),
      ),
    );

    return Observer(builder: (context) {
      return Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Directionality(
              textDirection: TextDirection.ltr,
              child: Pinput(
                length: 6,
                controller: pinController,
                focusNode: focusNode,
                defaultPinTheme: defaultPinTheme,
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) async {
            
                  setState(() {
                    checkingOtp = true;
                  });
                  await widget.viewModel.checkLoginOtp(
                      requestData: OtpRequest(
                          email: widget.viewModel.email ?? "",
                          otp: int.parse(pin)),
                      context: context);
                  setState(() {
                    checkingOtp = false;
                  });
                },
                onChanged: (value) {
                  currentPin = value;
                  if (value.length < 6) {
                    setState(() {
                      checkingOtp = false;
                    });
                  }
                },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: AppColors.otpColor,
                    ),
                  ],
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.otpColor),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: AppColors.otpColor),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: Colors.redAccent),
                ),
              ),
            ),
            Text(widget.viewModel.otpErrorText),
            if (checkingOtp)
              CircularProgressIndicator(
                color: AppColors.secondary,
                strokeWidth: 2,
                // value: 10,
              ),
            const SizedBox(
              height: 15,
            ),
            if (!checkingOtp)
              const SizedBox(
                height: 50,
              ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary),
                onPressed: () async {
                  setState(() {
                    checkingOtp = true;
                  });
                  await widget.viewModel.checkLoginOtp(
                      requestData: OtpRequest(
                          email: widget.viewModel.email ?? "",
                          otp: int.parse(currentPin!)),
                      context: context);
                  setState(() {
                    checkingOtp = false;
                  });
                },
                child: Text(
                  "Submit",
                  style: AppFontsPanel.welcomeButtonInactive,
                )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () async {
                    focusNode.unfocus();
                    context.goNamed(NavigationEnums.welcome.name);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 10,
                        color: AppColors.secondary,
                      ),
                      Text(
                        "Back",
                        style: AppFontsPanel.welcomeButtonActive,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
