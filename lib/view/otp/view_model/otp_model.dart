// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '/product/model/otp/otp_request.dart';
import '../../../core/states/app_settings/app_settings.dart';
import '../../../product/init/extensions/response_model.dart';
import '../../tracker/register_login_tracker.dart';

part 'otp_model.g.dart';

class OtpViewModel = _OtpViewModelBase with _$OtpViewModel;

abstract class _OtpViewModelBase with Store {
  @observable
  bool otpError = false;

  @observable
  bool errorPin = false;

  @observable
  String otpErrorText = "";

  String? get email => RegistrationTracker.instance.email;

  @action
  bool checkOtpValid(String otp) {

    if (otp.length < 6) {
      otpError = true;
      otpErrorText = "6 Digit Code Is Required";
      return otpError;
    } else {
      otpError = false;
      return otpError;
    }
  }

  @action
  Future<void> checkLoginOtp(
      {required OtpRequest requestData, required BuildContext context}) async {
    var tracker = RegistrationTracker.instance;

    var response =
        await AppSettings.instance.generalService.checkOtp(requestData);

    if (!checkOtpValid(requestData.otp.toString())) {
      switch (response.responseType) {
        case ResponseType.hasData:
          tracker.checkOtp(context: context);
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
      otpError = true;
      errorPin = true;
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
