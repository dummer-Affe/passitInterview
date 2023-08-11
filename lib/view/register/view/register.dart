import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:passit/core/states/app_fonts/app_fonts_panel.dart';
import 'package:passit/core/states/app_settings/app_settings.dart';

import '../../../core/states/app_colors/app_colors.dart';
import '../../../product/model/register/register_request.dart';
import '../../../product/widgets/textfield.dart';
import '../view_model/register_model.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage(
      {super.key,
      this.emailController,
      this.passwordController,
      this.passwordMatchController,
      this.usernameController});
  final TextEditingController? emailController;

  final TextEditingController? usernameController;

  final TextEditingController? passwordController;

  final TextEditingController? passwordMatchController;

  final RegisterViewModel viewModel = RegisterViewModel();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSettings>(builder: (controller) {
      return Observer(builder: (context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFieldWidget(
                  showError: viewModel.emailError,
                  errorText: "Invalid Email",
                  hintText: "Email",
                  controller: emailController!,
                  obscureText: false),
              TextFieldWidget(
                  showError: viewModel.usernameError,
                  errorText: "Invalid Username",
                  hintText: "Username",
                  controller: usernameController!,
                  obscureText: false),
              TextFieldWidget(
                  showError: viewModel.passwordError,
                  errorText: "Invalid Password",
                  hintText: "Password",
                  controller: passwordController!,
                  obscureText: false),
              TextFieldWidget(
                  showError: viewModel.passwordMatchError,
                  errorText: "Passwords Do Not Match",
                  hintText: "Repeat Password",
                  controller: passwordMatchController!,
                  obscureText: false),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () async {
                  await viewModel.register(
                      requestData: RegisterRequest(
                          username: usernameController!.text,
                          email: emailController!.text,
                          password: passwordController!.text),
                      validationPass: passwordMatchController!.text,
                      context: context);
                  if (viewModel.regSuccess == true) {
                    usernameController!.clear();
                    emailController!.clear();
                    passwordController!.clear();
                    passwordMatchController!.clear();
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary),
                child: Text(
                  "Register",
                  style: AppFontsPanel.welcomeButtonInactive,
                ),
              )
            ],
          ),
        );
      });
    });
  }
}
