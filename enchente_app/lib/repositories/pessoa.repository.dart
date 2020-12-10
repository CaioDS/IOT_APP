import 'dart:convert';

import 'package:enchente_app/models/Pessoa.dart';
import 'package:http/http.dart' as http;

class PessoaRepository {
  var url = "http://192.168.1.2:5001/api/pessoa";
  List<Pessoa> pessoa = new List<Pessoa>();

  Future<List<Pessoa>> getAll() async {
    final response = await http.get(url);
    switch (response.statusCode){
      case 200:
        List<Pessoa> data = (json.decode(response.body) as List).map((e) => Pessoa.fromJson(e)).toList();
        return data;
      default:
        return new List<Pessoa>();
    }
  }
  
  Future<void> createPessoa(Pessoa pessoa) async {
    Map<String, String> headers = {
      "Content-Type": "application/json"
    };
    final body = await jsonEncode({
      "Nome": pessoa.nome,
      "Telefone": pessoa.telefone
    });
    final response = await http.post(url, headers: headers, body: body);
    switch (response.statusCode){
      case 200:
        return response.contentLength;
      default:
        return new List<Pessoa>();
    }
  }

  Future<void> deletePessoa(int id) async {
    Map<String, String> headers = {
      "Content-Type": "application/json"
    };
    final body = await jsonEncode({
      "Id": id,
    });
    final response = await http.delete(url+"/"+id.toString(), headers: headers);
    switch (response.statusCode){
      case 200:
        return response.contentLength;
      default:
        return "Não foi possível excluir";
    }
  }
}