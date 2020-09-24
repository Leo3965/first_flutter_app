import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: paginaPrincipal(),
    );
  }

  paginaPrincipal() {
    return Scaffold(
      appBar: barraPrincipal(),
      body : Container(
        child: textoPrincipal(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: clicouActionButton,
        child: Icon(Icons.add),
      ),
    );
  }

  clicouActionButton(){
    print(" Clicou ");
  }

  barraPrincipal() {
    return AppBar(
      title: Text("Hello World"),
      centerTitle: true,
      backgroundColor: Colors.grey,
    );
  }

  textoPrincipal() {
    return Text(
      "Goodbye World",
      style: estiloTexto(40, true, Colors.red)
    );
  }
}

estiloTexto(var tam, bool negrito, Color cor){
  return TextStyle(
    color: cor,
    fontWeight: negrito?FontWeight.bold:FontWeight.normal,
    fontSize: tam,
  );
}
