// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  late final _$errorPinAtom =
      Atom(name: '_LoginViewModelBase.errorPin', context: context);

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

  late final _$emailErrorAtom =
      Atom(name: '_LoginViewModelBase.emailError', context: context);

  @override
  bool get emailError {
    _$emailErrorAtom.reportRead();
    return super.emailError;
  }

  @override
  set emailError(bool value) {
    _$emailErrorAtom.reportWrite(value, super.emailError, () {
      super.emailError = value;
    });
  }

  late final _$passwordErrorAtom =
      Atom(name: '_LoginViewModelBase.passwordError', context: context);

  @override
  bool get passwordError {
    _$passwordErrorAtom.reportRead();
    return super.passwordError;
  }

  @override
  set passwordError(bool value) {
    _$passwordErrorAtom.reportWrite(value, super.passwordError, () {
      super.passwordError = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_LoginViewModelBase.login', context: context);

  @override
  Future<void> login(
      {required LoginRequest requestData, required BuildContext context}) {
    return _$loginAsyncAction
        .run(() => super.login(requestData: requestData, context: context));
  }

  late final _$_LoginViewModelBaseActionController =
      ActionController(name: '_LoginViewModelBase', context: context);

  @override
  bool checkAllFields({required LoginRequest credentials}) {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.checkAllFields');
    try {
      return super.checkAllFields(credentials: credentials);
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkEmail(String email) {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.checkEmail');
    try {
      return super.checkEmail(email);
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkPassword(String pass) {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.checkPassword');
    try {
      return super.checkPassword(pass);
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorPin: ${errorPin},
emailError: ${emailError},
passwordError: ${passwordError}
    ''';
  }
}
