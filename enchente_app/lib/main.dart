import 'package:enchente_app/views/cadastro.pessoa.view.dart';
import 'package:enchente_app/views/maps.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MapsView());

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
        body: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
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
                    width: 50,
                    child: Text("Maps"),
                  ),
                  color: Colors.lightBlueAccent,
                  onPressed: () => Navigator.pushNamed(context, '/maps'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: FloatingActionButton(
                  child: Container(
                    width: 50,
                    child: Text("Aqui tem um texto"),
                  ),
                  backgroundColor: Colors.blueAccent,
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MapsView())),
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
                    width: 50,
                    child: Text("Aqui tem um texto"),
                  ),
                  color: Colors.lightBlueAccent,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: RaisedButton(
                  child: Container(
                    width: 50,
                    child: Text("Aqui tem um texto"),
                  ),
                  color: Colors.lightBlueAccent,
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
