import 'Area.dart';

class Location {
  int id;
  String latitude;
  String longitude;
  Area area;
  Risco risco;


  Location({this.id, this.latitude, this.longitude, this.area});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    area = json['Area'] != null ? new Area.fromJson(json['Area']) : null;
    risco = json['Risco'] != null ? json['Risco'] : Risco.minimo;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    if (this.area != null) {
      data['Area'] = this.area.toJson();
    }
    data['Risco'] = this.risco;
    return data;
  }
}

enum Risco {
  minimo,
  baixo,
  medio,
  alto,
  muito_alto
}