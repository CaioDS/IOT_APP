import 'Area.dart';
import 'Pessoa.dart';

class AreasPessoa {
  int id;
  Pessoa pessoa;
  Area area;

  AreasPessoa({this.id, this.pessoa, this.area});

  AreasPessoa.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    pessoa =
        json['Pessoa'] != null ? new Pessoa.fromJson(json['Pessoa']) : null;
    area = json['Area'] != null ? new Area.fromJson(json['Area']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    if (this.pessoa != null) {
      data['Pessoa'] = this.pessoa.toJson();
    }
    if (this.area != null) {
      data['Area'] = this.area.toJson();
    }
    return data;
  }
}
