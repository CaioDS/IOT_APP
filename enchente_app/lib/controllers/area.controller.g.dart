// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AreaController on _AreaController, Store {
  final _$statusAtom = Atom(name: '_AreaController.status');

  @override
  AppStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(AppStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$listAtom = Atom(name: '_AreaController.list');

  @override
  ObservableList<Area> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<Area> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$getAllAsyncAction = AsyncAction('_AreaController.getAll');

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  final _$addAreaAsyncAction = AsyncAction('_AreaController.addArea');

  @override
  Future<void> addArea(Area area) {
    return _$addAreaAsyncAction.run(() => super.addArea(area));
  }

  @override
  String toString() {
    return '''
status: ${status},
list: ${list}
    ''';
  }
}
