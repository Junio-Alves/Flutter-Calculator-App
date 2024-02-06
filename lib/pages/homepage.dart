import 'package:calculadora/widgets/deletebutton.dart';
import 'package:calculadora/widgets/equalsbutton.dart';
import 'package:calculadora/functions/history.dart';
import 'package:calculadora/widgets/numberbutton.dart';
import 'package:calculadora/functions/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

bool darktheme = false;

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
  void initState() {
    // define o thema padrão como branco
    switchTheme('white');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      //APPBAR
      appBar: AppBar(
        title: Text(
          "Calculadora",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w700, color: textColor),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          //ABOUT
          IconButton(
            onPressed: () {},
            //botão que vai para tela de about do projeto
            icon: Icon(
              Icons.question_mark_outlined,
              color: textColor,
            ),
          ),
          //MUDAR DE TEMA(FUTURO)
          IconButton(
            onPressed: () {
              setState(() {
                darktheme == true ? switchTheme('white') : switchTheme('dark');
              });
            },
            //botão para mudar tema
            icon: Icon(
              Icons.dark_mode_outlined,
              color: textColor,
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
                                          fontSize: 24, color: historyColor),
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
                        style: TextStyle(
                          color: textColor,
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
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: scaffoldColor,
              ),
              child: Column(
                children: [
                  Expanded(
                    //Todos os botões
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const BuildButton(button: "C", color: Colors.red),
                        BuildButton(button: "(", color: functionButtonColor),
                        BuildButton(button: ")", color: functionButtonColor),
                        BuildButton(button: "/", color: functionButtonColor),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildButton(button: "7", color: textColor),
                        BuildButton(button: "8", color: textColor),
                        BuildButton(button: "9", color: textColor),
                        BuildButton(button: "*", color: functionButtonColor),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildButton(button: "4", color: textColor),
                        BuildButton(button: "5", color: textColor),
                        BuildButton(button: "6", color: textColor),
                        BuildButton(button: "-", color: functionButtonColor),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildButton(button: "1", color: textColor),
                        BuildButton(button: "2", color: textColor),
                        BuildButton(button: "3", color: textColor),
                        BuildButton(button: "+", color: functionButtonColor),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildButton(button: "0", color: textColor),
                        DeleteButton(
                          color: textColor,
                        ),
                        BuildButton(button: ".", color: textColor),
                        //Botão = com widget personalizado só para ele
                        EqualsButton(
                          button: "=",
                          color: textColor,
                          borderColor: borderColor,
                        ),
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
