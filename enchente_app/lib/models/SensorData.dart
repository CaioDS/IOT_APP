import 'Sensor.dart';

class SensorData{
  int id;
  Nivel nivel;
  DateTime data;
  Sensor sensor;

  SensorData({this.id, this.nivel, this.data, this.sensor});

  SensorData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    nivel = json['Nivel'] != null ? json["Nivel"] : Nivel.minimo;
    data = json['Data'];
    sensor = json['Sensor'] != null ? new Sensor.fromJson(json['Sensor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Nivel'] = this.nivel;
    data['Data'] = this.data;
    if (this.sensor != null) {
      data['Sensor'] = this.sensor.toJson();
    }
    return data;
  }
}

enum Nivel {
  minimo,
  baixo,
  baixo_medio,
  medio,
  alto_medio,
  alto
}