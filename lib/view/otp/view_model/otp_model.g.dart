// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OtpViewModel on _OtpViewModelBase, Store {
  late final _$otpErrorAtom =
      Atom(name: '_OtpViewModelBase.otpError', context: context);

  @override
  bool get otpError {
    _$otpErrorAtom.reportRead();
    return super.otpError;
  }

  @override
  set otpError(bool value) {
    _$otpErrorAtom.reportWrite(value, super.otpError, () {
      super.otpError = value;
    });
  }

  late final _$errorPinAtom =
      Atom(name: '_OtpViewModelBase.errorPin', context: context);

  @override
  bool get errorPin {
    _$errorPinAtom.reportRead();
    return super.errorPin;
  }

  @override
  set errorPin(bool value) {
    _$errorPinAtom.reportWrite(value, super.errorPin, () {
      super.errorPin = value;
    });
  }

  late final _$otpErrorTextAtom =
      Atom(name: '_OtpViewModelBase.otpErrorText', context: context);

  @override
  String get otpErrorText {
    _$otpErrorTextAtom.reportRead();
    return super.otpErrorText;
  }

  @override
  set otpErrorText(String value) {
    _$otpErrorTextAtom.reportWrite(value, super.otpErrorText, () {
      super.otpErrorText = value;
    });
  }

  late final _$checkLoginOtpAsyncAction =
      AsyncAction('_OtpViewModelBase.checkLoginOtp', context: context);

  @override
  Future<void> checkLoginOtp(
      {required OtpRequest requestData, required BuildContext context}) {
    return _$checkLoginOtpAsyncAction.run(
        () => super.checkLoginOtp(requestData: requestData, context: context));
  }

  late final _$_OtpViewModelBaseActionController =
      ActionController(name: '_OtpViewModelBase', context: context);

  @override
  bool checkOtpValid(String otp) {
    final _$actionInfo = _$_OtpViewModelBaseActionController.startAction(
        name: '_OtpViewModelBase.checkOtpValid');
    try {
      return super.checkOtpValid(otp);
    } finally {
      _$_OtpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
otpError: ${otpError},
errorPin: ${errorPin},
otpErrorText: ${otpErrorText}
    ''';
  }
}
