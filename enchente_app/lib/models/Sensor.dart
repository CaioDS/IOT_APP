import 'Location.dart';

class Sensor {
  int id;
  String nome;
  Location location;

  Sensor({this.id, this.nome, this.location});

  Sensor.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    nome = json['Nome'];
    location = json['Location'] != null
        ? new Location.fromJson(json['Location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Nome'] = this.nome;
    if (this.location != null) {
      data['Location'] = this.location.toJson();
    }
    return data;
  }
}
