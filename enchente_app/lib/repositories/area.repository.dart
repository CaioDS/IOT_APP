import 'dart:convert';

import 'package:enchente_app/models/Area.dart';
import 'package:http/http.dart' as http;

class AreaRepository {
  var url = "http://192.168.1.2:5001/api/area";
  List<Area> area = new List<Area>();

  Future<List<Area>> getAll() async {
    final response = await http.get(url);
    switch (response.statusCode) {
      case 200:
        List<Area> data = (json.decode(response.body) as List)
            .map((e) => Area.fromJson(e))
            .toList();
        return data;
      default:
        return new List<Area>();
    }
  }

  Future<void> createArea(Area area) async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    final body =
        await jsonEncode({"Nome": area.nome});
    final response = await http.post(url, headers: headers, body: body);
    switch (response.statusCode) {
      case 200:
        return response.contentLength;
      default:
        return new List<Area>();
    }
  }

  Future<void> deleteArea(int id) async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    final body = await jsonEncode({
      "Id": id,
    });
    final response =
        await http.delete(url + "/" + id.toString(), headers: headers);
    switch (response.statusCode) {
      case 200:
        return response.contentLength;
      default:
        return "Não foi possível excluir";
    }
  }
}
