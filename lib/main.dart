import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  )); // MaterialApp
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var imagemApp = AssetImage("images/padrao.png");
  var mensagem = "Escolha uma das opções abaixo:";


  void opcaoImagem(String escolhaUsuario){

      var opcao = ["pedra", "papel", "tesoura"];
      var numero = Random().nextInt(3);

      var escolhidoApp = opcao[numero];

      setState(() {
        imagemApp = AssetImage("images/${escolhidoApp}.png");
      });

      if(escolhaUsuario == "pedra" && escolhidoApp == "tesoura"
      || escolhaUsuario == "tesoura" && escolhidoApp == "papel"
      || escolhaUsuario == "papel" && escolhidoApp == "pedra")
        this.mensagem = "Parabéns! Você Ganhou :)";

      else if(escolhaUsuario == "tesoura" && escolhidoApp == "pedra"
          || escolhaUsuario == "papel" && escolhidoApp == "tesoura"
          || escolhaUsuario == "pedra" && escolhidoApp == "papel")
        this.mensagem = "Poxa! Você Perdeu :(";

      else
        this.mensagem = "Empatamos!";

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this.mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => opcaoImagem("pedra"),
                child: Image.asset("images/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () => opcaoImagem("papel"),
                child: Image.asset("images/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () => opcaoImagem("tesoura"),
                child: Image.asset("images/tesoura.png", height: 100),
              ),
            ],
          )
        ],
      ),
    );
  }
}
