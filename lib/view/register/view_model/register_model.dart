// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:passit/core/extensions/string_extensions.dart';

import '../../../core/states/app_settings/app_settings.dart';
import '../../../product/init/extensions/response_model.dart';
import '../../../product/model/register/register_request.dart';
import '../../tracker/register_login_tracker.dart';
import 'registration_credentials.dart';

part 'register_model.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store {
  @observable
  bool emailError = false;
  @observable
  bool usernameError = false;
  @observable
  bool passwordError = false;
  @observable
  bool passwordMatchError = false;
  @observable
  bool errorPin = false;

  @observable
  bool? regSuccess;

  @action
  bool checkAllFields({required RegistrationCredentials credentials}) {
    checkEmail(credentials.email);
    checkUsername(credentials.username);
    checkPassword(credentials.password);
    checkPasswordMatch(credentials.password, credentials.validationPass);

    if (!emailError &&
        !usernameError &&
        !passwordError &&
        !passwordMatchError) {
      return true;
    } else {
      return false;
    }
  }

  @action
  Future<void> register(
      {required RegisterRequest requestData,
      required String validationPass,
      required BuildContext context}) async {
    RegistrationCredentials credentials = RegistrationCredentials(
        email: requestData.email!,
        username: requestData.username!,
        password: requestData.password!,
        validationPass: validationPass);

    bool validated = checkAllFields(credentials: credentials);

    if (validated) {
      var response =
          await AppSettings.instance.generalService.register(requestData);

      switch (response.responseType) {
        case ResponseType.hasData:


          showAlertDialog(
              context: context,
              description: "Succesfully Created",
              title: "Success");
          regSuccess = true;
          break;
        case ResponseType.errorModelWithData:
          showAlertDialog(
              context: context, description: response.error!.model!.message!);
          errorPin = true;
          break;
        case ResponseType.errorModelWithoutData:
          showAlertDialog(
              context: context, description: response.error!.model!.data!);
          errorPin = true;
          break;
        case ResponseType.noConnection:
          showAlertDialog(
              context: context, description: response.error!.model!.data!);
          errorPin = true;
          break;
        case ResponseType.unknown:
          showAlertDialog(
              context: context, description: response.error!.model!.data!);
          errorPin = true;
          break;
      }
    } else {
      errorPin = true;
    }
  }

  @action
  void checkEmail(String email) {

    if (email.isValidEmail == "Email adress is not valid.") {
      emailError = true;
    } else {
      emailError = false;

    }
  }

  @action
  void checkUsername(String username) {
    if (username.isValidUserName ==
        "The value has a minimum of four characters.") {
      usernameError = true;
    } else {
      usernameError = false;
    }
  }

  @action
  void checkPassword(String pass) {

    if (pass.isValidPassword == "The value has a minimum of six characters.") {

      passwordError = true;
    } else {
      passwordError = false;
    }
  }

  @action
  void checkPasswordMatch(String password1, String password2) {


    if (password1 != password2) {
  
      passwordMatchError = true;
    } else {
      passwordMatchError = false;
    }
  }

  showAlertDialog(
      {required BuildContext context,
      required String description,
      String? title}) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        RegistrationTracker.instance.register(context: context);
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(title ?? "Error"),
      content: Text(description),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
