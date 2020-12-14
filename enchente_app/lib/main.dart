import 'package:enchente_app/views/cadastro.pessoa.view.dart';
import 'package:enchente_app/views/cadastro.sensor.view.dart';
import 'package:enchente_app/views/maps.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
      routes: {
        'maps': (context) => MapsView(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
          centerTitle: true,
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: RaisedButton(
                  child: Container(
                    width: 70,
                    child: Text("Maps"),
                  ),
                  color: Colors.lightBlueAccent,
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MapsView())),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: RaisedButton(
                  child: Container(
                    width: 70,
                    child: Text("Cadastrar Pessoa"),
                  ),
                  color: Colors.lightBlueAccent,
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CadastroPessoaView())),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: RaisedButton(
                  child: Container(
                    width: 100,
                    child: Text("Cadastrar Sensor"),
                  ),
                  color: Colors.lightBlueAccent,
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CadastroSensorView())),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40),
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  endIndent: 50,
                  indent: 50,
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Áreas",
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: 300,
                        height: 350,
                        child: GridView.builder(
                            itemCount: 10,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 20.0,
                            ),
                            itemBuilder: (context, index) {
                              return Card(
                                child: Container(
                                  child: Text("dsfsdfdsdfdsfdsfdsfdss"),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  
}
