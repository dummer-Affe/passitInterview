// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$serviceStatusAtom =
      Atom(name: '_HomeViewModelBase.serviceStatus', context: context);

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

  late final _$searchAtom =
      Atom(name: '_HomeViewModelBase.search', context: context);

  @override
  ObservableList<String> get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(ObservableList<String> value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  @override
  String toString() {
    return '''
serviceStatus: ${serviceStatus},
search: ${search}
    ''';
  }
}
