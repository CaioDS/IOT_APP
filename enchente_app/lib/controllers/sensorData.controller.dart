/*import 'package:enchente_app/app_status.dart';
import 'package:enchente_app/models/SensorData.dart';
import 'package:mobx/mobx.dart';

class SensorDataController = _SensorDataController with _$SensorDataController;

abstract class _SensorDataController with Store {
  SensorDataRepository repository;

  _SensorDataController(){
    repository = new SensorDataRepository();
    _init();
  }

  Future<void> _init() async {
    getAll();
  }

  @observable
  AppStatus status = AppStatus.none;

  @observable
  ObservableList<SensorData> list = new ObservableList<SensorData>();

  @action
  Future<void> getAll() async {
    status = AppStatus.loading;
    try {
      final allist = await repository.getAll();
      list.clear();
      list.addAll(allist);
      status = AppStatus.success;
    } catch(e) {
      status = AppStatus.error..value = e;
    }
  }

  @action
  Future<void> addPessoa(SensorData data) async {
    status = AppStatus.loading;
    try {
      final request = await repository.createPessoa(data);
      status = AppStatus.success;
    } catch(e) {
      status = AppStatus.error..value = e;
    }
  }
}*/
