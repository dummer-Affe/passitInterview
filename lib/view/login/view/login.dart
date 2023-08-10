import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:passit/core/states/app_colors/app_colors.dart';

import '../../../core/states/app_fonts/app_fonts_panel.dart';
import '../../../product/model/login/login_request.dart';
import '../../../product/widgets/textfield.dart';
import '../view_model/login_model.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, this.emailController, this.passwordController});

  final LoginViewModel viewModel = LoginViewModel();

  final TextEditingController? emailController;

  final TextEditingController? passwordController;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFieldWidget(
                showError: viewModel.emailError,
                errorText: "Invalid E-mail",
                hintText: "E-mail",
                controller: emailController!,
                obscureText: false),
            TextFieldWidget(
                showError: viewModel.passwordError,
                errorText: "Invalid Password",
                hintText: "Password",
                controller: passwordController!,
                obscureText: false),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                //var res = aservice.checkOtp(OtpRequest(
                //    email: "turanlibrahimozan@gmail.com", otp: 705449));
                viewModel.login(
                    requestData: LoginRequest(
                        email: emailController!.text,
                        password: passwordController!.text),
                    context: context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary),
              child: Text(
                "Login",
                style: AppFontsPanel.welcomeButtonInactive,
              ),
            )
          ],
        ),
      );
    });
  }
}
