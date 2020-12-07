class Pessoa {
  int id;
  String nome;
  String telefone;

  Pessoa({this.id, this.nome, this.telefone});

  Pessoa.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    nome = json['Nome'];
    telefone = json['Telefone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Nome'] = this.nome;
    data['Telefone'] = this.telefone;
    return data;
  }
}