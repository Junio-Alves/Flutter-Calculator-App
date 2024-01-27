import 'package:calculadora/widgets/equalsbutton.dart';
import 'package:calculadora/widgets/numberbutton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String numero = '';

  editNumeroText(String newNumero) {
    setState(() {
      numero += newNumero;
    });
  }

  clearText() {
    setState(() {
      numero = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          "Calculadora",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.grey[300],
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            //botão que vai para tela de about do projeto
            icon: const Icon(Icons.question_mark_outlined),
          ),
          IconButton(
            onPressed: () {},
            //botão para mudar tema
            icon: const Icon(Icons.dark_mode_outlined),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Caixa de texto onde mostra o calculo/resultado
                Text(
                  numero,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0)),
              child: const Column(
                children: [
                  Expanded(
                    //Todos os botões
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildButton(button: "C", color: Colors.red),
                        BuildButton(button: "(", color: Colors.greenAccent),
                        BuildButton(button: ")", color: Colors.greenAccent),
                        BuildButton(button: "/", color: Colors.greenAccent),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildButton(button: "7", color: Colors.black),
                        BuildButton(button: "8", color: Colors.black),
                        BuildButton(button: "9", color: Colors.black),
                        BuildButton(button: "*", color: Colors.greenAccent),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildButton(button: "4", color: Colors.black),
                        BuildButton(button: "5", color: Colors.black),
                        BuildButton(button: "6", color: Colors.black),
                        BuildButton(button: "-", color: Colors.greenAccent),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildButton(button: "1", color: Colors.black),
                        BuildButton(button: "2", color: Colors.black),
                        BuildButton(button: "3", color: Colors.black),
                        BuildButton(button: "+", color: Colors.greenAccent),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildButton(button: "0", color: Colors.black),
                        BuildButton(button: "00", color: Colors.black),
                        BuildButton(button: ".", color: Colors.greenAccent),
                        //Botão = com widget personalizado só para ele
                        EqualsButton(button: "=", color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
