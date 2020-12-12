import 'package:enchente_app/app_status.dart';
import 'package:enchente_app/models/Area.dart';
import 'package:mobx/mobx.dart';
import 'package:enchente_app/repositories/area.repository.dart';

part 'area.controller.g.dart';

class AreaController = _AreaController with _$AreaController;

abstract class _AreaController with Store {
  AreaRepository repository;

  _AreaController() {
    repository = new AreaRepository();
    _init();
  }

  Future<void> _init() async {
    getAll();
  }

  @observable
  AppStatus status = AppStatus.none;

  @observable
  ObservableList<Area> list = new ObservableList<Area>();

  @action
  Future<void> getAll() async {
    status = AppStatus.loading;
    try {
      final allist = await repository.getAll();
      list.clear();
      list.addAll(allist);
      status = AppStatus.success;
    } catch (e) {
      status = AppStatus.error..value = e;
    }
  }

  @action
  Future<void> addArea(Area area) async {
    status = AppStatus.loading;
    try {
      final request = await repository.createArea(area);
      status = AppStatus.success;
    } catch (e) {
      status = AppStatus.error..value = e;
    }
  }
}
