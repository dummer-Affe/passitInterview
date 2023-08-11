// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passit/core/states/app_settings/app_settings.dart';
import 'package:passit/product/widgets/sized_button/sized_button.dart';
import 'package:passit/view/login/view/login.dart';

import '../../../core/states/app_colors/app_colors.dart';
import '../../../core/states/app_fonts/app_fonts_panel.dart';
import '../../register/view/register.dart';
import '../../register/view_model/register_model.dart';

class WelcomePage extends StatefulWidget {
  bool? isSignUp;
  WelcomePage({super.key, this.isSignUp});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController passwordMatchController = TextEditingController();

  final TextEditingController loginEmailController = TextEditingController();

  final TextEditingController loginPasswordController = TextEditingController();
  late RegisterPage regPage;
  late LoginPage loginPage;
  @override
  void initState() {
    getview();
    super.initState();
  }

  getview() {
    regPage = RegisterPage(
        emailController: emailController,
        passwordController: passwordController,
        passwordMatchController: passwordMatchController,
        usernameController: usernameController);
    loginPage = LoginPage(
        emailController: loginEmailController,
        passwordController: loginPasswordController);
    if (mounted) {
      setState(() {});
    }
  }

  RegisterViewModel viewModel = RegisterViewModel();

  @override
  Widget build(BuildContext context) {

    return GetBuilder<AppSettings>(
      builder: (controller) {
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
                child: Container(
                  alignment: Alignment.center,
                  width: 450,
                  height: widget.isSignUp! ? 550 : 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white.withOpacity(0.4),
                  ),
                  child: ListView(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30.0),
                          child: Text(
                            widget.isSignUp! ? "Create Account" : "Login",
                            style: AppFontsPanel.titleLoginPages,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.welcomeButtonBg,
                          ),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 5, bottom: 5, right: 2),
                              child: SizedButton(
                                width: 138,
                                radius: 8,
                                height: 50,
                                color: widget.isSignUp!
                                    ? AppColors.secondary
                                    : AppColors.welcomeButtonBg,
                                onPressed: () {
                                  setState(() {
                                    widget.isSignUp = true;
                                  });
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: AppFontsPanel
                                          .welcomeButtonInactive.fontSize,
                                      color: AppSettings.instance.isDarkMode
                                          ? !widget.isSignUp!
                                              ? Colors.black
                                              : Colors.white
                                          : AppFontsPanel
                                              .welcomeButtonInactive.color),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 5, bottom: 5, left: 2),
                              child: SizedButton(
                                  color: !widget.isSignUp!
                                      ? AppColors.secondary
                                      : AppColors.welcomeButtonBg,
                                  width: 138,
                                  radius: 8,
                                  height: 50,
                                  onPressed: () {
                                    setState(() {
                                      widget.isSignUp = false;
                                    });
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        fontSize: AppFontsPanel
                                            .welcomeButtonInactive.fontSize,
                                        color: AppSettings.instance.isDarkMode
                                            ? widget.isSignUp!
                                                ? Colors.black
                                                : Colors.white
                                            : AppFontsPanel
                                                .welcomeButtonInactive.color),
                                  )),
                            ),
                          ]),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      widget.isSignUp! ? regPage : loginPage,
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
