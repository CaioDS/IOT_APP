


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadastroSensorView extends StatefulWidget {
  @override
  _CadastroSensorViewState createState() => _CadastroSensorViewState();
}

class _CadastroSensorViewState extends State<CadastroSensorView> {

  // VARIAVEIS
  final _NomeSensor = TextEditingController();
  final _Latitude = TextEditingController();
  final _Longitude = TextEditingController();
  var _infoText = "Informe seus dados!";
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro Sensor"),
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
    _NomeSensor.text = "";
    _Latitude.text = "";
    _Longitude.text = "";
    setState(() {
      _infoText = "Informe os dados do Sensor!";
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
              _editText("Nome do Sensor", _NomeSensor),
              _editText("Latitude", _Latitude),
              _editText("Longitude", _Longitude),

              _buttonCadastrar(),
              _textInfo(),
            ],
          ),
        ));
  }

  // Widget text
  _editText(String field, TextEditingController controller) {
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

  // CADASTRA SENSOR
  void _cadastrar(){
    setState(() {
      String nomeSensor = _NomeSensor.text;
      String latitude = _Latitude.text;
      String longitude = _Longitude.text;

    });
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