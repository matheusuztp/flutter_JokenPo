import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController controllerA = TextEditingController();
  TextEditingController controllerG = TextEditingController();

  var resultado = "";

  void calcular(){

    String mensagem = "";

    if(controllerG.text.isEmpty || controllerA.text.isEmpty
    || controllerG.text.endsWith("0") || controllerA.text.endsWith("0")) {
      mensagem = "Defina o valor para ${(controllerA.text.isEmpty
          ? "Álcool"
          : "Gasolina")}";
      return;
    }

    if(controllerG.text.contains(',')) {
      controllerG.text = controllerG.text.replaceAll(',', ".");
    }

    if(controllerA.text.contains(',')) {
      controllerA.text = controllerA.text.replaceAll(',', '.');
    }

    double alcool = double.parse( controllerA.text );
    double gasolina = double.parse( controllerG.text );

    if(alcool.isNegative || gasolina.isNegative) {
      mensagem = "Valor para ${(alcool.isNegative
          ? "Álcool"
          : "Gasolina")} não pode ser negativo!";
      return;
    }

    mensagem = "Melhor abastecer com ${((alcool / gasolina) >= 0.7 ? "Gasolina" : "Álcool")}";

    setState(() {
      this.resultado = mensagem;
    });

    limpar();

  }

  void limpar(){
    setState(() {
      controllerG.text = "";
      controllerA.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para o abastecimento do seu carro.",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Alcool, ex: RS 4.63",
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: controllerA,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Gasolina, ex: RS 5.78",
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: controllerG,
              ),
              Padding(
                padding: EdgeInsets.only(top:  10),
                child: ElevatedButton(
                  child: Text("Calcular"),
                  onPressed: () => calcular(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  resultado,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
