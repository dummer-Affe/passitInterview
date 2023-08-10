// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_search_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserSearchViewModel on _UserSearchViewModelBase, Store {
  late final _$serviceStatusAtom =
      Atom(name: '_UserSearchViewModelBase.serviceStatus', context: context);

  @override
  ServiceStatus get serviceStatus {
    _$serviceStatusAtom.reportRead();
    return super.serviceStatus;
  }

  @override
  set serviceStatus(ServiceStatus value) {
    _$serviceStatusAtom.reportWrite(value, super.serviceStatus, () {
      super.serviceStatus = value;
    });
  }

  late final _$getProfileAsyncAction =
      AsyncAction('_UserSearchViewModelBase.getProfile', context: context);

  @override
  Future<void> getProfile(String id) {
    return _$getProfileAsyncAction.run(() => super.getProfile(id));
  }

  @override
  String toString() {
    return '''
serviceStatus: ${serviceStatus}
    ''';
  }
}
