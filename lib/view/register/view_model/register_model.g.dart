// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterViewModel on _RegisterViewModelBase, Store {
  late final _$emailErrorAtom =
      Atom(name: '_RegisterViewModelBase.emailError', context: context);

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

  late final _$usernameErrorAtom =
      Atom(name: '_RegisterViewModelBase.usernameError', context: context);

  @override
  bool get usernameError {
    _$usernameErrorAtom.reportRead();
    return super.usernameError;
  }

  @override
  set usernameError(bool value) {
    _$usernameErrorAtom.reportWrite(value, super.usernameError, () {
      super.usernameError = value;
    });
  }

  late final _$passwordErrorAtom =
      Atom(name: '_RegisterViewModelBase.passwordError', context: context);

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

  late final _$passwordMatchErrorAtom =
      Atom(name: '_RegisterViewModelBase.passwordMatchError', context: context);

  @override
  bool get passwordMatchError {
    _$passwordMatchErrorAtom.reportRead();
    return super.passwordMatchError;
  }

  @override
  set passwordMatchError(bool value) {
    _$passwordMatchErrorAtom.reportWrite(value, super.passwordMatchError, () {
      super.passwordMatchError = value;
    });
  }

  late final _$errorPinAtom =
      Atom(name: '_RegisterViewModelBase.errorPin', context: context);

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

  late final _$regSuccessAtom =
      Atom(name: '_RegisterViewModelBase.regSuccess', context: context);

  @override
  bool? get regSuccess {
    _$regSuccessAtom.reportRead();
    return super.regSuccess;
  }

  @override
  set regSuccess(bool? value) {
    _$regSuccessAtom.reportWrite(value, super.regSuccess, () {
      super.regSuccess = value;
    });
  }

  late final _$registerAsyncAction =
      AsyncAction('_RegisterViewModelBase.register', context: context);

  @override
  Future<void> register(
      {required RegisterRequest requestData,
      required String validationPass,
      required BuildContext context}) {
    return _$registerAsyncAction.run(() => super.register(
        requestData: requestData,
        validationPass: validationPass,
        context: context));
  }

  late final _$_RegisterViewModelBaseActionController =
      ActionController(name: '_RegisterViewModelBase', context: context);

  @override
  bool checkAllFields({required RegistrationCredentials credentials}) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.checkAllFields');
    try {
      return super.checkAllFields(credentials: credentials);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkEmail(String email) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.checkEmail');
    try {
      return super.checkEmail(email);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkUsername(String username) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.checkUsername');
    try {
      return super.checkUsername(username);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkPassword(String pass) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.checkPassword');
    try {
      return super.checkPassword(pass);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkPasswordMatch(String password1, String password2) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.checkPasswordMatch');
    try {
      return super.checkPasswordMatch(password1, password2);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailError: ${emailError},
usernameError: ${usernameError},
passwordError: ${passwordError},
passwordMatchError: ${passwordMatchError},
errorPin: ${errorPin},
regSuccess: ${regSuccess}
    ''';
  }
}
