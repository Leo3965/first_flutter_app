import 'package:first_flutter_app/utils/componentes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController txtPeso   = TextEditingController();
  TextEditingController txtAltura = TextEditingController();
  GlobalKey<FormState> cForm = GlobalKey<FormState>();
  String info = "Informe os seus dados";

  Function validaPeso = ((value){
    if(value.isEmpty){
      return "Informe o Peso";
    }
    if(int.parse(value) <=0){
      return "O peso não deve ser zero ou negativo";
    }
    return null;
  });

  Function validaAltura = ((value){
    if(value.isEmpty){
      return "Informe a Altura";
    }
    if(double.parse(value) <=0){
      return "A altura não deve ser zero ou negativo";
    }
    return null;
  });

  resetaForm(){
    txtPeso.text="";
    txtAltura.text="";
    setState(() {
      info = "Informe os seus dados";
      cForm = GlobalKey<FormState>();
    });

  }

  calcularImc(){
    setState(() {
      if(!cForm.currentState.validate()){
        return null;
      }
      double p = double.parse(txtPeso.text);
      double a = double.parse(txtAltura.text);
      double imc = p/(a*a);
      if(imc < 18.5)
        info = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
      else
      if(imc >= 18.5 && imc < 30)
        info = "Peso ideal (${imc.toStringAsPrecision(4)})";
      else
        info = "Acima do peso (${imc.toStringAsPrecision(4)})";
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: telaPrincipal(),
    );
  }

  telaPrincipal() {
    return Scaffold(
      appBar: AppBar(
        title: Text("IMC Flutter"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: resetaForm,
          ),
        ],
      ),
      body: Form(
        key: cForm,
        child: Container(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Componentes.caixaDeTexto("Peso", "Digite o Peso", txtPeso, validaPeso, numero: true),
              Componentes.caixaDeTexto("Altura", "Digite a Altura", txtAltura, validaAltura, numero: true),
              Componentes.botao("Calcular", calcularImc),
              Text(
                info,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
