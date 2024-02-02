import 'package:calculadora/widgets/equalsbutton.dart';
import 'package:calculadora/functions/history.dart';
import 'package:calculadora/widgets/numberbutton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String numero = '';
  Historico historico = Historico();

  editNumeroText(String newNumero) {
    setState(() {
      numero += newNumero;
      historico.concatStrings(newNumero);
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
      //APPBAR
      appBar: AppBar(
        title: const Text(
          "Calculadora",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.grey[300],
        centerTitle: true,
        actions: [
          //ABOUT
          IconButton(
            onPressed: () {},
            //botão que vai para tela de about do projeto
            icon: const Icon(Icons.question_mark_outlined),
          ),
          //MUDAR DE TEMA(FUTURO)
          IconButton(
            onPressed: () {},
            //botão para mudar tema
            icon: const Icon(Icons.dark_mode_outlined),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth:
                              370, // Defina o tamanho máximo do contêiner conforme necessário
                          maxHeight:
                              200.0, // Defina a altura máxima do contêiner conforme necessário
                        ),
                        child: ListView.builder(
                            itemCount: historico.getHistoricosList().length,
                            itemBuilder: (context, int index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    historico.getHistoricosList()[index],
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.grey[500]),
                                  )
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        numero,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
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
