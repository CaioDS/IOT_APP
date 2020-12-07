import 'package:enchente_app/app_status.dart';
import 'package:enchente_app/models/Pessoa.dart';
import 'package:mobx/mobx.dart';
import 'package:enchente_app/repositories/pessoa.repository.dart';

part 'pessoa.controller.g.dart';

class PessoaController = _PessoaController with _$PessoaController;

abstract class _PessoaController with Store{
  PessoaRepository repository;

  _PessoaController(){
    repository = new PessoaRepository();
    _init();
  }

  Future<void> _init() async {
    getAll();
  }

  @observable
  AppStatus status = AppStatus.none;

  @observable
  ObservableList<Pessoa> list = new ObservableList<Pessoa>();

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
  Future<void> addPessoa(Pessoa pessoa) async {
    status = AppStatus.loading;
    try {
      final request = await repository.createPessoa(pessoa);
      status = AppStatus.success;
    } catch(e) {
      status = AppStatus.error..value = e;
    }
  }
}