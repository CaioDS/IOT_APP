import 'package:enchente_app/controllers/pessoa.controller.dart';
import 'package:enchente_app/models/Pessoa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadastroPessoaView extends StatefulWidget {
  @override
  _CadastroPessoaViewState createState() => _CadastroPessoaViewState();
}

class _CadastroPessoaViewState extends State<CadastroPessoaView> {
  final pessoaController = new PessoaController();
  Pessoa pessoa = new Pessoa();
  // VARIAVEIS
  final _Nome = TextEditingController();
  final _Telefone = TextEditingController();
  var _infoText = "Informe seus dados!";
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro Pessoa"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
              onPressed: _resetFields)
        ],
      ),
      body: _body(),
    );
  }

  // PROCEDIMENTO PARA LIMPAR OS CAMPOS
  void _resetFields(){
    _Nome.text = "";
    _Telefone.text = "";
    setState(() {
      _infoText = "Informe seus dados!";
      _formKey = GlobalKey<FormState>();
    });
  }

  _body() {
    return SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _editTextNome("Nome", _Nome),
              _editTextTelefone("Telefone", _Telefone),

              _buttonCadastrar(),
              _textInfo(),
            ],
          ),
        ));
  }

  // Widget text
  _editTextNome(String field, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      validator: (s) => _validate(s, field),
      keyboardType: TextInputType.text,
      style: TextStyle(
        fontSize: 22,
        color: Colors.teal,
      ),
      decoration: InputDecoration(
        labelText: field,
        labelStyle: TextStyle(
          fontSize: 22,
          color: Colors.grey,
        ),
      ),
    );
  }
  _editTextTelefone(String field, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      validator: (s) => _validate(s, field),
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: 22,
        color: Colors.teal,
      ),
      decoration: InputDecoration(
        labelText: field,
        labelStyle: TextStyle(
          fontSize: 22,
          color: Colors.grey,
        ),
      ),
    );
  }


  // PROCEDIMENTO PARA VALIDAR OS CAMPOS
  String _validate(String text, String field) {
    if (text.isEmpty) {
      return "Digite $field";
    }
    return null;
  }

  // Widget button
  _buttonCadastrar() {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 20),
      height: 45,
      child: RaisedButton(
        color: Colors.blueGrey,
        child:
        Text(
          "Cadastrar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        onPressed: () {
          if(_formKey.currentState.validate()){
            _cadastrar();
          }
        },
      ),
    );
  }

  // CADASTRA PESSOA
  void _cadastrar(){
    setState(() {
      String nome = _Nome.text;
      String telefone = _Telefone.text;
      pessoa.nome = nome;
      pessoa.telefone = telefone;
    });

    pessoaController.addPessoa(pessoa);
  }

  // // Widget text
  _textInfo() {
    return Text(
      _infoText,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.blueGrey, fontSize: 22.0),
    );
  }
}