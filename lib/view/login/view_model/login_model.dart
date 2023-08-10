// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:passit/core/extensions/string_extensions.dart';
import 'package:passit/product/init/extensions/response_model.dart';

import '../../../core/states/app_settings/app_settings.dart';
import '../../../product/model/login/login_request.dart';
import '../../tracker/register_login_tracker.dart';

part 'login_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  
  @observable
  bool errorPin = false;

  @observable
  bool emailError = false;

  @observable
  bool passwordError = false;

  @action
  bool checkAllFields({required LoginRequest credentials}) {
    checkEmail(credentials.email!);
    checkPassword(credentials.password!);

    if (!emailError && !passwordError) {
      return true;
    } else {
      return false;
    }
  }

  @action
  Future<void> login(
      {required LoginRequest requestData,
      required BuildContext context}) async {
    var tracker = RegistrationTracker.instance;

    bool validated = checkAllFields(credentials: requestData);

    if (validated) {
      var response =
          await AppSettings.instance.generalService.login(requestData);
      switch (response.responseType) {
        case ResponseType.hasData:
          tracker.login(
              email: requestData.email!,
              context: context,
              token: response.data!.data);
          break;
        case ResponseType.errorModelWithData:
          showAlertDialog(context, response.error!.model!.message!);
          errorPin = true;
          break;
        case ResponseType.errorModelWithoutData:
          showAlertDialog(context, response.error!.model!.data!);
          errorPin = true;
          break;
        case ResponseType.noConnection:
          showAlertDialog(context, response.error!.model!.data!);
          errorPin = true;
          break;
        case ResponseType.unknown:
          showAlertDialog(context, response.error!.model!.data!);
          errorPin = true;
          break;
      }
    } else {
      errorPin = true;
    }
  }

  @action
  void checkEmail(String email) {
    //print(email);
    if (email.isValidEmail == "Email adress is not valid.") {
      emailError = true;
    } else {
      emailError = false;
    }
  }

  @action
  void checkPassword(String pass) {
    //print("object$pass");
    if (pass.isValidPassword == "The value has a minimum of six characters.") {
      //print("pasdfasdfsadsfasdff");
      passwordError = true;
    } else {
      passwordError = false;
    }
  }

  showAlertDialog(BuildContext context, String description) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Error"),
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
