import 'package:calculadora/widgets/deletebutton.dart';
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
  List<String> numeroDigito = [];
  Historico historico = Historico();

  editNumeroText(String newNumero) {
    setState(() {
      numeroDigito.add(newNumero);
      historico.concatStrings(newNumero);
    });
  }

  clearText() {
    setState(() {
      numeroDigito.clear();
    });
  }

  deleteLastDigit() {
    setState(() {
      numeroDigito.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 35, 66),
      //APPBAR
      appBar: AppBar(
        title: const Text(
          "Calculadora",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          //ABOUT
          IconButton(
            onPressed: () {},
            //botão que vai para tela de about do projeto
            icon: const Icon(
              Icons.question_mark_outlined,
              color: Colors.white,
            ),
          ),
          //MUDAR DE TEMA(FUTURO)
          IconButton(
            onPressed: () {},
            //botão para mudar tema
            icon: const Icon(
              Icons.dark_mode_outlined,
              color: Colors.white,
            ),
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
                      GestureDetector(
                        onLongPress: () {
                          //limpar historico popup
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Limpar historico'),
                                content:
                                    const Text('Deseja Limpar o historico?'),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            historico.clearHistoricoList();
                                            Navigator.of(context)
                                                .pop(); // Fechar o popup
                                          });
                                        },
                                        child: const Text('Limpar'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            Navigator.of(context)
                                                .pop(); // Fechar o popup
                                          });
                                        },
                                        child: const Text('Fechar'),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
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
                                          fontSize: 24,
                                          color: Colors.grey.withOpacity(0.2)),
                                    )
                                  ],
                                );
                              }),
                        ),
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
                        numeroDigito.join(),
                        style: const TextStyle(
                          color: Colors.white,
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
                  color: const Color.fromARGB(255, 48, 54, 116),
                  borderRadius: BorderRadius.circular(30.0)),
              child: const Column(
                children: [
                  Expanded(
                    //Todos os botões
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildButton(button: "C", color: Colors.red),
                        BuildButton(button: "(", color: Colors.amber),
                        BuildButton(button: ")", color: Colors.amber),
                        BuildButton(button: "/", color: Colors.amber),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildButton(button: "7", color: Colors.white),
                        BuildButton(button: "8", color: Colors.white),
                        BuildButton(button: "9", color: Colors.white),
                        BuildButton(button: "*", color: Colors.amber),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildButton(button: "4", color: Colors.white),
                        BuildButton(button: "5", color: Colors.white),
                        BuildButton(button: "6", color: Colors.white),
                        BuildButton(button: "-", color: Colors.amber),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildButton(button: "1", color: Colors.white),
                        BuildButton(button: "2", color: Colors.white),
                        BuildButton(button: "3", color: Colors.white),
                        BuildButton(button: "+", color: Colors.amber),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildButton(button: "0", color: Colors.white),
                        DeleteButton(),
                        BuildButton(button: ".", color: Colors.white),
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
