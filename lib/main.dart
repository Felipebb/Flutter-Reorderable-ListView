import 'package:flutter/material.dart';
import 'package:reorderable_list/constants.dart';
import 'package:reorderable_list/teste_model.dart';
import 'package:reorderables/reorderables.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData myAppTheme = buildTheme();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: myAppTheme,
      home: MyHomePage(title: 'Priorização da Solicitação'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _rows;
  List<Materias> materias; //Lista de objetos Materias
  @override
  void initState() {
    super.initState();
    materias = [
      Materias(id: "1",
          curso: "Curso de Técnico",
          materia: "ANA0001- Software I (Turma A)",
          professor: "Prof. Milton"),
      Materias(id: "2",
          curso: "Curso de Técnico",
          materia: "ANA0001- Hardware I (Turma C)",
          professor: "Prof. Elina "),
      Materias(id: "3",
          curso: "Curso de Técnico",
          materia: "MED0093 - Arquitetura (Turma A)",
          professor: "Prof. Sandra"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _rows = List<Widget>.generate(materias.length,
            (index) => Padding(
              // O primeiro parâmetro, length, especifica o tamanho da lista;
              // O segundo parâmetro é a função generator que gera a lista de valores, atribuindo uma chave de valor unica (index) a cada elemento da lista a ser gerada; Nesse caso gera uma lista de widgets de tamanho ja especificado em length
          key: UniqueKey(),
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [kDefaultShadow],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(child: Text(materias[index].curso,style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.w500))),
                      Expanded(child: Text(materias[index].materia, style: TextStyle(fontSize: 18),)),
                      Expanded(child: Text(materias[index].professor,style: TextStyle(fontSize: 14,color: Colors.grey),)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(color: Color.fromRGBO(219, 180, 124, 20.0),borderRadius: BorderRadius.circular(22),  boxShadow: [kDefaultShadow],),
                      height: 40,
                      width: 40,
                      child: Center(child: Text(index.toString(),style: TextStyle(color: Colors.white),))),
                ),//materias[index].id
              ],
            ),
          ),
        ));

    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        final Materias materia = materias.removeAt(oldIndex);
        materias.insert(newIndex, materia);
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
     ),
    body:
     ReorderableColumn(
      header: Center(
        child: Column(children: <Widget>[
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: Text("Arraste as turmas abaixo para trocar a prioridade", style: TextStyle(color: Color.fromRGBO(219, 180, 124, 20.0),fontSize: 16,fontWeight: FontWeight.w600),)),
              ),
            ],),
      ),
      footer: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            RaisedButton(onPressed: ()=>{},child: Text("Salvar e Finalizar",style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),),color: myprimaricolor),
          ],
        ),
      ),
      children: _rows,
      onReorder: _onReorder,
       mainAxisSize: MainAxisSize.max,

     ),
    );
  }
}

ThemeData buildTheme() {
  const myPrimaryColor = const Color(0xFF1d436f);
  const myAccentColor = const Color(0xFF778ea9);
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: myAccentColor,
    primaryColor: myPrimaryColor,
  );
}