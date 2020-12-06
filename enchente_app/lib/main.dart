
import 'package:enchente_app/views/cadastro.pessoa.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

        return MaterialApp(
          title: 'Lista',
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            scaffoldBackgroundColor: Colors.blueGrey[50],
            primarySwatch: Colors.blueGrey,

          ),
          home: CadastroPessoaView(),
        );

  }
}