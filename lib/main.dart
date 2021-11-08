import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de control de notas',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String nombres = "";
  String curso = "";
  double nota1 = 0;
  double nota2 = 0;
  double nota3 = 0;
  double nota4 = 0;
  double promedio = 0;
  String mensaje = "";
  bool validacion = false;
  String title = "Registro de notas del alumno";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _tfNombres = TextEditingController();
  final _tfCurso = TextEditingController();
  final _tfNota1 = TextEditingController();
  final _tfNota2 = TextEditingController();
  final _tfNota3 = TextEditingController();
  final _tfNota4 = TextEditingController();

  void _calcularNotas() {
    setState(() {
      widget.validacion = false;
      if (_tfNota1.text.toString() == "" ||
          _tfNota2.text.toString() == "" ||
          _tfNota3.text.toString() == "" ||
          _tfNota4.text.toString() == "") {
        widget.validacion = true;
        widget.mensaje = "Falta ingresar la nota";
        return;
      }

      widget.nota1 = double.parse(_tfNota1.text.toString());
      widget.nota2 = double.parse(_tfNota2.text.toString());
      widget.nota3 = double.parse(_tfNota3.text.toString());
      widget.nota4 = double.parse(_tfNota4.text.toString());
      widget.promedio =
          (widget.nota1 + widget.nota2 + widget.nota3 + widget.nota4) / 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                  "Por completa los datos para realizar el calculo de las notas del alumno",
                  style: TextStyle(fontSize: 14)),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: <
                      Widget>[
                TextField(
                  controller: _tfNombres,
                  decoration: InputDecoration(
                    hintText: "Nombres",
                    labelText: "Nombres",
                  ),
                ),
                TextField(
                  controller: _tfCurso,
                  decoration: InputDecoration(
                    hintText: "Curso",
                    labelText: "Curso",
                  ),
                ),
                TextField(
                  controller: _tfNota1,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: "Nota 1",
                    labelText: "Nota 1",
                    errorText:
                        _tfNota1.text.toString() == "" ? widget.mensaje : null,
                  ),
                ),
                TextField(
                  controller: _tfNota2,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: "Nota 2",
                    labelText: "Nota 2",
                    errorText:
                        _tfNota2.text.toString() == "" ? widget.mensaje : null,
                  ),
                ),
                TextField(
                  controller: _tfNota3,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: "Nota 3",
                    labelText: "Nota 3",
                    errorText:
                        _tfNota3.text.toString() == "" ? widget.mensaje : null,
                  ),
                ),
                TextField(
                  maxLength: 5,
                  controller: _tfNota4,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: "Nota 4",
                    labelText: "Nota 4",
                    errorText:
                        _tfNota4.text.toString() == "" ? widget.mensaje : null,
                  ),
                ),
                Text(
                  "Promedio:" + widget.promedio.toString(),
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  color: Colors.amber,
                  child: Text(
                    "Calcular",
                    style: TextStyle(fontSize: 18, fontFamily: 'rbold'),
                  ),
                  onPressed: _calcularNotas,
                ),
              ]),
            )
          ],
        ));
  }
}
